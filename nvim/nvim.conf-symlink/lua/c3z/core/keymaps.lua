-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for concise use

-- clear search highlight
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "clear search highlight" })

keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover to buf" })
keymap.set("n", "<leader>cr", "<cmd>luafile %<CR>", { desc = "Reload current lua file" })
