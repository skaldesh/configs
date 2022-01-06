-- Activate the go language server gopls first.
local nvim_lsp = require('lspconfig')

--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true
--
--nvim_lsp.gopls.setup{
--	cmd = {'gopls'},
--    filetypes = { "go", "gomod", "gotmpl" },
--    root_dir = nvim_lsp.util.root_pattern("go.mod", ".git"),
--	capabilities = capabilities,
--	settings = {
--		gopls = {
--			experimentalPostfixCompletions = true,
--			analyses = {
--				fieldalignment = true,
--	        	unusedparams = true,
--				shadow = true,
--				nilness = true,
--				unusedwrite = true,
--	    	},
--	     	staticcheck = true,
--			codelenses = {
--				regenerate_cgo = true,
--			}
--		}
--	}
--}

-- Now activate the go.nvim plugin.
require 'go'.setup({
    goimport = 'gopls',
    gofmt = 'gofumpt',
    max_line_len = 140,
    tag_transform =false,
    lsp_cfg = true,
    lsp_on_attach = require("lsp_on_attach"),
    lsp_codelens = true,
    lsp_gofumpt = true
})
local protocol = require'vim.lsp.protocol'

