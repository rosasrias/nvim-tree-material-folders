local M = {}
local applied = false

---Setup nvim-tree-material-folders.
---
---Responsabilidades:
---  1. Aplicar configuración de usuario
---  2. Crear highlight groups semánticos
---  3. Reaplicar highlights al cambiar colorscheme
---  4. Limpiar cache al cerrar nvim-tree
---
---@param opts NtmfConfig|nil
function M.setup(opts)
	-- Apply configuration (with defaults)
	require("nvim_tree_material_folders.config").setup(opts)

	-- Create highlight groups
	local highlights = require("nvim_tree_material_folders.highlights")
	highlights.setup()

	-- Recreate highlights after colorscheme changes
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = vim.api.nvim_create_augroup("NtmfHighlights", { clear = true }),
		callback = function()
			highlights.setup()
		end,
	})

	-- Clear cache when nvim-tree closes
	vim.api.nvim_create_autocmd("User", {
		pattern = "NvimTreeClose",
		group = vim.api.nvim_create_augroup("NtmfCache", { clear = true }),
		callback = function()
			require("nvim_tree_material_folders.cache").clear()
		end,
	})
end

---Apply nvim-tree monkey patch (lazy, one-time)
---
---Debe llamarse únicamente cuando nvim-tree
---ya está inicializado (por ejemplo en on_attach).
function M.apply()
	if applied then
		return
	end

	applied = true
	require("nvim_tree_material_folders.patch").apply()
end

return M
