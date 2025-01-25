return {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    keys = {
        vim.keymap.set("n", "<leader>t", ":ToggleTerm size=7 direction=horizontal<CR>"),
        vim.keymap.set("n", "<leader>T", ":ToggleTerm direction=float<CR>"),
    },
    opts = {
        auto_scroll = true, -- automatically scroll to the bottom on terminal output
        -- This field is only relevant if direction is set to 'float'
        float_opts = {
            -- The border key is *almost* the same as 'nvim_open_win'
            -- see :h nvim_open_win for details on borders however
            -- the 'curved' border is a custom border type
            -- not natively supported but implemented in this plugin.
            border = "single", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
            -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
            --  width = 80,
            --  height = 15,
            --  row = <value>,
            --  col = <value>,
            --  winblend = 3,
            --  zindex = <value>,
            title_pos = "center", -- 'left' | 'center' | 'right', position of the title of the floating window
        },
    },
}
