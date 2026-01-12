-- =========================================================
-- Cache layer for gp.nvimtree
--
-- This module caches folder resolution results to avoid
-- recomputing family, icon and highlight on every render.
-- =========================================================

local M = {}

---@type table<string, table>
local store = {}

-- =========================================================
-- Cache helpers
-- =========================================================

---@param path string
---@return table|nil
function M.get(path)
	return store[path]
end

---@param path string
---@param value table
function M.set(path, value)
	store[path] = value
end

---@param path string
---@return boolean
function M.has(path)
	return store[path] ~= nil
end

function M.clear()
	store = {}
end

-- =========================================================
-- Public API
-- =========================================================

---Resolve or return cached result.
---
---If resolver is provided:
---  - compute + cache on miss
---
---If resolver is NOT provided:
---  - act as read-only cache lookup
---
---@param node table nvim-tree DirectoryNode
---@param resolver fun(): table|nil | nil
---@return table|nil
function M.resolve(node, resolver)
	-- No stable key → do not cache
	if not node.absolute_path then
		return resolver and resolver() or nil
	end

	local path = node.absolute_path

	-- Fast path: cache hit
	if M.has(path) then
		return M.get(path)
	end

	-- Cache miss + no resolver → read-only lookup
	if not resolver then
		return nil
	end

	-- Compute & cache
	local value = resolver()
	if value then
		M.set(path, value)
	end

	return value
end

return M
