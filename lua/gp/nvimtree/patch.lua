-- =========================================================
-- This module monkey-patches nvim-tree DirectoryNode
-- to provide VSCode-like folder icons & highlights.
-- =========================================================

local DirectoryNode = require("nvim-tree.node.directory")

local by_path = require("gp.nvimtree.match_path")
local by_name = require("gp.nvimtree.match_name")
local by_sub = require("gp.nvimtree.match_subfamily")
local hl = require("gp.nvimtree.highlights")
local icons = require("gp.nvimtree.icons")
local cache = require("gp.nvimtree.cache")

-- Preserve originals
local original_icon = DirectoryNode.highlighted_icon
local original_name = DirectoryNode.highlighted_name

local M = {}

function M.apply()
  -- =====================================================
  -- Icon patch
  -- =====================================================
  ---@diagnostic disable-next-line: duplicate-set-field
  function DirectoryNode:highlighted_icon()
    local res = original_icon(self)

    local cached = cache.resolve(self, function()
      -- -----------------------------
      -- Resolve family & subfamily
      -- -----------------------------
      local family = by_path.resolve(self) or by_name.resolve(self.name)
      if not family then
        return
      end

      local sub = by_sub.resolve(self)

      -- -----------------------------
      -- Icon resolution
      -- -----------------------------
      local icon_key = sub and sub.icon_key or family.icon_key
      local icon_set = icons[icon_key]
      if not icon_set then
        return
      end

      local icon = (self.open and icon_set.open) or icon_set.default

      -- -----------------------------
      -- Highlight resolution
      -- -----------------------------
      -- subfamily can override color, otherwise fallback to family
      local color_family = sub or family
      local highlight = hl.resolve(self, color_family)

      return {
        icon = icon,
        hl = highlight,
      }
    end)

    if not cached then
      return res
    end

    if cached.icon then
      res.str = cached.icon
    end

    if cached.hl then
      res.hl = { cached.hl }
    end

    return res
  end

  -- =====================================================
  -- Name patch (same color as icon)
  -- =====================================================
  ---@diagnostic disable-next-line: duplicate-set-field
  function DirectoryNode:highlighted_name()
    local res = original_name(self)

    local cached = cache.resolve(self)
    if not cached or not cached.hl then
      return res
    end

    res.hl = { cached.hl }
    return res
  end
end

return M
