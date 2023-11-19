local M = require("c3z.util-map")
local opts = { noremap = true, silent = true }
--wk.register({
--[""] = { "", "" },
--  ["K"] = { "vim.lsp.buf.hover", "Hover to buf" },
-- ["<leader>g"] = { name = "Go to" },
-- ["<leader>gd"] = { "<cmd>lua vim.lsp.buf.definition<CR>", "Go to definition" },
-- ["<leader>gi"] = { ":lua vim.lsp.buf.implementation<CR>", "Go to implementation" },
-- ["<leader>pv"] = { "<cmd>Ex<CR>", "Explorer" },
--}, { mode = "n" })
M.map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts, "LSP", "ngs-cmd-lua-vim-lsp-buf-hover", "Hover to buf")
M.map("n", "<leader>cr", "<cmd>luafile %<CR>", opts, "CONFIG", "Reload current file", "Reload config")
