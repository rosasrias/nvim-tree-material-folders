-- =========================================================
-- Path-based family resolution
--
-- This module resolves a folder "family" by inspecting the
-- full absolute path of a DirectoryNode.
--
-- Path matching has higher priority than name matching,
-- allowing patterns such as:
--   src/api/**
--   src/ui/**
--   src/db/**
--
-- This is how VSCode icon themes differentiate folders
-- with the same name but different roles.
-- =========================================================

local families = require("gp.nvimtree.families")

-- =========================================================
-- Matcher definitions
-- =========================================================
-- Each matcher is:
--   { <path fragment>, <family_key> }
--
-- Notes:
--  - Matching is case-insensitive
--  - Path separators are normalized to "/"
--  - Matching is literal (no Lua patterns)
--
-- These are DEFAULT PRESETS.
-- Users can extend / override these in setup().
-- =========================================================

---@type { [1]: string, [2]: string }[]
local matchers = {
	-- ===== Backend / Server =====
	{ "/src/api/", "backend" },
	{ "/src/server/", "backend" },

	-- ===== Frontend / UI =====
	{ "/src/components/", "frontend" },
	{ "/src/ui/", "frontend" },

	-- ===== State Management =====
	{ "/src/store/", "state" },

	-- ===== Styling =====
	{ "/src/styles/", "styles" },

	-- ===== Static assets =====
	{ "/src/assets/", "assets" },

	-- ===== Persistence / DB =====
	{ "/src/db/", "database" },

	-- Mobile
	{ "/android/app/src/", "platform" },
	{ "/ios/", "platform" },

	-- Desktop
	{ "/src-tauri/", "platform" },
	{ "/electron/", "platform" },

	-- Backend
	{ "/cmd/", "backend" },
	{ "/internal/", "backend" },
	{ "/services/", "backend" },

	-- Game dev
	{ "/assets/audio/", "assets" },
	{ "/assets/sprites/", "assets" },
}

local M = {}

-- =========================================================
-- Family resolution
-- =========================================================

---Resolve folder family using absolute path.
---
---This function attempts to match known semantic roles
---by inspecting the full directory path.
---
---Resolution order:
---  1. Path match (this module)
---  2. Name match (match_name.lua)
---
---@param node table nvim-tree DirectoryNode
---@return GpFolderFamily|nil
function M.resolve(node)
	if not node.absolute_path then
		return
	end

	-- Normalize path for cross-platform compatibility
	local path = node.absolute_path:lower():gsub("\\", "/")

	for _, matcher in ipairs(matchers) do
		local fragment = matcher[1]
		local family_key = matcher[2]

		if path:find(fragment, 1, true) then
			return families[family_key]
		end
	end
end

return M
