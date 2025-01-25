return {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = 'InsertEnter',
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function ()
        local cmp = require('cmp')
        local ls = require('luasnip')
        cmp.setup({
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            window = {
                documentation = {
                    border = 'none',
                },
            },
            formatting = {
                fields = { "abbr", "kind", "menu" },
                -- here is where the change happens
                format = function(entry, item)
                    local menu_icon = {
                        nvim_lsp = "[Lsp]",
                        luasnip = "[Snip]",
                        buffer = "[Buf]",
                        path = "[Path]",
                        nvim_lua = "[Lua]",
                    }
                    item.menu = menu_icon[entry.source.name]
                    return item
                end,
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" },
                { name = "nvim_lua" },
            },
            appearance = {
                menu = {
                    direction = "auto",
                },
            },
            mapping = {
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<A-a>"] = cmp.mapping.confirm({ select = false }),
                ["<A-e>"] = cmp.mapping.abort(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif ls.expand_or_jumpable() then
                        vim.fn.feedkeys(
                            vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                            ""
                        )
                    else
                        fallback()
                    end
                end, { "i", "s", "n" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif ls.jumpable(-1) then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },

            -- Enable luasnip to handle snippet expansion for nvim-cmp
            snippet = {
                expand = function(args)
                    ls.lsp_expand(args.body)
                end,
            },
        })
    end

}
