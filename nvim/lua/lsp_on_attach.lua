-- Based on https://github.com/ray-x/go.nvim/blob/master/lua/go/lsp.lua
-- Is used in go.nvim's on attach handler.

return function(client, bufnr)
    local uri = vim.uri_from_bufnr(bufnr)
    if uri == "file://" or uri == "file:///" or #uri < 11 then
        return { error = "invalid file", result = nil }
    end

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Add keybindings specific to go via which-key plugin.
    require("which-key").register({
        g = {
            name = "Go (go.nvim)",
            c = { "<cmd>lua require('go.comment').gen()<cr>", "Gen Comment Stub" }
        }
    }, { prefix = "<leader>" })

    -- Start lsp_signature plugin when attaching.
    require "lsp_signature".on_attach()
end
