-- =========================================================
-- Subfamily definitions
--
-- Subfamilies refine a base folder family with more
-- specific semantics, allowing different icons and colors
-- inside the same conceptual group.
--
-- Resolution rules:
--   1. Subfamilies have highest priority
--   2. Matched by absolute path fragments (string match)
--   3. If matched:
--        - icon_key overrides base family icon
--        - color_key overrides base family color
--        - inherits defines the fallback family
--
-- Examples:
--   src/components/forms → forms
--   assets/images       → images
--   src/hooks           → hooks (state color)
-- =========================================================

---@class NtmfSubFamily
---@field icon_key string   -- icon to use
---@field color_key string  -- palette / highlight key
---@field inherits string   -- base family key

---@type table<string, NtmfSubFamily>
local subfamilies = {

	-- =====================================================
	-- Assets
	-- =====================================================
	["/assets/images"] = {
		inherits = "assets",
		icon_key = "images",
		color_key = "images",
	},

	["/assets/icons"] = {
		inherits = "assets",
		icon_key = "icons",
		color_key = "icons",
	},

	["/assets/fonts"] = {
		inherits = "assets",
		icon_key = "fonts",
		color_key = "fonts",
	},

	["/src/assets/images"] = {
		inherits = "assets",
		icon_key = "images",
		color_key = "images",
	},

	["/src/assets/icons"] = {
		inherits = "assets",
		icon_key = "icons",
		color_key = "icons",
	},

	["/src/assets/fonts"] = {
		inherits = "assets",
		icon_key = "fonts",
		color_key = "fonts",
	},

	-- =====================================================
	-- Frontend components (granular)
	-- =====================================================
	["/src/components/forms"] = {
		inherits = "frontend",
		icon_key = "forms",
		color_key = "forms",
	},

	["/src/components/ui"] = {
		inherits = "frontend",
		icon_key = "ui",
		color_key = "ui",
	},

	["/src/components/layout"] = {
		inherits = "frontend",
		icon_key = "layout",
		color_key = "layout",
	},

	-- =====================================================
	-- Backend / API
	-- =====================================================
	["/api/supabase"] = {
		inherits = "backend",
		icon_key = "supabase",
		color_key = "supabase",
	},

	["/api/routes"] = {
		inherits = "backend",
		icon_key = "routes",
		color_key = "routes",
	},

	-- =====================================================
	-- Frontend (generic buckets)
	-- These catch common folders not handled above
	-- =====================================================
	["/src/components"] = {
		inherits = "frontend",
		icon_key = "components",
		color_key = "frontend",
	},

	["/src/hooks"] = {
		inherits = "frontend",
		icon_key = "hooks",
		color_key = "state",
	},

	["/src/pages"] = {
		inherits = "frontend",
		icon_key = "pages",
		color_key = "frontend",
	},

	["/src/templates"] = {
		inherits = "frontend",
		icon_key = "templates",
		color_key = "templates",
	},

	["/src/types"] = {
		inherits = "frontend",
		icon_key = "types",
		color_key = "types",
	},

	["/src/utils"] = {
		inherits = "frontend",
		icon_key = "utils",
		color_key = "tools",
	},
}

return subfamilies
