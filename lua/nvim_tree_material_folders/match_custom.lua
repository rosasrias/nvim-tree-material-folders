local config = require("nvim_tree_material_folders.config")

local M = {}

local function normalize(path)
  return path:gsub("\\", "/")
end

function M.match(node)
  local custom = config.options.custom_folders or {}
  if not next(custom) then
    return nil
  end

  local name = node.name
  local path = normalize(node.absolute_path or "")

  -- -------------------------------------------------
  -- 1. Exact name match (highest priority)
  -- -------------------------------------------------
  local c = custom[name]
  if c then
    return {
      icon_key = c.icon_key,
      color_key = c.color_key or c.icon_key,
      color = c.color,
      hl_group = c.hl_group,
    }
  end

  -- -------------------------------------------------
  -- 2. Path match
  -- -------------------------------------------------
  for key, c in pairs(custom) do
    if c.match == "path" and path:sub(- #key) == key then
      return {
        icon_key = c.icon_key,
        color_key = c.color_key or c.icon_key,
        color = c.color,
        hl_group = c.hl_group,
      }
    end
  end

  -- -------------------------------------------------
  -- 3. Pattern match
  -- -------------------------------------------------
  for _, c in pairs(custom) do
    if c.match == "pattern" and c.pattern and name:match(c.pattern) then
      return {
        icon_key = c.icon_key,
        color_key = c.color_key or c.icon_key,
        color = c.color,
        hl_group = c.hl_group,
      }
    end
  end

  return nil
end

return M
