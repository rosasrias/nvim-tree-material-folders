-- =========================================================
-- Configuration for nvim-tree-material-folders
-- =========================================================

---@class NtmfCustomFolder
---@field match '"name"'|'"path"'|'"pattern"'|nil
---@field pattern string|nil
---@field icon_key string
---@field color_key string|nil

---@class NtmfOverrides
---@field icons table<string, table>|nil
---@field families table<string, table>|nil
---@field subfamilies table<string, table>|nil
---@field palette table<string, string>|nil

---@class NtmfConfig
---@field enable_path_match boolean
---@field enable_colors boolean
---@field overrides NtmfOverrides
---@field custom_folders table<string, NtmfCustomFolder>|nil

local M = {}

-- =========================================================
-- Defaults (DO NOT MUTATE)
-- =========================================================

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

  custom_folders = {},
}

-- =========================================================
-- Runtime options (mutable)
-- =========================================================

---@type NtmfConfig
M.options = vim.tbl_deep_extend("force", {}, M.defaults)

-- =========================================================
-- Setup
-- =========================================================

---Setup plugin configuration
---@param opts NtmfConfig|nil
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

return M
