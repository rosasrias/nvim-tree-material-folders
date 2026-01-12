---@class GpNvimTreeIconsDepthConfig
---@field soft integer        -- depth donde el color/icon empieza a suavizarse
---@field muted integer      -- depth donde se atenúa fuerte

---@class GpNvimTreeIconsOverrides
---@field icons table<string, table>|nil
---@field families table<string, table>|nil
---@field highlights table<string, string>|nil

---@class GpNvimTreeIconsConfig
---@field enable_path_match boolean
---@field enable_depth_icons boolean
---@field enable_colors boolean
---@field depth GpNvimTreeIconsDepthConfig
---@field overrides GpNvimTreeIconsOverrides

local M = {}

---@type GpNvimTreeIconsConfig
M.defaults = {
	enable_path_match = true,
	enable_depth_icons = true,
	enable_colors = true,

	depth = {
		soft = 2,
		muted = 4,
	},

	overrides = {
		icons = {},
		families = {},
		highlights = {},
	},
}

---@type GpNvimTreeIconsConfig
M.options = M.defaults

---@param opts GpNvimTreeIconsConfig|nil
function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

return M
