-- Based on https://github.com/ray-x/go.nvim/blob/master/lua/go/lsp.lua
-- Is used in go.nvim's on attach handler.
-- local diagnostic_map = function(bufnr)
--   local opts = { noremap = true, silent = true }
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "]O", ":lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
-- end

return function(client, bufnr)
  --local function buf_set_keymap(...)
  --  vim.api.nvim_buf_set_keymap(bufnr, ...)
  --end
  local uri = vim.uri_from_bufnr(bufnr)
  if uri == "file://" or uri == "file:///" or #uri < 11 then
    return { error = "invalid file", result = nil }
  end
  -- diagnostic_map(bufnr)
  -- add highlight for Lspxxx

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- local opts = { noremap = true, silent = true }
 
 -- buf_set_keymap("n", "<leader>gc", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
 -- buf_set_keymap("n", "<leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
 -- buf_set_keymap("n", "<leader>gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
 -- buf_set_keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
 -- buf_set_keymap("n", "<leader>h", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
 -- buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
 -- buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
 -- buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
 -- buf_set_keymap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
 -- buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
 -- buf_set_keymap("n", "<leader>ca", '<cmd>lua require"go.lsp".telescope_code_actions()<CR>', opts)
 -- buf_set_keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
 -- buf_set_keymap("n", "<leader>dg", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
 -- buf_set_keymap("n", "<leader>dp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
 -- buf_set_keymap("n", "<leader>dn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
 -- buf_set_keymap("n", "<leader>dq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
 -- buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
 
 require "lsp_signature".on_attach()
end
