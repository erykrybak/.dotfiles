require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 3

vim.keymap.set("n", "<space>xx", "<cmd>source %<CR>", { desc = "Source Current File" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Execute Lua Line" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Execute Lua Selection" })

vim.keymap.set('n', '<C-Left>', '<C-w>h', {})
vim.keymap.set('n', '<C-Down>', '<C-w>j', {})
vim.keymap.set('n', '<C-Up>', '<C-w>k', {})
vim.keymap.set('n', '<C-Right>', '<C-w>l', {})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
