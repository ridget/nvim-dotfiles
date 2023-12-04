return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✔︎",
					package_pending = "→",
					package_uninstalled = "✗",
				}
			}
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"bashls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"dockerls",
				"docker_compose_language_service",
				"elixirls",
				"jsonls",
				"ruby_ls",
				"standardrb",
				"rust_analyzer",
				"sqlls",
				"hydra_lsp",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})
	end
}
