-- =========================================================
-- This module monkey-patches nvim-tree DirectoryNode
-- to provide VSCode-like folder icons & highlights.
--
-- CRITICAL RULES:
--  - Never return hl = { nil }
--  - Never override default behavior if resolution fails
--  - Full fallback to nvim-tree defaults
-- =========================================================

local DirectoryNode = require("nvim-tree.node.directory")

local families = require("nvim_tree_material_folders.families")
local by_path = require("nvim_tree_material_folders.match_path")
local by_name = require("nvim_tree_material_folders.match_name")
local by_sub = require("nvim_tree_material_folders.match_subfamily")
local hl = require("nvim_tree_material_folders.highlights")
local icons = require("nvim_tree_material_folders.icons")
local cache = require("nvim_tree_material_folders.cache")

-- Preserve original methods
local original_icon = DirectoryNode.highlighted_icon
local original_name = DirectoryNode.highlighted_name

local M = {}

function M.apply()
	-- =====================================================
	-- Icon patch
	-- =====================================================
	---@diagnostic disable-next-line: duplicate-set-field
	function DirectoryNode:highlighted_icon()
		-- Always start from nvim-tree default
		local res = original_icon(self)

		local cached = cache.resolve(self, function()
			-- 1. Resolve subfamily (most specific)
			local sub = by_sub.resolve(self)

			-- 2. Resolve base family
			local family = (sub and families[sub.inherits]) or by_path.resolve(self) or by_name.resolve(self.name)

			-- No semantic meaning → fallback completely
			if not family then
				return nil
			end

			-- 3. Resolve icon
			local icon_key = sub and sub.icon_key or family.icon_key
			local icon_set = icons[icon_key]
			if not icon_set then
				return nil
			end

			local icon = (self.open and icon_set.open) or icon_set.default
			if not icon then
				return nil
			end

			-- 4. Resolve highlight (SAFE)
			local color_key = sub and sub.color_key or family.icon_key
			local highlight = hl.resolve(self, {
				color_key = color_key,
			})

			return {
				icon = icon,
				hl = highlight, -- may be nil (this is OK)
			}
		end)

		-- No cache or invalid → fallback to default
		if not cached then
			return res
		end

		res.str = cached.icon

		-- Apply highlight ONLY if valid
		if cached.hl then
			res.hl = { cached.hl }
		end

		return res
	end

	-- =====================================================
	-- Name patch (reuse SAME highlight as icon)
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
