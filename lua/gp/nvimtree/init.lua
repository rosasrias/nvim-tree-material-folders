local M = {}
local applied = false

---Setup gp-nvim-tree-icons.
---
---Responsabilidades:
---  1. Configuración
---  2. Creación de highlights
---  3. Autocmd de ColorScheme
---
---@param opts GpNvimTreeIconsConfig|nil
function M.setup(opts)
	-- Apply configuration (with defaults)
	require("gp.nvimtree.config").setup(opts)

	-- Create highlight groups
	local highlights = require("gp.nvimtree.highlights")
	highlights.setup()

	-- Recreate highlights after colorscheme changes
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = vim.api.nvim_create_augroup("GpNvimTreeHighlights", { clear = true }),
		callback = function()
			highlights.setup()
		end,
	})
end

---Apply nvim-tree patch (lazy, one-time)
function M.apply()
	if applied then
		return
	end

	applied = true
	require("gp.nvimtree.patch").apply()
end

return M
