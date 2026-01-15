-- =========================================================
-- Monkey-patch for nvim-tree DirectoryNode
-- Applies semantic icons & highlights
-- =========================================================

local DirectoryNode = require("nvim-tree.node.directory")

local resolver = require("nvim_tree_material_folders.resolver")
local hl = require("nvim_tree_material_folders.highlights")
local icons = require("nvim_tree_material_folders.icons")
local cache = require("nvim_tree_material_folders.cache")

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
			local semantic = resolver.resolve(self)
			if not semantic then
				return nil
			end

			local icon_set = icons[semantic.icon_key]
			if not icon_set then
				return nil
			end

			local icon = (self.open and icon_set.open) or icon_set.default
			if not icon then
				return nil
			end

			local highlight = hl.resolve(self, {
				icon_key = semantic.icon_key,
				color_key = semantic.color_key,
			})

			return {
				icon = icon,
				hl = highlight,
			}
		end)

		if not cached then
			return res
		end

		res.str = cached.icon

		if cached.hl then
			res.hl = { cached.hl }
		end

		return res
	end

	-- =====================================================
	-- Name patch (reuse same highlight)
	-- =====================================================
	---@diagnostic disable-next-line: duplicate-set-field
	function DirectoryNode:highlighted_name()
		local res = original_name(self)

		---@diagnostic disable-next-line: missing-parameter
		local cached = cache.resolve(self)
		if not cached or not cached.hl then
			return res
		end

		res.hl = { cached.hl }
		return res
	end
end

return M
