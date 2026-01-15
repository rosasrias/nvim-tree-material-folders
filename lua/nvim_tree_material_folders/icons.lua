-- =========================================================
-- Icon definitions for nvim-tree-material-folders
--
-- Each icon set defines:
--   - default: closed folder icon
--   - open:    opened folder icon
-- =========================================================

---@class NtmfIconSet
---@field default string
---@field open string

---@type table<string, NtmfIconSet>
local icons = {

	-- ===== ASSETS =====
	images = {
		default = "󰉏",
		open = "󱃫",
	},

	icons = {
		default = "󰀻",
		open = "󰀼",
	},

	fonts = {
		default = "󰛖",
		open = "󰛗",
	},

	assets = {
		default = "󰚝",
		open = "󰮟",
	},

	-- ===== FRONTEND =====
	public = {
		default = "󱂵",
		open = "󱂶",
	},

	components = {
		default = "󱧶",
		open = "󱧷",
	},

	forms = {
		default = "󰥨",
		open = "󰥩",
	},

	ui = {
		default = "󰏘",
		open = "󰸌",
	},

	layout = {
		default = "󰕮",
		open = "",
	},

	pages = {
		default = "󱑾",
		open = "󱑿",
	},

	templates = {
		default = "󱧶",
		open = "󱧷",
	},

	hooks = {
		default = "󱧊",
		open = "󱧋",
	},

	types = {
		default = "󰉍",
		open = "󱃭",
	},

	utils = {
		default = "󰲂",
		open = "󰲃",
	},

	-- ===== CORE =====
	core = {
		default = "󰣞",
		open = "󰷎",
	},

	src = {
		default = "󰉌",
		open = "󰮜",
	},

	app = {
		default = "󱂵",
		open = "󱂶",
	},

	-- ===== BACKEND =====
	backend = {
		default = "󱧼",
		open = "󱧽",
	},

	database = {
		default = "󱋣",
		open = "󱋤",
	},

	supabase = {
		default = "󰚝",
		open = "󰮟",
	},

	-- ===== STATE =====
	state = {
		default = "",
		open = "󰮝",
	},

	-- ===== PLATFORM =====
	platform = {
		default = "󰌢",
		open = "󰌣",
	},

	-- ===== GAME / DATA =====
	game = {
		default = "󰐣",
		open = "󰐤",
	},

	data = {
		default = "󰆼",
		open = "󰆽",
	},

	-- ===== STYLES =====
	styles = {
		default = "󰉘",
		open = "󰮞",
	},

	-- ===== TEST / TOOLING =====
	tests = {
		default = "󱧸",
		open = "󱧹",
	},

	tools = {
		default = "󰆕",
		open = "󰆖",
	},

	-- ===== CONFIG / BUILD =====
	config = {
		default = "",
		open = "󱂀",
	},

	build = {
		default = "󰴋",
		open = "󰴌",
	},

	-- ===== DOCS =====
	docs = {
		default = "󱧺",
		open = "󱧻",
	},

	context = {
		default = "󰉒",
		open = "󱉆",
	},
}

return icons
