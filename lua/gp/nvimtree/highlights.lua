local config = require("gp.nvimtree.config")
local palette = require("gp.nvimtree.palette")
local depth = require("gp.nvimtree.depth")

---@class GpHighlightGroup
---@field base string
---@field soft string
---@field muted string

---@type table<string, GpHighlightGroup>
local groups = {}

local M = {}

-- =========================================================
-- Highlight group creation
-- =========================================================

---Create highlight groups for all families
function M.setup()
	for family, colors in pairs(palette) do
		groups[family] = {
			base = "GpNvimTree" .. family:sub(1, 1):upper() .. family:sub(2),
			soft = "GpNvimTree" .. family:sub(1, 1):upper() .. family:sub(2) .. "Soft",
			muted = "GpNvimTree" .. family:sub(1, 1):upper() .. family:sub(2) .. "Muted",
		}

		vim.api.nvim_set_hl(0, groups[family].base, {
			fg = colors.base,
			bold = true,
		})

		vim.api.nvim_set_hl(0, groups[family].soft, {
			fg = colors.soft,
		})

		vim.api.nvim_set_hl(0, groups[family].muted, {
			fg = colors.muted,
			italic = true,
		})
	end
end

-- =========================================================
-- Highlight resolver
-- =========================================================

---Resolve highlight group for a node
---@param node table
---@param family table
---@return string|nil
function M.resolve(node, family)
	if not config.options.enable_colors then
		return nil
	end

	local fam_key = family.icon_key
	local fam_groups = groups[fam_key]
	if not fam_groups then
		return nil
	end

	local d = depth.get(node)

	if d >= config.options.depth.muted then
		return fam_groups.muted
	end

	if d >= config.options.depth.soft then
		return fam_groups.soft
	end

	return fam_groups.base
end

return M
