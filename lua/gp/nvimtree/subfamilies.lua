-- =========================================================
-- Subfamily definitions for gp.nvimtree
--
-- Subfamilies allow refining a base family with
-- more specific semantics (icons + colors).
--
-- Example:
--   assets/images → images
--   components/forms → forms
-- =========================================================

---@class GpSubFamily
---@field icon_key string
---@field color_key string
---@field inherits string -- base family

---@type table<string, GpSubFamily>
local subfamilies = {

  -- =========================
  -- Assets
  -- =========================
  ["/assets/images"] = {
    inherits = "assets",
    icon_key = "images",
    color_key = "images",
  },

  ["/assets/icons"] = {
    inherits = "assets",
    icon_key = "icons",
    color_key = "icons",
  },

  ["/assets/fonts"] = {
    inherits = "assets",
    icon_key = "fonts",
    color_key = "fonts",
  },

  -- =========================
  -- Frontend components
  -- =========================
  ["/components/forms"] = {
    inherits = "frontend",
    icon_key = "forms",
    color_key = "forms",
  },

  ["/components/ui"] = {
    inherits = "frontend",
    icon_key = "ui",
    color_key = "ui",
  },

  ["/components/layout"] = {
    inherits = "frontend",
    icon_key = "layout",
    color_key = "layout",
  },

  -- =========================
  -- Backend / API
  -- =========================
  ["/api/supabase"] = {
    inherits = "backend",
    icon_key = "supabase",
    color_key = "supabase",
  },

  ["/api/routes"] = {
    inherits = "backend",
    icon_key = "routes",
    color_key = "routes",
  },
}

return subfamilies
