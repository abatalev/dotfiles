return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = true,
	keys = {
		{ '<leader>ff', '<cmd>Telescope find_files<cr>', desc = "Find files" },
		{ '<leader>fg', '<cmd>Telescope live_grep<cr>',  desc = "Grep" },
		{ 'leader>fb',  '<cmd>Telescope buffers<cr>',    desc = "Find buffers" },
		{ '<leader>fh', '<cmd>Telescope help_tags<cr>',  desc = "Telescope help" }
	}
}