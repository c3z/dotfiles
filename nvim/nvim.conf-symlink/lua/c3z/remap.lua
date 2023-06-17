local nnoremap = require("c3z.keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")

nnoremap("<C-o>", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')

nnoremap("<C-i>", ':lua require("harpoon.mark").add_file()<CR>')

nnoremap("<C-w>", ':w<CR>') -- save
