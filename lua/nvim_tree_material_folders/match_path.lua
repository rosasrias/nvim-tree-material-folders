-- =========================================================
-- Path-based family resolution
--
-- Resolves a folder "family" by inspecting the absolute path
-- of a DirectoryNode.
--
-- Path matching has higher priority than name matching and
-- allows differentiating folders with the same name but
-- different semantic roles (VSCode-style behavior).
-- =========================================================

local families = require("nvim_tree_material_folders.families")

local M = {}

-- =========================================================
-- Matcher definitions
--
-- Each matcher:
--   { fragment = string, family = string }
--
-- Matching rules:
--  - Case-insensitive
--  - Path separators normalized to "/"
--  - Literal match (no Lua patterns)
--  - Longest fragment wins (most specific)
--
-- These are DEFAULT PRESETS.
-- =========================================================

---@type { fragment: string, family: string }[]
local matchers = {
	-- ===== Static assets =====
	{ fragment = "/public/", family = "assets" },
	{ fragment = "/src/assets/", family = "assets" },

	-- ===== Backend / Server =====
	{ fragment = "/src/api/", family = "backend" },
	{ fragment = "/src/server/", family = "backend" },

	-- ===== Frontend / UI =====
	{ fragment = "/src/components/", family = "frontend" },
	{ fragment = "/src/ui/", family = "frontend" },

	-- ===== State =====
	{ fragment = "/src/store/", family = "state" },

	-- ===== Styling =====
	{ fragment = "/src/styles/", family = "styles" },

	-- ===== Database =====
	{ fragment = "/src/db/", family = "database" },

	-- ===== Mobile =====
	{ fragment = "/android/app/src/", family = "platform" },
	{ fragment = "/ios/", family = "platform" },

	-- ===== Desktop =====
	{ fragment = "/src-tauri/", family = "platform" },
	{ fragment = "/electron/", family = "platform" },

	-- ===== Backend generic =====
	{ fragment = "/cmd/", family = "backend" },
	{ fragment = "/internal/", family = "backend" },
	{ fragment = "/services/", family = "backend" },

	-- ===== Game dev assets =====
	{ fragment = "/assets/audio/", family = "assets" },
	{ fragment = "/assets/sprites/", family = "assets" },
}

-- Sort by specificity (longest fragment first)
table.sort(matchers, function(a, b)
	return #a.fragment > #b.fragment
end)

-- =========================================================
-- Family resolution
-- =========================================================

---@param node table nvim-tree DirectoryNode
---@return NtmfFolderFamily|nil
function M.resolve(node)
	if not node or not node.absolute_path then
		return
	end

	local path = node.absolute_path:lower():gsub("\\", "/")

	for _, m in ipairs(matchers) do
		if path:find(m.fragment, 1, true) then
			return families[m.family]
		end
	end
end

return M
