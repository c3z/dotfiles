 local M = require("c3z.util-map")
  local opts = { noremap = true, silent = true, }
 --wk.register({
    --[""] = { "", "" },
  --  ["K"] = { "vim.lsp.buf.hover", "Hover to buf" },
   -- ["<leader>g"] = { name = "Go to" },
   -- ["<leader>gd"] = { "<cmd>lua vim.lsp.buf.definition<CR>", "Go to definition" },
   -- ["<leader>gi"] = { ":lua vim.lsp.buf.implementation<CR>", "Go to implementation" },
   -- ["<leader>pv"] = { "<cmd>Ex<CR>", "Explorer" },
   -- ["<C-o>"] = { ':lua require("harpoon.ui").toggle_quick_menu()<CR>', "Toggle harpoon mark" },
   -- ["<C-i>"] = { ':lua require("harpoon.mark").add_file()<CR>', "Add file to harpoon mark" },
   -- ["<C-w>"] = { "w<CR>", "Save file" },
--}, { mode = "n" })
M.map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts, "LSP", "ngs-cmd-lua-vim-lsp-buf-hover", "Hover to buf")
M.map("n", "<C-o>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts, "LSP", "ngs-cmd-lua-require--lspsaga-preview-definiotion", "LSP Saga Preview Definition")
