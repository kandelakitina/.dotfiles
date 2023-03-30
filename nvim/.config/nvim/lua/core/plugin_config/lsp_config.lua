-- import plugin safely
local setup, cmp_nvim = pcall(require, "cmp_nvim_lsp")
if not setup then
  return
end

local on_attach = function(_, _)
	-- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for curso
  vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side

	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', 'C-k', vim.lsp.buf.signature_help, {})
	vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, {})
	vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, {})
end

-- Adverstising completion capabilities to LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'lspconfig'.html.setup{ 
	on_attach = on_attach,
	capabilities = capabilities, 
}

require'lspconfig'.cssls.setup{ 
	on_attach = on_attach,
	capabilities = capabilities, 
}

require'lspconfig'.lua_ls.setup{ 
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}

require'lspconfig'.emmet_ls.setup{ 
	on_attach = on_attach,
	capabilities = capabilities, 
}

require'lspconfig'.tailwindcss.setup{ 
	on_attach = on_attach,
	capabilities = capabilities, 
}

require'lspconfig'.ruby_ls.setup{ 
	on_attach = on_attach,
	capabilities = capabilities, 
}

require'lspconfig'.tsserver.setup {
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
}

-- configure emmet language server
require'lspconfig'.emmet_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})