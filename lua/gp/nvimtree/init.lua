local M = {}

---Setup gp-nvim-tree-icons
---@param opts GpNvimTreeIconsConfig|nil
function M.setup(opts)
	require("gp.nvimtree.config").setup(opts)
	require("gp.nvimtree.patch").apply()
end

return M
