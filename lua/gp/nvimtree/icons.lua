---@class GpIconSet
---@field default string
---@field open string

---@type table<string, GpIconSet>
local icons = {
  images   = {
    default = "󰉏", -- solid
    open    = "󱃫", -- outline
  },

  icons    = {
    default = "󰀻",
    open    = "󰀼",
  },

  fonts    = {
    default = "󰛖",
    open    = "󰛗",
  },

  forms    = {
    default = "󱋣",
    open    = "󱋤",
  },

  ui       = {
    default = "󰏘",
    open    = "󰸌",
  },

  layout   = {
    default = "󰕮",
    open    = "",
  },

  core     = {
    default = "󰣞",
    open = "󰷎",
  },

  frontend = {
    default = "󱧴",
    open = "󱧵",
  },

  backend  = {
    default = "󱧼",
    open = "󱧽",
  },

  state    = {
    default = "",
    open = "󰮝",
  },

  database = {
    default = "󱋣",
    open = "󱋤",
  },

  platform = {
    default = "󰌢",
    open = "󰌣",
  },

  game     = {
    default = "󰐣",
    open = "󰐤",
  },

  data     = {
    default = "󰆼",
    open = "󰆽",
  },

  styles   = {
    default = "󰉘",
    open = "󰮞",
  },

  assets   = {
    default = "󰚝",
    open = "󰮟",
  },

  tests    = {
    default = "󱧸",
    open = "󱧹",
  },

  tools    = {
    default = "󰆕",
    open = "󰆖",
  },

  config   = {
    default = "",
    open = "󱂀",
  },

  build    = {
    default = "󰴋",
    open = "󰴌",
  },

  docs     = {
    default = "󱧺",
    open = "󱧻",
  },
}

return icons
