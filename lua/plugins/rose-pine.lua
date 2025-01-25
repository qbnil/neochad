return {
    'rose-pine/neovim',
    lazy = false,
    enabled = true,
    -- ft = { 'lua' },
    -- keys = {
        --     { "<leader>Tr", 'colorscheme rose-pine-main' },
        -- },
    name = 'rose-pine',
    opts = {
        disable_background = true,
        extend_background_behind_borders = false,
        styles = {
            bold = true,
            italic = false,
        },
        highlight_groups = {
            ['@lsp.type.comment'] = { italic = true },
            Comment = { italic = true },
            DiagnosticUnnecessary = { italic = false },
            TabLine = { bg = 'none' },
            TabLineSel = { bg = 'none' },
            TabLineFill = { bg = 'none' },
            StatusLine = { fg = '#777693', bg = '#2c2a2c' },
            StatusLineNC = { link = "StatusLine" },
            FzfLuaTitle = { bg = 'none' },
            StatusLineTerm = { bg = '#262626', fg = '#8787aa' },
            StatusLineTermNC = { bg = '#262626', fg = '#8787aa' },
            FzfLuaPreviewTitle = { bg = 'none' },
            NormalFloat = { bg = 'none' },
            NormalNC = { bg = 'none' },
            Keyword = { fg = '#588971' },
            String = { fg = '#FAC7AA' },
            ['@function.call.rust'] = { link = '@function.method' },
            -- Function = { fg = '#C7616F' },
            ['@lsp.type.function.lua'] = { fg = '#C7616F' },
            ['@constant.macro'] = { fg = '#C7616F' },
            ['@property'] = { fg = '#AAD2C5' },
            ['@keyword.conditional'] = { fg = "#588971" },
            ['@keyword.return'] = { fg = "#588971" },
            ['@keyword.import'] = { fg = "#588971" },
            ['@keyword.exception'] = { fg = "#588971" },
            ['@keyword.repeat'] = { fg = "#588971" },
            -- ['@lsp.typemod.function.defaultLibrary.lua'] = { fg = '#C7616F' },
            -- white
            Include = { fg = '#D7D3D1' },
            Pmenu = { bg = '#2c2a2c' },
            PmenuSel = { bg = "#343234" }
        },
    },
    config = function(_, opts)
        require('rose-pine').setup(opts)
        vim.cmd('colorscheme rose-pine-main')
    end,
}
