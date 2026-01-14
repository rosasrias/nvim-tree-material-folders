-- =========================================================
-- Subfamily matcher
--
-- Resolves the most specific subfamily for a given node
-- based on its absolute path.
--
-- Matching rules:
--   - Uses absolute_path (lowercased, normalized)
--   - Plain string match (no patterns / regex)
--   - Longest path match wins (most specific)
-- =========================================================

local subfamilies = require("nvim_tree_material_folders.subfamilies")

local M = {}

-- Cache sorted subfamily patterns by specificity
local sorted_patterns = nil

local function get_sorted_patterns()
	if sorted_patterns then
		return sorted_patterns
	end

	sorted_patterns = {}

	for pattern, sub in pairs(subfamilies) do
		table.insert(sorted_patterns, {
			pattern = pattern,
			sub = sub,
			len = #pattern,
		})
	end

	table.sort(sorted_patterns, function(a, b)
		return a.len > b.len
	end)

	return sorted_patterns
end

---@param node table nvim-tree DirectoryNode
---@return NtmfSubFamily|nil
function M.resolve(node)
	if not node or not node.absolute_path then
		return
	end

	local path = node.absolute_path:lower():gsub("\\", "/")

	for _, entry in ipairs(get_sorted_patterns()) do
		if path:find(entry.pattern, 1, true) then
			return entry.sub
		end
	end
end

return M
