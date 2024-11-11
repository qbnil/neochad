require("oil").setup({
  columns = { "icon" },
  view_options = {
    show_hidden = true,
  },
  float = {
    border = "single",
    max_width = 90,
    max_height = 30,
  }
})

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent dir"} )

-- open float
vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Open float oil"} )

