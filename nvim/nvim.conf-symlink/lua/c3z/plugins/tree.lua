return {
	"nvim-tree/nvim-tree.lua",

	config = function()
		local keymap = vim.keymap -- for conciseness
		local nvim_tree = require("nvim-tree")

		nvim_tree.setup({ view = { side = "right", width = 30 }, filters = { dotfiles = true } })

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", { desc = "NvimTree - toggle" })
	end,
}
