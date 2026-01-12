if vim.g.loaded_gp_nvim_tree_icons then
	return
end
vim.g.loaded_gp_nvim_tree_icons = true

require("gp.nvimtree").setup()
