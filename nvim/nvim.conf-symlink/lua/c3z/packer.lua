local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
packer.startup(function()
    local use = use


    use({
        config = function()
        end,
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })


    use("christoomey/vim-tmux-navigator")
    use("daschw/leaf.nvim")
    use("vim-test/vim-test")
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    })

    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/vim-vsnip")

    use("sbdchd/neoformat")
    use("elentok/format-on-save.nvim")
    use("github/copilot.vim")
end)
