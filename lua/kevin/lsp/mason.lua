local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
mason_lspconfig.setup({
	automatic_installation = true,
	ensure_installed = { "lua_ls", "jsonls", "ts_ls" },
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end
lspconfig.dartls.setup({
	cmd = { "/opt/flutter/bin/dart", "language-server", "--protocol=lsp" },
})
mason_lspconfig.setup_handlers({
	-- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
	function(server_name)
		local opts = {
			on_attach = require("kevin.lsp.handlers").on_attach,
			capabilities = require("kevin.lsp.handlers").capabilities,
		}

		if server_name == "emmet_ls" then
			local emmetls_opts = require("kevin.lsp.settings.emmetls")
			opts = vim.tbl_deep_extend("force", emmetls_opts, opts)
		end
		if server_name == "jsonls" then
			local jsonls_opts = require("kevin.lsp.settings.jsonls")
			opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
		end
		if server_name == "sumneko_lua" then
			local sumneko_opts = require("kevin.lsp.settings.sumneko_lua")
			opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
		end

		if server_name == "ts_ls" then
local vue_typescript_plugin_path = vim.fn.stdpath('data')
      .. '/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin'
			local sumneko_opts ={
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
  location =vue_typescript_plugin_path,
              languages = { 'vue' },
            },
          },
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        single_file_support = false,
      } 
			opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
		end

		lspconfig[server_name].setup(opts)
	end,
})
