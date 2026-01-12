local M = {}

---Setup gp-nvim-tree-icons.
---
---This function initializes the plugin lifecycle:
---  1. Applies user configuration
---  2. Creates highlight groups (semantic + depth-aware)
---  3. Re-applies highlights on colorscheme change
---  4. Monkey-patches nvim-tree to inject icons & highlights
---
---@param opts GpNvimTreeIconsConfig|nil
function M.setup(opts)
	-- Apply configuration (with defaults)
	require("gp.nvimtree.config").setup(opts)

	-- Create highlight groups
	local highlights = require("gp.nvimtree.highlights")
	highlights.setup()

	-- Recreate highlights after colorscheme changes
	-- (most colorschemes clear custom highlight groups)
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = vim.api.nvim_create_augroup("GpNvimTreeHighlights", { clear = true }),
		callback = function()
			highlights.setup()
		end,
	})

	-- Apply nvim-tree DirectoryNode patch
	require("gp.nvimtree.patch").apply()
end

return M
