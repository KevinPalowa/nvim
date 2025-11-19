local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end
local vue_typescript_plugin_path = vim.fn.stdpath("data")
	.. "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin"
require("kevin.lsp.lsp-signature")
require("kevin.lsp.mason")
require("kevin.lsp.handlers").setup()
