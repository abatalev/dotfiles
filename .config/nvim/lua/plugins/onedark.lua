return {
	"navarasu/onedark.nvim",
	enabled = false,
	config = function()
		require('onedark').setup({
			transparent = false, style = 'darker'
		})
		require('onedark').load()
	end
}
