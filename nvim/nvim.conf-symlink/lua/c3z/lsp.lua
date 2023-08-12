local execute = vim.api.nvim_command

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright" }
})

require("lspconfig").lua_ls.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").tsserver.setup {}

-- Autoformat on save
vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
        execute(":Neoformat")
        vim.lsp.buf.format() 
    end
})



