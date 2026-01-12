# gp.nvimtree

Folder icons, colors and semantics for **nvim-tree**.

`gp.nvimtree` brings semantic folder families, depth-aware icons,
and color hierarchy to Neovim — inspired by VSCode icon themes,
but fully configurable and extensible.

---

## ✨ Features

- 📂 **Semantic folder families**
  - frontend, backend, domain, database, assets, mobile, desktop, infra, etc
- 🔥 **Path-based matching**
  - `src/api/**`, `src/ui/**`, `cmd/**`, `android/app/**`
- 🎨 **Depth-aware icons & colors**
  - deep folders fade visually (less noise)
- 🧠 **Parity**
  - same mental model, same hierarchy rules
- ⚙️ **Fully configurable**
  - override families, icons, highlights, matchers
- 🧩 **Clean architecture**
  - isolated patch, reusable modules, no magic

---

## 📦 Requirements

- Neovim >= 0.9
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- Nerd Font (for icons)

---

## 📥 Installation

### lazy.nvim

```lua
{
  "rosasrias/gp.nvimtree",
  dependencies = { "nvim-tree/nvim-tree.lua" },
  config = function()
    require("gp.nvimtree").setup()
  end,
}
```

## 🚀 Quick Start
Minimal setup (recommended):

```lua
require("gp.nvimtree").setup()
```

That's it.
Default presets already cover: 

- Web 
- Backend 
- Mobile 
- Desktop 
- Monorepos

## ⚙️ Configuration 
All configuration is **optional**.
Only override what you need.

```lua
require("gp.nvimtree").setup({
  families = {
    backend = {
      icon = "󰒋",
      icon_key = "backend",
      color = "#E06C75",
    },
  },

  icons = {
    backend = {
      default = "󰒋",
      open = "󰒌",
      soft = "󰒋",
      subtle = "󰒋",
    },
  },

  highlights = {
    backend = {
      base = "GpBackend",
      soft = "GpBackendSoft",
      subtle = "GpBackendSubtle",
    },
  },

  match_path = {
    { "/cmd/", "backend" },
    { "/internal/", "backend" },
    { "/android/app/", "mobile" },
  },

  match_name = {
    api = "backend",
    services = "backend",
    domain = "domain",
  },
})
```

## 🧠 Resolution Pipeline 

Folder resolution follows this order: 
1. **Path match**
 `src/api/**` → backend

2. **Name match**
`components/` → frontend

3. **Depth logic**
    - depth ≥ 4 → subtle
    - depth ≥ 2 → soft
    - top-level → strong

This is **exactly how VSCode icon themes work**.

## 🎨 Folder Families 

Families represent **roles**, not technologies. 

Examples: 

- frontend
- backend
- domain
- database
- state
- styles
- assets
- mobile
- desktop
- infra

You can add your own.

## 🧩 Supported Architectures

Works great with:

- Clean Architecture
- Hexagonal Architecture
- Monorepos
- Frontend apps
- Backend services
- Mobile (Android / iOS)
- Desktop (Electron / Tauri)
- Game / tooling projects

## 🛠️ Debugging

If a folder doesn’t get the icon you expect:

- check path match first
- then name match
- then depth

(Planned: :GpNvimTreeDebug)

## 📜 License

MIT @
