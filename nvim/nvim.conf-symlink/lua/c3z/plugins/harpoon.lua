return {
    "ThePrimeagen/harpoon",
    dependencies = {
       "nvim-lua/plenary.nvim",
    },

     config = function() 
        
        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        keymap.set(
        "n",
        "<C-i>",
        "<cmd>lua require('harpoon.mark').add_file()<CR>",
        { desc = "Harpoon - add file to buff" }
        )

        keymap.set(
        "n",
        "<C-o>",
        "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
        { desc = "Harpoon - open harpoon" }
        )
            keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon mark" })
    keymap.set(
      "n",
      "<leader>hp",
      "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
      { desc = "Go to previous harpoon mark" }
    )

    end,
}

