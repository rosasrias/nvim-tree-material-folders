-- =========================================================
-- Depth resolution utilities
--
-- This module is responsible for computing directory depth
-- and resolving depth-based icon variants.
--
-- Visual goal:
--   - Shallow folders → strong / primary icons
--   - Deep folders    → softer / subtle icons
--
-- This mimics VSCode icon themes where hierarchy reduces
-- visual noise the deeper you go.
-- =========================================================

local M = {}

-- =========================================================
-- Depth calculation
-- =========================================================

---Compute the depth of a directory node.
---
---Depth is calculated by counting "/" in the absolute path.
---If no absolute path is available (edge cases), depth = 1.
---
---@param node table nvim-tree DirectoryNode
---@return integer depth
function M.get(node)
	if not node.absolute_path then
		return 1
	end

	-- Count path separators to infer depth
	local _, depth = node.absolute_path:gsub("/", "")
	return depth
end

-- =========================================================
-- Icon resolution by depth
-- =========================================================

---Resolve icon variant based on directory depth.
---
---Priority:
---  - depth >= 4 → `icons.subtle`
---  - depth >= 2 → `icons.soft`
---  - otherwise  → nil (caller falls back)
---
---This allows:
---  - Deep technical folders to visually fade
---  - Top-level folders to stand out
---
---@param node table nvim-tree DirectoryNode
---@param family GpFolderFamily semantic family definition
---@param icons table<string, string> icon variants for the family
---@return string|nil icon
function M.icon(node, family, icons)
	local depth = M.get(node)

	if depth >= 4 then
		return icons.subtle or family.icon
	elseif depth >= 2 then
		return icons.soft or family.icon
	end

	-- Returning nil allows caller to fallback
end

return M
