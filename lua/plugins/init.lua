return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "folke/which-key.nvim",
    enabled = false
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css"
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false
  },
  {
    "hrsh7th/nvim-cmp",
    event = 'InsertEnter',
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function ()
      require "configs.cmp"
    end
  },
  {
    "theprimeagen/harpoon",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require  "configs.harpoon"
    end
  },
  {
    "CRAG666/code_runner.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.code-runner"
    end,
  },
  {
    'tpope/vim-fugitive',
    event = "VeryLazy",
    config = function()
      require "configs.fugitive"
    end
  }
}
