local config = require("gp.nvimtree.config")
local palette = require("gp.nvimtree.palette")

---@type table<string, string>
local groups = {}

local M = {}

-- =========================================================
-- Highlight group creation
-- =========================================================

---Create highlight groups for all families
function M.setup()
  for family, color in pairs(palette) do
    local group = "GpNvimTree" .. family:sub(1, 1):upper() .. family:sub(2)
    groups[family] = group

    vim.api.nvim_set_hl(0, group, {
      fg = color,
      bold = true,
    })
  end

  -- Neutral file highlight (important)
  vim.api.nvim_set_hl(0, "GpNvimTreeFile", {
    fg = "#CDD6F4",
  })

  -- Entry files (index, main, app, etc)
  vim.api.nvim_set_hl(0, "GpNvimTreeEntryFile", {
    fg = "#F38BA8",
    bold = true,
  })
end

-- =========================================================
-- Highlight resolver
-- =========================================================

---Resolve highlight group for a node
---@param node table
---@param family table
---@return string|nil
function M.resolve(_, family)
  if not config.options.enable_colors then
    return nil
  end

  return groups[family.icon_key]
end

return M
