return {
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
    config = function() 
        require("telescope").load_extension("mapper")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        
        keymap.set(
        "n",
        "<leader>ps",
        "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep >')})<CR>",
        { desc = "Telescope grep find text" }
        )

        keymap.set(
        "n",
        "<C-p>",
        "<cmd>lua require('telescope.builtin').git_files()<CR>",
        { desc = "Telescope git files" }
        )

        keymap.set(
        "n",
        "<leader>pf",
        "<cmd>lua require('telescope.builtin').find_files()<CR>",
        { desc = "Telescope find files" }
        )

    end,
}
