---@class GpColorVariants
---@field base string
---@field soft string
---@field muted string

---@type table<string, string>
local palette = {
	core = "#89B4FA", -- Azul (src, app)
	frontend = "#A6E3A1", -- Verde (components, ui)
	backend = "#F38BA8", -- Rojo (api)
	database = "#FAB387", -- Naranja (supabase)
	state = "#CBA6F7", -- Morado (store, hooks)
	styles = "#94E2D5", -- Turquesa (styles)
	assets = "#EBA0AC", -- Rosa (images, icons)
	templates = "#F5C2E7", -- Rosado claro
	types = "#89DCEB", -- Celeste
	tests = "#8d90a1", -- Gris
	docs = "#7DCFFF", -- Azul claro
	tools = "#B4BEFE", -- Lavanda
	config = "#6c7086", -- Gris oscuro
	build = "#F2CDCD", -- Rojo suave
	images = "#89dceb",
	icons = "#f9e2af",
	forms = "#a6e3a1",
	ui = "#74c7ec",
	layout = "#cba6f7",
}

return palette
