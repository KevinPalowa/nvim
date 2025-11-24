if not (vim.lsp and vim.lsp.config) then
	vim.notify("vim.lsp.config is not available", vim.log.levels.ERROR)
	return
end
local vue_typescript_plugin_path = vim.fn.stdpath("data")
	.. "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin"
require("kevin.lsp.lsp-signature")
require("kevin.lsp.handlers").setup()
