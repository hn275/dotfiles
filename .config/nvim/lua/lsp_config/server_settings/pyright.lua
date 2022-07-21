local opts = require("lsp_config.default_opts")
require('lspconfig')['pyright'].setup{
    on_attach = opts.on_attach,
    flags = opts.lsp_flags,
}
