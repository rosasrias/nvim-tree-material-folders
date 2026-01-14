local by_path = require("gp.nvimtree.match_path")
local by_name = require("gp.nvimtree.match_name")
local by_sub  = require("gp.nvimtree.match_subfamily")

local M       = {}

---@param node table
---@return { icon_key: string, color_key: string }|nil
function M.resolve(node)
  -- 1. Subfamily (highest priority)
  local sub = by_sub.resolve(node)
  if sub then
    return {
      icon_key = sub.icon_key,
      color_key = sub.color_key,
    }
  end

  -- 2. Base family
  local family = by_path.resolve(node) or by_name.resolve(node.name)
  if not family then
    return
  end

  return {
    icon_key = family.icon_key,
    color_key = family.icon_key,
  }
end

return M
