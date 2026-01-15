-- =========================================================
-- Color palette for nvim-tree-material-folders
--
-- Each key represents a semantic category used by:
--   - families.icon_key
--   - subfamilies.color_key
--   - icons.icon_key
--
-- Contract:
--   Every icon_key or color_key MUST have an entry here.
-- =========================================================

---@type table<string, string>
local palette = {

	-- ===== CORE =====
	core = "#89B4FA", -- src, app, core
	frontend = "#A6E3A1", -- components, ui, pages
	backend = "#F38BA8", -- api, services
	database = "#FAB387", -- db, prisma, supabase
	state = "#CBA6F7", -- store, hooks

	-- ===== STYLES / ASSETS =====
	styles = "#94E2D5", -- css, scss
	assets = "#EBA0AC", -- assets root
	images = "#89DCEB",
	icons = "#F9E2AF",

	-- ===== FRONTEND SUBFAMILIES =====
	templates = "#F5C2E7",
	types = "#89DCEB",
	forms = "#FAB387",
	ui = "#74C7EC",
	layout = "#CBA6F7",

	-- ===== TOOLING =====
	tools = "#B4BEFE",
	config = "#6C7086",
	build = "#F2CDCD",

	-- ===== META =====
	tests = "#F9E2AF",
	docs = "#7DCFFF",
}

return palette
