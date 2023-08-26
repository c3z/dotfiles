require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright" },
})

require("lspconfig").lua_ls.setup({ settings = { Lua = { diagnostics = { globals = { "use", "vim" } } } } })
require("lspconfig").pyright.setup({ filetypes = { "python", "py" } })
require("lspconfig").tsserver.setup({})
