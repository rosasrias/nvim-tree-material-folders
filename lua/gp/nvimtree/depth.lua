-- =========================================================
-- Depth utilities for gp.nvimtree
--
-- This module provides helper functions related to
-- directory depth, without enforcing any visual logic.
--
-- Depth is intentionally decoupled from colors and
-- highlights to preserve semantic clarity.
-- =========================================================

local M = {}

---Get directory depth from absolute path
---@param node table nvim-tree DirectoryNode
---@return integer
function M.get(node)
  if not node or not node.absolute_path then
    return 1
  end

  local _, depth = node.absolute_path:gsub("/", "")
  return depth
end

return M
