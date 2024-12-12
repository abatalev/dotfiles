return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			-- local configs = require ("lspconfig/configs")
			-- if not configs.golangci_lint_ls then
			-- 	configs.golangci_lint_ls = {
			-- 		default_config = {
			-- 			cmd = { 'golangci-lint-langserver' },
			-- 			root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
			-- 			init_options = {
			-- 				command = { "~/go/bin/golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" },
			-- 			}
			-- 		}
			-- 	}
			-- end
			lspconfig.golangci_lint_ls.setup({ filetypes = { 'go', 'gomod' } })
			lspconfig.gopls.setup({})
			lspconfig.marksman.setup({})
			lspconfig.lua_ls.setup({})
			-- lspconfig.tsserver.setup({})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename Symbol" })
					vim.keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<Leader>lf", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end
	}
}
