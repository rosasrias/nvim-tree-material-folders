-- =========================================================
-- Cache layer for gp.nvimtree
--
-- This module caches folder resolution results to avoid
-- recomputing family, icon and highlight on every render.
--
-- Cache key:
--   - node.absolute_path
--
-- Cache value:
--   {
--     family = GpFolderFamily,
--     icon   = string,
--     hl     = string|nil
--   }
--
-- This significantly improves performance on large trees.
-- =========================================================

local M = {}

---@type table<string, table>
local store = {}

-- =========================================================
-- Cache helpers
-- =========================================================

---Get cached value for a path.
---
---@param path string
---@return table|nil
function M.get(path)
	return store[path]
end

---Set cached value for a path.
---
---@param path string
---@param value table
function M.set(path, value)
	store[path] = value
end

---Check if a path is cached.
---
---@param path string
---@return boolean
function M.has(path)
	return store[path] ~= nil
end

---Clear entire cache.
---Useful when reloading config or debugging.
function M.clear()
	store = {}
end

-- =========================================================
-- Public API
-- =========================================================

---Resolve or return cached result.
---
---This helper allows patch.lua to stay clean and declarative.
---
---@param node table nvim-tree DirectoryNode
---@param resolver fun(): table|nil
---@return table|nil
function M.resolve(node, resolver)
	if not node.absolute_path then
		return resolver()
	end

	local path = node.absolute_path

	if M.has(path) then
		return M.get(path)
	end

	local value = resolver()
	if value then
		M.set(path, value)
	end

	return value
end

return M
