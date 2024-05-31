-- Neovim color theme converted from Emacs configuration

local colors = {
	background = "#041818",
	foreground = "#d3b58d",
	comment = "#3fdflf",
	string = "#0fdfaf",
	keyword = "white",
	builtin = "lightgreen",
	function_name = "white",
	variable = "#c8d4ec",
	warning = "#504038",
	highlight_foreground = "navyblue",
	highlight_background = "darkseagreen2",
	region_background = "blue",
	widget_field_foreground = "white",
	widget_single_line_field_background = "darkgray",
	cursor = "lightgreen",
}

vim.cmd("hi clear")
vim.cmd("syntax reset")

vim.o.background = "dark"
vim.o.termguicolors = true

-- Set editor background color
vim.cmd("hi Normal guibg=" .. colors.background .. " guifg=" .. colors.foreground)

-- Custom group tags and variable tags
vim.cmd("hi CustomGroupTag gui=underline guifg=lightblue")
vim.cmd("hi CustomVariableTag gui=underline guifg=lightblue")

-- Font lock faces
vim.cmd("hi Comment guifg=" .. colors.comment)
vim.cmd("hi String guifg=" .. colors.string)
vim.cmd("hi Keyword guifg=" .. colors.keyword)
vim.cmd("hi Function guifg=" .. colors.function_name)
vim.cmd("hi Identifier guifg=" .. colors.variable)
vim.cmd("hi WarningMsg guifg=" .. colors.warning)

-- Builtin and constant faces
vim.cmd("hi Constant guifg=" .. colors.builtin)
vim.cmd("hi Special guifg=" .. colors.builtin)

-- Highlighting
vim.cmd("hi Visual guibg=" .. colors.highlight_background .. " guifg=" .. colors.highlight_foreground)

-- Status line and cursor
vim.cmd("hi StatusLine gui=reverse")
vim.cmd("hi Cursor guibg=" .. colors.cursor)

-- Region background
vim.cmd("hi Visual guibg=" .. colors.region_background)

-- Widgets
vim.cmd("hi Pmenu guifg=" .. colors.widget_field_foreground)
vim.cmd("hi PmenuSel guibg=" .. colors.widget_single_line_field_background)
