-- =========================================================
-- Folder family definitions for nvim-tree-material-folders
--
-- Families represent high-level semantic meaning
-- inferred from folder names or paths.
--
-- Each family defines:
--   - icon_key  → used by icons.lua
--   - color_key → used by palette.lua / highlights.lua
-- =========================================================

---@class NtmfFolderFamily
---@field icon_key string   -- icon identifier
---@field color_key string  -- color / highlight identifier
---@field match string[]    -- name match patterns (optional usage)

---@type table<string, NtmfFolderFamily>
local config = require("nvim_tree_material_folders.config")
local base_families = {

	-- ===== CORE / SOURCE =====
	core = {
		icon_key = "core",
		color_key = "core",
		match = {
			"src",
			"source",
			"app",
			"apps?",
			"lib",
			"libs?",
			"core",
			"main",
			"internal",
			"shared",
		},
	},

	-- ===== FRONTEND / UI =====
	frontend = {
		icon_key = "frontend",
		color_key = "frontend",
		match = {
			"frontend",
			"client",
			"ui",
			"views?",
			"pages?",
			"screens?",
			"components?",
			"widgets?",
			"layouts?",
			"containers?",
			"composable[s]?",
			"hook[s]?",
			"template[s]?",
			"types?",
			"util[s]?",
		},
	},

	-- ===== BACKEND / API =====
	backend = {
		icon_key = "backend",
		color_key = "backend",
		match = {
			"backend",
			"server",
			"api",
			"apis?",
			"controllers?",
			"handlers?",
			"routes?",
			"routers?",
			"services?",
			"use%-cases?",
		},
	},

	-- ===== STATE / DOMAIN =====
	state = {
		icon_key = "state",
		color_key = "state",
		match = {
			"store[s]?",
			"state[s]?",
			"redux",
			"zustand",
			"recoil",
			"jotai",
			"signals?",
			"atoms?",
			"models?",
			"domain",
		},
	},

	-- ===== DATABASE / DATA =====
	database = {
		icon_key = "database",
		color_key = "database",
		match = {
			"db",
			"database[s]?",
			"migrations?",
			"seed[s]?",
			"prisma",
			"typeorm",
			"sequelize",
			"supabase",
			"firebase",
			"mongo",
			"redis",
		},
	},

	-- ===== DESKTOP / MOBILE =====
	platform = {
		icon_key = "platform",
		color_key = "platform",
		match = {
			"android",
			"ios",
			"mobile",
			"desktop",
			"electron",
			"tauri",
			"windows",
			"macos",
			"linux",
		},
	},

	-- ===== GAME DEV =====
	game = {
		icon_key = "game",
		color_key = "game",
		match = {
			"game",
			"games",
			"engine",
			"unity",
			"unreal",
			"godot",
			"scenes?",
			"sprites?",
		},
	},

	-- ===== DATA / ML =====
	data = {
		icon_key = "data",
		color_key = "data",
		match = {
			"data",
			"datasets?",
			"ml",
			"ai",
			"models?",
			"training",
			"pipelines?",
		},
	},

	-- ===== STYLES / DESIGN =====
	styles = {
		icon_key = "styles",
		color_key = "styles",
		match = {
			"styles?",
			"css",
			"scss",
			"sass",
			"less",
			"theme[s]?",
			"design",
			"tokens?",
		},
	},

	-- ===== ASSETS / MEDIA =====
	assets = {
		icon_key = "assets",
		color_key = "assets",
		match = {
			"assets?",
			"public",
			"static",
			"media",
			"images?",
			"img",
			"icons?",
			"fonts?",
		},
	},

	-- ===== TESTING =====
	tests = {
		icon_key = "tests",
		color_key = "tests",
		match = {
			"test[s]?",
			"testing",
			"spec[s]?",
			"__tests__",
			"e2e",
			"cypress",
			"playwright",
		},
	},

	-- ===== TOOLING =====
	tooling = {
		icon_key = "tools",
		color_key = "tooling",
		match = {
			"tools?",
			"scripts?",
			"cli",
			"bin",
			"command[s]?",
			"tasks?",
		},
	},

	-- ===== CONFIG / META =====
	config = {
		icon_key = "config",
		color_key = "config",
		match = {
			"config[s]?",
			"setting[s]?",
			"%.github",
			"%.husky",
			"ci",
			"cd",
			"circle%-ci",
		},
	},

	-- ===== BUILD / DIST =====
	build = {
		icon_key = "build",
		color_key = "build",
		match = {
			"build",
			"dist",
			"out",
			"target",
			"release[s]?",
			"coverage",
		},
	},

	-- ===== DOCS =====
	docs = {
		icon_key = "docs",
		color_key = "docs",
		match = {
			"doc",
			"doc[s]?",
			"documentation",
			"guide[s]?",
			"wiki",
			"readme[s]?",
		},
	},
}

return vim.tbl_deep_extend("force", {}, base_families, config.options.overrides.families or {})
