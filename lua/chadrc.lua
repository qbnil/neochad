-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "solarized_osaka",
  theme_toggle = { "rosepine", "solarized_osaka" },
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
  transparency = false,
}
M.lsp = {
  signature = false
}

M.ui = {
  -- cmp = {
  --  lspkind_text = true,
  --  style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  --  format_colors = {
  --    tailwind = false,
  --  },
  --},
  telescope = { style = "borderless" }, -- borderless / bordered
  statusline = {
    theme = "vscode",                  -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    order = nil,
    modules = nil,
  },
  tabufline = {
    enabled = false,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },
  nvdash = {
    load_on_startup = false,
  },
  term = {
    winopts = { number = false },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },
}

return M
