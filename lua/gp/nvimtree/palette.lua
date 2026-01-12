---@class GpColorVariants
---@field base string
---@field soft string
---@field muted string

---@type table<string, GpColorVariants>
local palette = {

	-- Core / Source / App
	core = {
		base = "#89b4fa", -- blue
		soft = "#7393d1",
		muted = "#4c5f7a",
	},

	-- Frontend (React / UI)
	frontend = {
		base = "#a6e3a1", -- green
		soft = "#86c892",
		muted = "#4f6f5a",
	},

	-- Backend / API
	backend = {
		base = "#f38ba8", -- red
		soft = "#d0728c",
		muted = "#7a4555",
	},

	-- State / Store
	state = {
		base = "#cba6f7", -- mauve
		soft = "#aa86d1",
		muted = "#6a4f8a",
	},

	-- Database / Supabase
	database = {
		base = "#fab387", -- peach
		soft = "#d39a74",
		muted = "#8a5e45",
	},

	-- Platform / Mobile / Native
	platform = {
		base = "#74c7ec", -- sapphire
		soft = "#5fa4c4",
		muted = "#3a667a",
	},

	-- Game / 3D / Engine
	game = {
		base = "#94e2d5", -- teal
		soft = "#76bdb3",
		muted = "#4a7a72",
	},

	-- Data / Analytics
	data = {
		base = "#f9e2af", -- yellow
		soft = "#d1bc8f",
		muted = "#7a6a45",
	},

	-- Styles / Theme
	styles = {
		base = "#94e2d5", -- teal (lighter)
		soft = "#78bfb3",
		muted = "#4a7266",
	},

	-- Assets / Media
	assets = {
		base = "#bac2de", -- lavender
		soft = "#9aa1c1",
		muted = "#5f637a",
	},

	-- Tests
	tests = {
		base = "#b4befe", -- periwinkle
		soft = "#929bd4",
		muted = "#5a5f8a",
	},

	-- Tooling / Scripts
	tools = {
		base = "#89b4fa",
		soft = "#7393d1",
		muted = "#4c5f7a",
	},

	-- Config / Infra
	config = {
		base = "#6c7086", -- overlay
		soft = "#585c70",
		muted = "#3a3d4f",
	},

	-- Build / Dist
	build = {
		base = "#fab387",
		soft = "#d39a74",
		muted = "#8a5e45",
	},

	-- Docs / Content
	docs = {
		base = "#89dceb", -- sky
		soft = "#6fb6c9",
		muted = "#436f7a",
	},
}

return palette
