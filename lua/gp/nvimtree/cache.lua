-- =========================================================
-- Cache layer for gp.nvimtree
-- =========================================================

local M = {}

---@type table<string, table>
local store = {}

local function make_key(node)
  if not node.absolute_path then
    return nil
  end

  return node.absolute_path .. (node.open and ":open" or ":closed")
end

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

---Resolve or return cached result.
---@param node table
---@param resolver fun(): table|nil | nil
---@return table|nil
function M.resolve(node, resolver)
  local key = make_key(node)

  if not key then
    return resolver and resolver() or nil
  end

  if M.has(key) then
    return M.get(key)
  end

  if not resolver then
    return nil
  end

  local value = resolver()
  if value then
    M.set(key, value)
  end

  return value
end

return M
