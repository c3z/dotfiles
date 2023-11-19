return {
    "terrortylor/nvim-comment",

    config = function() 
        
        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        
        require('nvim_comment').setup() 

        -- keymap.set("n","<leader>;t","<cmd>CommentToggle<CR>", { desc = "Toogle comment" } )

    end,
}

