-- =========================================================
-- Name-based family resolution
--
-- Resolves a folder "family" using ONLY the directory name
-- (last path segment).
--
-- This is used as a fallback strategy when no path-based
-- or subfamily rule matches.
--
-- This mimics VSCode behavior where well-known folder names
-- carry semantic meaning regardless of their location.
-- =========================================================

local families = require("nvim_tree_material_folders.families")

-- =========================================================
-- Name match definitions
--
-- Each entry maps:
--   <folder_name> → <family_key>
--
-- Rules:
--  - Case-insensitive
--  - Exact match only
--  - No subfamily resolution here
--
-- These are DEFAULT PRESETS.
-- =========================================================

---@type table<string, string>
local matchers = {
	-- ===== Documentation =====
	docs = "docs",
	documentation = "docs",

	-- ===== Frontend / UI =====
	components = "frontend",
	ui = "frontend",
	views = "frontend",
	pages = "frontend",
	screens = "frontend",
	widgets = "frontend",
	hooks = "frontend",
	templates = "frontend",
	types = "frontend",
	utils = "frontend",

	-- ===== State management =====
	store = "state",
	stores = "state",
	redux = "state",
	zustand = "state",
	recoil = "state",

	-- ===== Backend / Services =====
	api = "backend",
	server = "backend",
	service = "backend",
	services = "backend",
	controllers = "backend",
	routes = "backend",
	handlers = "backend",

	-- ===== Domain / Core =====
	domain = "core",
	entities = "core",
	models = "core",
	usecases = "core",

	-- ===== Core / Source =====
	src = "core",
	source = "core",
	app = "core",
	apps = "core",
	lib = "core",
	libs = "core",
	core = "core",

	-- ===== Database / Persistence =====
	db = "database",
	database = "database",
	migrations = "database",
	seeds = "database",
	prisma = "database",

	-- ===== Styling =====
	styles = "styles",
	css = "styles",
	scss = "styles",
	theme = "styles",

	-- ===== Assets =====
	assets = "assets",
	public = "assets",
	static = "assets",
	media = "assets",
	images = "assets",

	-- ===== Configuration / Tooling =====
	config = "config",
	configs = "config",
	settings = "config",
	scripts = "tooling",

	-- ===== Testing =====
	test = "tests",
	tests = "tests",
	spec = "tests",
	specs = "tests",
	__tests__ = "tests",

	-- ===== Platforms =====
	android = "platform",
	ios = "platform",
	electron = "platform",
	tauri = "platform",
	desktop = "platform",

	-- ===== DevOps / Infra =====
	docker = "tooling",
	kubernetes = "tooling",
	terraform = "tooling",
	helm = "tooling",
}

local M = {}

-- =========================================================
-- Family resolution
-- =========================================================

---@param name string folder name
---@return NtmfFolderFamily|nil
function M.resolve(name)
	if not name then
		return
	end

	local family_key = matchers[name:lower()]
	if not family_key then
		return
	end

	return families[family_key]
end

return M
