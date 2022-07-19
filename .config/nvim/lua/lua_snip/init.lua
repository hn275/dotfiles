local status, lua_snip = pcall(require, "luasnip")
if (not status) then return end

require("luasnip.loaders.from_vscode").lazy_load() -- To use existing vs-code from plugins
lua_snip.filetype_extend("javascript", { "javascriptreact" })
lua_snip.filetype_extend("javascript", { "html" })
