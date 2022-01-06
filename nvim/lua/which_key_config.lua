local wk = require("which-key")
wk.setup {}

-- Register key mappings/documentations
mappings = {}
-- Code
mappings.c = { -- under common base key c
    name = "Code", -- group name
    c = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Jump Declaration" },
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Jump Definition" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Jump Type Definition" }, 
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "List Implementations" },
    h = {
        name = "Help", -- group name
        i = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Display Hover Info" },
        s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Display Signature" },
    },
    w = {
        name = "Workspace", -- group name
        a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
        r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
        l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List Workspace Folder" },
    },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    l = { "<cmd>lua vim.lsp.buf.references()<cr>", "List References" },
    a = { '<cmd>lua require"go.lsp".telescope_code_actions()<cr>', "Code Action" },
    s = {
        name = "Diagnostics", -- group name
        l = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Show Line" },
        n = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Next" },
        p = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Prev" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Loclist" },
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
}

-- Register
wk.register(mappings, { prefix = "<leader>" })

