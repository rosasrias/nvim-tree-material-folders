-- lua/gp/nvimtree/icons.lua

---@class GpIconSet
---@field default string
---@field open string
---@field soft string|nil
---@field muted string|nil

---@type table<string, GpIconSet>
local icons = {

	core = {
		default = "󰣞",
		open = "󰷎",
		soft = "󰣜",
		muted = "󰣚",
	},

	frontend = {
		default = "󱧴",
		open = "󱧵",
		soft = "󱧶",
		muted = "󱧷",
	},

	backend = {
		default = "󰒋",
		open = "󰒌",
		soft = "󰒍",
		muted = "󰒎",
	},

	state = {
		default = "󰘦",
		open = "󰘧",
		soft = "󰘨",
		muted = "󰘩",
	},

	database = {
		default = "󱋣",
		open = "󱋤",
		soft = "󱋥",
		muted = "󱋦",
	},

	platform = {
		default = "󰌢",
		open = "󰌣",
		soft = "󰌤",
		muted = "󰌥",
	},

	game = {
		default = "󰐣",
		open = "󰐤",
		soft = "󰐥",
		muted = "󰐦",
	},

	data = {
		default = "󰆼",
		open = "󰆽",
		soft = "󰆾",
		muted = "󰆿",
	},

	styles = {
		default = "󰉘",
		open = "󰮞",
		soft = "󰮟",
		muted = "󰮠",
	},

	assets = {
		default = "󰚝",
		open = "󰮟",
		soft = "󰮠",
		muted = "󰮡",
	},

	tests = {
		default = "󱧸",
		open = "󱧹",
		soft = "󱧺",
		muted = "󱧻",
	},

	tools = {
		default = "󰆕",
		open = "󰆖",
		soft = "󰆗",
		muted = "󰆘",
	},

	config = {
		default = "",
		open = "󱂀",
		soft = "󱂁",
		muted = "󱂂",
	},

	build = {
		default = "󰴋",
		open = "󰴌",
		soft = "󰴍",
		muted = "󰴎",
	},

	docs = {
		default = "󱧺",
		open = "󱧻",
		soft = "󱧼",
		muted = "󱧽",
	},
}

return icons
