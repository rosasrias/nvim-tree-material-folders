---@class GpColorVariants
---@field base string
---@field soft string
---@field muted string

---@type table<string, GpColorVariants>
local palette = {

	core = {
		base = "#7aa2f7",
		soft = "#5d7ccf",
		muted = "#3d4f7a",
	},

	frontend = {
		base = "#9ece6a",
		soft = "#7fa35a",
		muted = "#4f6b3a",
	},

	backend = {
		base = "#f7768e",
		soft = "#d66175",
		muted = "#8f3f4e",
	},

	state = {
		base = "#bb9af7",
		soft = "#9a7bd4",
		muted = "#5e4a8a",
	},

	database = {
		base = "#ff9e64",
		soft = "#d98656",
		muted = "#8a5a3a",
	},

	platform = {
		base = "#2ac3de",
		soft = "#219db5",
		muted = "#15606e",
	},

	game = {
		base = "#7dcfff",
		soft = "#5fa5cc",
		muted = "#3a667f",
	},

	data = {
		base = "#e0af68",
		soft = "#b99156",
		muted = "#7a603a",
	},

	styles = {
		base = "#73daca",
		soft = "#5fb3a2",
		muted = "#3d7266",
	},

	assets = {
		base = "#a9b1d6",
		soft = "#8b93b3",
		muted = "#585e7a",
	},

	tests = {
		base = "#c0caf5",
		soft = "#9aa3c7",
		muted = "#60657a",
	},

	tools = {
		base = "#7aa2f7",
		soft = "#5d7ccf",
		muted = "#3d4f7a",
	},

	config = {
		base = "#565f89",
		soft = "#444a6a",
		muted = "#2a2f44",
	},

	build = {
		base = "#ff9e64",
		soft = "#d98656",
		muted = "#8a5a3a",
	},

	docs = {
		base = "#89ddff",
		soft = "#6bb3cc",
		muted = "#43707f",
	},
}

return palette
