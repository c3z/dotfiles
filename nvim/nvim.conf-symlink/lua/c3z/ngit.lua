local M = require("c3z.util-map")
local opts = { noremap = true, silent = true }
local neogit = require('neogit')

neogit.setup {}

M.map("n","<leader>gs", "<cmd>lua require('neogit').open({})<CR>",opts,"Git","GitStatus","Neogit status")

M.map("n","<leader>ga", "<cmd>!git fetch --all<CR>",opts,"Git","GitFetchAll","Git fetch all");

