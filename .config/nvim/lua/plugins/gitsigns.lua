return {
	"lewis6991/gitsigns.nvim",
	event = "VimEnter",
	opts = {
		current_line_blame = true,
		delay = 500,
		current_line_blame_formatter = '<author>, <author_time:%R> - <summary>'
	},
	keys = {
		{ "<leader>tb", "<Cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Git: Toggle blame" }
	}
}
