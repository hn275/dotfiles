require("lspconfig")['sumneko_lua'].setup({
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT", -- language server for Neovim is LuaJIT
            },
            diagnostics = {
                globals = { "vim" }, -- get language server to recognize vim global
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true) -- make the server aware of Neovim runtime files
            },
            telemetry = {
                enable = false, -- disable sending telemetry data containing a randomized but unique indentifier
            },
        },
    },
})
