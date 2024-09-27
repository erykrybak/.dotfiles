vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

vim.keymap.set('n', '<C-Left>', '<C-w>h', {})
vim.keymap.set('n', '<C-Down>', '<C-w>j', {})
vim.keymap.set('n', '<C-Up>', '<C-w>k', {})
vim.keymap.set('n', '<C-Right>', '<C-w>l', {})

vim.keymap.set('n', '<leader>r', function()
    local filename = vim.fn.expand('%:p')
    if filename == '' then
        print('No file to compile')
        return
    end
    vim.cmd('below split')
    vim.cmd.terminal()
    vim.api.nvim_chan_send(vim.bo.channel, "clear && g++ " .. filename .. " && ./a.out && rm a.out\r")
end, { noremap = true, silent = true })
