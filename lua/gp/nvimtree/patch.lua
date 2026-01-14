local DirectoryNode = require("nvim-tree.node.directory")

local resolver = require("gp.nvimtree.resolver")
local icons = require("gp.nvimtree.icons")
local hl = require("gp.nvimtree.highlights")
local cache = require("gp.nvimtree.cache")

local original_icon = DirectoryNode.highlighted_icon
local original_name = DirectoryNode.highlighted_name

local M = {}

function M.apply()
	---@diagnostic disable-next-line: duplicate-set-field
	function DirectoryNode:highlighted_icon()
		local res = original_icon(self)

		local cached = cache.resolve(self, function()
			local sem = resolver.resolve(self)
			if not sem then
				return
			end

			local icon_set = icons[sem.icon_key]
			if not icon_set then
				return
			end

			return {
				icon = self.open and icon_set.open or icon_set.default,
				hl = hl.resolve(self, { icon_key = sem.color_key }),
			}
		end)

		if not cached then
			return res
		end

		res.str = cached.icon
		res.hl = { cached.hl }
		return res
	end

	function DirectoryNode:highlighted_name()
		local res = original_name(self)

		local cached = cache.resolve(self)
		if cached and cached.hl then
			res.hl = { cached.hl }
		end

		return res
	end
end

return M
