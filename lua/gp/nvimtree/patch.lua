-- =========================================================
-- This module monkey-patches nvim-tree DirectoryNode
-- to provide VSCode-like folder icons & highlights.
-- =========================================================

local DirectoryNode = require("nvim-tree.node.directory")

local by_path = require("gp.nvimtree.match_path")
local by_name = require("gp.nvimtree.match_name")
local depth = require("gp.nvimtree.depth")
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
			local family = by_path.resolve(self) or by_name.resolve(self.name)
			if not family then
				return
			end

			local icon_set = icons[family.icon_key]
			local icon

			if icon_set then
				icon =
					depth.icon(self, family, icon_set)
					or (self.open and icon_set.open)
					or icon_set.default
			end

			local highlight = hl.resolve(self, family)

			return {
				family = family,
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
-- Name patch (same cache, no recompute)
-- =====================================================
---@diagnostic disable-next-line: duplicate-set-field
function DirectoryNode:highlighted_name()
	local res = original_name(self)

	local cached = cache.resolve(self)
	if not cached or not cached.hl then
		return res
	end

	-- nvim-tree expects a TABLE of highlights
	res.hl = { cached.hl }

	return res
end
end

return M
