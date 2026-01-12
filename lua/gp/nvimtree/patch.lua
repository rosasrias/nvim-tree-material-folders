-- =========================================================
-- This module monkey-patches nvim-tree DirectoryNode
-- to provide VSCode-like folder icons & highlights.
--
-- Resolution order:
--   1. Path-based family match (src/api/**)
--   2. Name-based family match (components, services, etc)
--   3. Depth-based icon + color variants
--
-- This file is intentionally isolated to keep side-effects
-- contained and auditable.
-- =========================================================

local DirectoryNode = require("nvim-tree.node.directory")

local by_path = require("gp.nvimtree.match_path")
local by_name = require("gp.nvimtree.match_name")
local depth = require("gp.nvimtree.depth")
local hl = require("gp.nvimtree.highlights")
local icons = require("gp.nvimtree.icons")
local cache = require("gp.nvimtree.cache")

-- Preserve original implementation to fallback safely
local original_highlighted_icon = DirectoryNode.highlighted_icon

local M = {}

-- =========================================================
-- Patch application
-- =========================================================

---Apply gp-nvim-tree-icons patch.
---
---Overrides `DirectoryNode:highlighted_icon()` to inject:
--- - semantic family resolution
--- - depth-aware icon variants
--- - depth-aware highlight groups
--- - cached resolution per absolute path
---
---This function is idempotent and should be called once
---during plugin setup.
function M.apply()
	---@diagnostic disable-next-line: duplicate-set-field
	function DirectoryNode:highlighted_icon()
		-- Call original nvim-tree implementation first
		local res = original_highlighted_icon(self)

		-- =====================================================
		-- Cached semantic resolution
		-- =====================================================
		local cached = cache.resolve(self, function()
			---@type GpFolderFamily|nil
			local family = by_path.resolve(self) or by_name.resolve(self.name)
			if not family then
				return
			end

			-- -----------------------------
			-- Icon resolution
			-- -----------------------------
			local icon_set = icons[family.icon_key]
			local icon

			if icon_set then
				icon = depth.icon(self, family, icon_set) or (self.open and icon_set.open) or icon_set.default
			end

			-- -----------------------------
			-- Highlight resolution
			-- -----------------------------
			local highlight = hl.resolve(self, family)

			return {
				family = family,
				icon = icon,
				hl = highlight,
			}
		end)

		-- If nothing was resolved, fallback to nvim-tree default
		if not cached then
			return res
		end

		-- =====================================================
		-- Apply cached result
		-- =====================================================
		if cached.icon then
			res.str = cached.icon
		end

		if cached.hl then
			res.hl = { cached.hl }
		end

		return res
	end
end

return M
