-- =========================================================
-- Configuration for nvim-tree-material-folders
-- =========================================================

---@class NtmfOverrides
---@field icons table<string, table>|nil
---@field families table<string, table>|nil
---@field subfamilies table<string, table>|nil
---@field palette table<string, string>|nil

---@class NtmfConfig
---@field enable_path_match boolean
---@field enable_colors boolean
---@field overrides NtmfOverrides

local M = {}

---@type NtmfConfig
M.defaults = {
	-- Enable path-based resolution (src/components, src/api, etc)
	enable_path_match = true,

	-- Enable semantic folder colors
	enable_colors = true,

	-- User overrides
	overrides = {
		icons = {},
		families = {},
		subfamilies = {},
		palette = {},
	},
}

---@type NtmfConfig
M.options = M.defaults

---Setup plugin configuration
---@param opts NtmfConfig|nil
function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

return M
