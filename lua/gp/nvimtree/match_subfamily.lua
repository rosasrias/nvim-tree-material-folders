local subfamilies = require("gp.nvimtree.subfamilies")

local M = {}

function M.resolve(node)
  if not node.absolute_path then
    return
  end

  local path = node.absolute_path:lower():gsub("\\", "/")

  for pattern, sub in pairs(subfamilies) do
    if path:find(pattern, 1, true) then
      return sub
    end
  end
end

return M
