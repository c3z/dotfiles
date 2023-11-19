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

    "github/copilot.vim")

    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    })

end)
