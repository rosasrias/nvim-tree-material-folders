---@class GpColorVariants
---@field base string
---@field soft string
---@field muted string

---@type table<string, GpColorVariants>
local palette = {

  core = {
    base  = "#89b4fa", -- blue
    soft  = "#74a3e6",
    muted = "#4a6fa3",
  },

  frontend = {
    base  = "#a6e3a1", -- green
    soft  = "#8fcb8b",
    muted = "#5a7f57",
  },

  backend = {
    base  = "#f38ba8", -- red/pink
    soft  = "#d37690",
    muted = "#8a4b5b",
  },

  state = {
    base  = "#cba6f7", -- purple
    soft  = "#b08dd9",
    muted = "#6f5a8f",
  },

  database = {
    base  = "#fab387", -- orange
    soft  = "#dd9a73",
    muted = "#8f6347",
  },

  platform = {
    base  = "#89dceb", -- cyan
    soft  = "#6fbecb",
    muted = "#447a83",
  },

  game = {
    base  = "#94e2d5", -- teal
    soft  = "#78c2b6",
    muted = "#4f7f77",
  },

  data = {
    base  = "#f9e2af", -- yellow
    soft  = "#d7c18f",
    muted = "#8a7a55",
  },

  styles = {
    base  = "#74c7ec", -- light blue
    soft  = "#5fa8c7",
    muted = "#3c6b7d",
  },

  assets = {
    base  = "#f2cdcd", -- peach
    soft  = "#d4b0b0",
    muted = "#8a6f6f",
  },

  tests = {
    base  = "#b4befe", -- lavender
    soft  = "#9aa2dd",
    muted = "#61668f",
  },

  tools = {
    base  = "#7f849c", -- gray-blue
    soft  = "#676b82",
    muted = "#3f4254",
  },

  config = {
    base  = "#6c7086", -- gray
    soft  = "#585b70",
    muted = "#313244",
  },

  build = {
    base  = "#eba0ac", -- pink/orange
    soft  = "#cd8a95",
    muted = "#84565d",
  },

  docs = {
    base  = "#89ddff", -- sky
    soft  = "#6fb7d9",
    muted = "#446f8a",
  },
}

return palette
