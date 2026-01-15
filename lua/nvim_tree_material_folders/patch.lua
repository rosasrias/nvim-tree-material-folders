-- =========================================================
-- nvim-tree DirectoryNode patch
--
-- This module monkey-patches nvim-tree in order to inject
-- semantic folder icons and highlights, mimicking the
-- behavior of VSCode / Material Icons.
--
-- Responsibilities:
--   - Resolve semantic icon + color via resolver.lua
--   - Apply icon + highlight to folders
--   - Reuse cached results for performance
--
-- This module does NOT:
--   - Decide semantics (resolver does)
--   - Define icons or colors
--   - Manage configuration
-- =========================================================

local DirectoryNode = require("nvim-tree.node.directory")

local resolver = require("nvim_tree_material_folders.resolver")
local icons = require("nvim_tree_material_folders.icons")
local hl = require("nvim_tree_material_folders.highlights")
local cache = require("nvim_tree_material_folders.cache")

-- Preserve original nvim-tree behavior
local original_icon = DirectoryNode.highlighted_icon
local original_name = DirectoryNode.highlighted_name

local M = {}

-- =========================================================
-- Patch application
-- =========================================================

---Apply monkey-patch to nvim-tree DirectoryNode.
---
---This function overrides:
---  - DirectoryNode:highlighted_icon()
---  - DirectoryNode:highlighted_name()
---
---The original behavior is preserved and used as fallback
---when no semantic match is found.
function M.apply()
	-- -----------------------------------------------------
	-- Icon patch
	-- -----------------------------------------------------
	---@diagnostic disable-next-line: duplicate-set-field
	function DirectoryNode:highlighted_icon()
		-- Start from original nvim-tree result
		local res = original_icon(self)

		-- Resolve semantic icon + highlight (cached)
		local cached = cache.resolve(self, function()
			-- -----------------------------------------
			-- Semantic resolution
			-- -----------------------------------------
			local sem = resolver.resolve(self)
			if not sem then
				return
			end

			-- -----------------------------------------
			-- Icon resolution
			-- -----------------------------------------
			local icon_set = icons[sem.icon_key]
			if not icon_set then
				return
			end

			-- -----------------------------------------
			-- Highlight resolution
			-- -----------------------------------------
			return {
				icon = self.open and icon_set.open or icon_set.default,
				hl = hl.resolve(self, { icon_key = sem.color_key }),
			}
		end)

		-- No semantic match → fallback to nvim-tree
		if not cached then
			return res
		end

		-- Apply semantic icon + highlight
		res.str = cached.icon
		res.hl = cached.hl and { { cached.hl } } or {}

		return res
	end

	-- -----------------------------------------------------
	-- Name patch
	-- -----------------------------------------------------
	---@diagnostic disable-next-line: duplicate-set-field
	function DirectoryNode:highlighted_name()
		-- Start from original nvim-tree result
		local res = original_name(self)

		-- Reuse cached highlight (do not recompute)
		---@diagnostic disable-next-line: missing-parameter
		local cached = cache.resolve(self)
		if cached and cached.hl then
			res.hl = cached.hl and { { cached.hl } } or {}
		end

		return res
	end
end

return M
