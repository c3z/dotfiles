local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
packer.startup(function()
    local use = use


    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
        config = function()
            require("telescope").load_extension("mapper")
        end,
    })

    use({
        "lazytanuki/nvim-mapper",
        config = function()
            require("nvim-mapper").setup({})
        end,
        before = "telescope.nvim",
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })

    use({
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({
                plugins = {
                    spelling = {
                        enabled = true,
                    },
                },
                show_help = true,
                layout = {
                    height = { min = 6, max = 25 }, -- min and max height of the columns
                    width = { min = 20, max = 150 }, -- min and max width of the columns
                    spacing = 3,      -- spacing between columns
                    align = "left",   -- align columns left, center or right
                },
            })
        end,
    })

    use("ThePrimeagen/vim-be-good")
    use("ThePrimeagen/harpoon")

    use("christoomey/vim-tmux-navigator")
    use("daschw/leaf.nvim")
    use("vim-test/vim-test")
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    })
    use("terrortylor/nvim-comment")

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
