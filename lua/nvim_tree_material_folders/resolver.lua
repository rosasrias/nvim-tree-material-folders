-- =========================================================
-- Folder resolver for nvim-tree-material-folders
--
-- This module centralizes the semantic resolution logic
-- used by the nvim-tree patch.
--
-- Its responsibility is to determine:
--   - which icon_key to use   (icons.lua)
--   - which color_key to use  (palette.lua / highlights)
--
-- Resolution priority (highest → lowest):
--   1. Subfamily      (match_subfamily)
--   2. Path-based     (match_path)
--   3. Name-based     (match_name)
--
-- This mirrors VSCode icon theme behavior.
-- =========================================================

local by_path = require("nvim_tree_material_folders.match_path")
local by_name = require("nvim_tree_material_folders.match_name")
local by_sub = require("nvim_tree_material_folders.match_subfamily")

local M = {}

-- =========================================================
-- Resolution
-- =========================================================

---Resolve semantic icon and color for a directory node.
---
---Contract:
---  - icon_key MUST exist in icons.lua
---  - color_key MUST exist in palette.lua
---
---If no semantic match is found, nil is returned and
---nvim-tree will fallback to its default behavior.
---
---@param node table nvim-tree DirectoryNode
---@return { icon_key: string, color_key: string }|nil
function M.resolve(node)
	if not node then
		return
	end

	-- -----------------------------------------------------
	-- 1. Subfamily (highest priority)
	-- -----------------------------------------------------
	-- Subfamilies represent the most specific semantics
	-- (e.g. /src/components/forms → forms)
	--
	local sub = by_sub.resolve(node)
	if sub then
		return {
			icon_key = sub.icon_key,
			color_key = sub.color_key,
		}
	end

	-- -----------------------------------------------------
	-- 2. Base family (path → name)
	-- -----------------------------------------------------
	-- Path-based matching has higher priority than
	-- name-based matching to allow semantic differentiation
	-- (e.g. src/api vs api/)
	--
	local family = by_path.resolve(node) or by_name.resolve(node.name)
	if not family then
		return
	end

	-- -----------------------------------------------------
	-- 3. Family resolution
	-- -----------------------------------------------------
	-- icon_key: used to select folder icon
	-- color_key: used to resolve highlight group
	--
	-- IMPORTANT:
	-- icon_key and color_key are intentionally decoupled.
	-- Do NOT assume they are the same.
	--
	return {
		icon_key = family.icon_key,
		color_key = family.color_key or family.icon_key,
	}
end

return M
