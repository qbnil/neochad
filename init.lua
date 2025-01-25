vim.g.mapleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy_conf"

-- load plugins
require("lazy").setup({
    {
        import = "plugins",
    },
}, lazy_config)

-- Settings
-- :nohlsearch
vim.opt.guicursor = ""
vim.o.splitright = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.g.netrw_winsize = 15
vim.o.undofile = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 8
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 2
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"

-- Keymaps
vim.keymap.set("n", "<leader>pv", function()
    if vim.bo.filetype == "netrw"
        then
            vim.cmd("Rexplore")
        else
            vim.cmd("Explore")
        end
    end, { silent = true }
)
vim.keymap.set("n", "<leader>pV", function()
    if vim.bo.filetype == "netrw"
        then
            vim.cmd("Lexplore")
        else
            vim.cmd("Lexplore")
        end
    end, { silent = true }
)
vim.keymap.set({ "n" }, "<leader>L", "<cmd>Lazy<CR>", { silent = true, desc = 'Open Lazy window' })
vim.keymap.set("x", "<leader>P", [["_dP]], { silent = true })
vim.keymap.set({ "n", "v" }, "j", [[gj]], { silent = true })
vim.keymap.set({ "n", "v" }, "k", [[gk]], { silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { silent = true })
vim.keymap.set("n", "<leader>y", [["+Y]], { silent = true })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = true } )
vim.keymap.set("t", "<A-w>", [[<C-\><C-n><C-w>w]], { silent = true })
vim.keymap.set({ "n", "v" }, "<A-w>", [[<C-w>]], { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>q", "<cmd>:q<CR>", { silent = true })
vim.keymap.set("n", "<A-r>", [[<C-^>]])

-- Autocmds
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 80 })
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("syntax_off", { clear = true }),
    callback = function ()
        vim.cmd[[syntax off]]
    end
})
