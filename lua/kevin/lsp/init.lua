
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("kevin.lsp.lsp-installer")
require("kevin.lsp.handlers").setup()
require("kevin.lsp.null-ls")
