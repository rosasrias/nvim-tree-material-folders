-- =========================================================
-- Name-based family resolution
--
-- This module resolves a folder "family" using ONLY the
-- directory name (last path segment).
--
-- It is used as a fallback when no path-based rule matches.
--
-- Example:
--   components/   → frontend
--   services/     → backend
--   migrations/   → database
--
-- This mimics VSCode behavior where well-known folder names
-- carry semantic meaning regardless of location.
-- =========================================================

local families = require("gp.nvimtree.families")

-- =========================================================
-- Name match definitions
-- =========================================================
-- Each entry maps:
--   <folder_name> → <family_key>
--
-- Notes:
--  - Case-insensitive
--  - Exact match only (no patterns)
--  - These are DEFAULT PRESETS
--
-- Users can extend or override these via setup().
-- =========================================================

---@type table<string, string>
local matchers = {
	-- ===== Frontend / UI =====
	components = "frontend",
	ui = "frontend",
	views = "frontend",
	pages = "frontend",
	screens = "frontend",
	widgets = "frontend",

	-- ===== State management =====
	store = "state",
	stores = "state",
	redux = "state",
	zustand = "state",
	recoil = "state",

	-- ===== Backend / Services =====
	api = "backend",
	server = "backend",
	services = "backend",
	service = "backend",
	controllers = "backend",
	routes = "backend",
	handlers = "backend",

	-- ===== Domain / Core =====
	domain = "domain",
	core = "domain",
	entities = "domain",
	models = "domain",
	usecases = "domain",

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

	-- ===== Mobile =====
	android = "mobile",
	ios = "mobile",

	-- ===== Desktop =====
	electron = "desktop",
	tauri = "desktop",
	desktop = "desktop",

	-- ===== DevOps / Infra =====
	docker = "infra",
	kubernetes = "infra",
	k8s = "infra",
	terraform = "infra",
	helm = "infra",
}

local M = {}

-- =========================================================
-- Family resolution
-- =========================================================

---Resolve folder family using directory name only.
---
---This is the secondary resolution strategy:
---  - Path-based match has priority
---  - Name-based match is fallback
---
---@param name string folder name
---@return GpFolderFamily|nil
function M.resolve(name)
	if not name then
		return
	end

	local key = name:lower()
	local family_key = matchers[key]

	if family_key then
		return families[family_key]
	end
end

return M
