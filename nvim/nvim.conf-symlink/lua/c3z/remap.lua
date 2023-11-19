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
M.map("n", "<C-i>", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts, "LSP", "ngs-cmd-lua-", "Harpoon mark")
M.map("n", "<leader>cr", "<cmd>luafile %<CR>", opts, "CONFIG", "Reload current file", "Reload config")
M.map(
    "n",
    "<leader>ps",
    "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep >')})<CR>",
    opts,
    "Telescope",
    "TelescopeGrepFind",
    "Telescope grep find text"
)
M.map(
    "n",
    "<C-p>",
    "<cmd>lua require('telescope.builtin').git_files()<CR>",
    opts,
    "Telescope",
    "TelescopeGitFiles",
    "Telescope git files"
)
M.map(
    "n",
    "<leader>pf",
    "<cmd>lua require('telescope.builtin').find_files()<CR>",
    opts,
    "Telescope",
    "TelescopeFind",
    "Telescope find files"
)
M.map(
    "n",
    "<C-o>",
    "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
    opts,
    "LSP",
    "ngs-cmd-lua-require--lspsaga-preview-definiotion",
    "LSP Saga Preview Definition"
)
