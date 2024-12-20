-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- call fidget setup  
require("fidget").setup({})

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "rust_analyzer", "pyright", "denols", "jdtls" }
local nvlsp = require "nvchad.configs.lspconfig"
local util = require "lspconfig/util"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
lspconfig.rust_analyzer.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "rust" },
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        allFeatures = true
      }
    }
  }
}

-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- Keymaps
vim.keymap.set("n", "<leader>dp", function()
  vim.diagnostic.open_float({ scope = "line" })
end, {})
