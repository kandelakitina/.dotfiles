-- import plugin safely
local setup, mason = pcall(require, "mason")
if not setup then
  return
end

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"emmet_ls",
		"tailwindcss",
		"ruby_ls",
    "html",
    "cssls",
    "tsserver",
	}
})

require("mason-null-ls").setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "prettier", -- ts/js formatter
    "stylua", -- lua formatter
    "eslint_d", -- ts/js linter
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})