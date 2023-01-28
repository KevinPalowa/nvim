local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local sources = {
	--[[ formatting.eslint, ]]
	formatting.shfmt,
	formatting.prettierd,
	formatting.stylua,
	--[[ diagnostics.eslint_d, ]]
}
null_ls.setup({
	debug = false,
	sources = sources,
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format {async = false}
            augroup END
            ]])
		end
	end,
})
