return {
    "zk-org/zk-nvim",
    dependencies = { "nvim-telescope/telescope.nvim"},
    lazy = false,
    main = "zk",
    opts = {
        -- can be "telescope", "fzf", "fzf_lua", "minipick", or "select" (`vim.ui.select`)
        -- it's recommended to use "telescope", "fzf", "fzf_lua", or "minipick"
        picker = "telescope",

        lsp = {
            -- `config` is passed to `vim.lsp.start_client(config)`
            config = {
                cmd = { "zk", "lsp" },
                name = "zk",
                -- on_attach = ...
                -- etc, see `:h vim.lsp.start_client()`
            },

            -- automatically attach buffers in a zk notebook that match the given filetypes
            auto_attach = {
                enabled = true,
                filetypes = { "markdown" },
            },
        },
    },
    keys = {
        { "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>",                               noremap = true, silent = false, desc = "Zk New Note" },
        { "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>",                                       noremap = true, silent = false, desc = "Zk Notes" },
        { "<leader>zt", "<Cmd>ZkTags<CR>",                                                                  noremap = true, silent = false, desc = "Zk Note Tags" },
        { "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", noremap = true, silent = false, desc = "Zk Notes Match" },
        { "<leader>zf", ":'<,'>ZkMatch<CR>",                                                                mode = "v",     noremap = true, silent = false,         desc = "Zk match" }
    }
}
