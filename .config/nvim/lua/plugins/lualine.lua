return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			local colors = {
				blue   = '#80a0ff',
				cyan   = '#79dac8',
				black  = '#080808',
				white  = '#c6c6c6',
				red    = '#ff5189',
				violet = '#d183e8',
				grey   = '#303030',
			}

			local current_theme = {
				normal = {
					a = { fg = colors.black, bg = colors.violet },
					b = {
						fg = colors.white,
						bg = "NONE",
						-- ctermbg = "NONE"
					},
					c = { fg = colors.white, bg = "NONE" },
					y = { fg = colors.white, bg = colors.grey },
				},

				insert = {
					a = { fg = colors.black, bg = colors.blue },
					y = { fg = colors.white, bg = colors.grey },
				},
				visual = {
					a = { fg = colors.black, bg = colors.cyan },
					y = { fg = colors.white, bg = colors.grey },
				},
				replace = {
					a = { fg = colors.black, bg = colors.red },
					y = { fg = colors.white, bg = colors.grey },
				},

				inactive = {
					a = { fg = colors.white, bg = colors.black },
					b = { fg = colors.white, bg = colors.black },
					c = { fg = colors.white, bg = "NONE" },
				},
			}
			require('lualine').setup({
				options = {
					globalstatus = true,
					theme = current_theme,
					component_separators = { left = '', right = '' },
					section_separators = { left = '', right = '' },
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'filename', 'branch' },
					lualine_c = {
						'%=', --[[ add your center compoentnts here in place of this comment ]]
					},
					lualine_x = {},
					lualine_y = { 'filetype', 'progress' },
					lualine_z = { 'location' },
				},
				inactive_sections = {
					lualine_a = { 'filename' },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { 'location' },
				},
				tabline = {},
				extensions = {},
			})
		end
	}
}
