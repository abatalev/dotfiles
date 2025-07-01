return {
  "xiyaowong/nvim-transparent",
  lazy = false,
  priority = 500,
  opts = {},
  keys = {
    { "<leader>uP", "<Cmd>TransparentToggle<CR>", desc = "Toggle Transparent" },
  },
  config = function(_, opts) 
    local transparent = require("transparent")
    transparent.setup(opts)
    transparent.toggle(true)
  end;
}