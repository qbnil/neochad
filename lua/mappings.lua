require "nvchad.mappings"

vim.keymap.set("n", "<leader>pv", function()
	if vim.bo.filetype == "netrw" then
		vim.cmd("Rexplore")
	else
		vim.cmd("Explore")
	end
end, { silent = true })
vim.keymap.set("n", "<leader>pV", function()
	if vim.bo.filetype == "netrw" then
		vim.cmd("Rexplore")
	else
		vim.cmd("Vexplore")
	end
end, { silent = true })
vim.keymap.set({ "n" }, "<leader>L", "<cmd>Lazy<CR>", { silent = true, desc = 'Open Lazy window' })
vim.keymap.set("x", "<leader>P", [["_dP]], { silent = true })
vim.keymap.set({ "n", "v" }, "j", [[gj]], { silent = true })
vim.keymap.set({ "n", "v" }, "k", [[gk]], { silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { silent = true })
vim.keymap.set("n", "<leader>y", [["+Y]], { silent = true })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = true })
vim.keymap.set("t", "<A-w>", [[<C-\><C-n><C-w>w]], { silent = true })
vim.keymap.set({ "n", "v" }, "<A-w>", [[<C-w>]], { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>q", "<cmd>:q<CR>", { silent = true })
