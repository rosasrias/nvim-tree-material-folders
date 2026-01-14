local config = require("nvim_tree_material_folders.config")
local palette = require("nvim_tree_material_folders.palette")

---@type table<string, string>
local groups = {}

local M = {}

-- =========================================================
-- Highlight group creation
-- =========================================================

function M.setup()
	groups = {}

	for key, color in pairs(palette) do
		local group = "NtmfNvimTree" .. key:sub(1, 1):upper() .. key:sub(2)

		groups[key] = group

		vim.api.nvim_set_hl(0, group, {
			fg = color,
			bold = true,
		})
	end

	-- Neutral file highlight
	vim.api.nvim_set_hl(0, "NtmfNvimTreeFile", {
		fg = "#CDD6F4",
	})

	-- Entry / main files
	vim.api.nvim_set_hl(0, "NtmfNvimTreeEntryFile", {
		fg = "#F38BA8",
		bold = true,
	})
end

-- =========================================================
-- Highlight resolver
-- =========================================================

---@param node table
---@param resolved { icon_key: string, color_key: string }
---@return string|nil
function M.resolve(_, resolved)
	if not config.options.enable_colors then
		return nil
	end

	if not resolved or not resolved.color_key then
		return nil
	end

	return groups[resolved.color_key]
end

return M
