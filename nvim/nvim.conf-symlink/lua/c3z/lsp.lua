
local nnoremap = require("c3z.keymap").nnoremap

nnoremap("K", vim.lsp.buf.hover)
nnoremap("<leader>gd", vim.lsp.buf.definition)
nnoremap("<leader>gi", vim.lsp.buf.implementation)
