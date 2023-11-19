-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for concise use 

-- clear search highlight
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "clear search highlight" })

