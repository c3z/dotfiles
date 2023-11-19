return {
    "TimUntersberger/neogit",
    dependencies = {
       "nvim-lua/plenary.nvim",
    },

    config = function() 
        
        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        local neogit = require('neogit')

        neogit.setup {}

        keymap.set("n","<leader>gs", "<cmd>lua require('neogit').open({})<CR>",{desc = "Neogit status"})

        keymap.set("n","<leader>ga", "<cmd>!git fetch --all<CR>",{ desc = "Git fetch all" })

    end,
}

