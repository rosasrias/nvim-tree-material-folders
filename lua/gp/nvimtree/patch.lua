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
			-- Resolve subfamily FIRST
			-- -----------------------------
			local sub = by_sub.resolve(self)

			-- -----------------------------
			-- Resolve base family
			-- -----------------------------
			local family
			if sub and sub.inherits then
				family = require("gp.nvimtree.families")[sub.inherits]
			else
				family = by_path.resolve(self) or by_name.resolve(self.name)
			end

			if not family then
				return
			end

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
			local hl_key = sub and sub.color_key or family.icon_key
			local highlight = hl.resolve(self, { icon_key = hl_key })

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
	-- Name patch (reuse cached highlight)
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
