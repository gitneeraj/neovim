local lsp_installer = require 'nvim-lsp-installer'
local lsp_installer_servers = require 'nvim-lsp-installer.servers'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>gs', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
end

local disableFormat = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  on_attach(client, bufnr)
end

local enableFormat = function(client, bufnr)
  client.resolved_capabilities.document_formatting = true
  on_attach(client, bufnr)
end

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol
                                                                       .make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'}
  }
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach
  }
end

-- install LSP servers
local function installServer(name)
  local ok, server = lsp_installer_servers.get_server(name)
  if ok then if not server:is_installed() then server:install() end end
end

local function installServers(names)
  for _, name in pairs(names) do installServer(name) end
end

-- find a list of available ones here: https://github.com/williamboman/nvim-lsp-installer
installServers({
  'angularls', 'sumneko_lua', 'bashls', 'dockerls', 'pyright', 'jsonls', 'cssls', 'tsserver', 'html'
})

-- setup installed servers
lsp_installer.on_server_ready(function(server)
  local opts = make_config()

  if server.name == 'sumneko_lua' then opts.on_attach = disableFormat end
  if server.name == 'cssls' then opts.on_attach = disableFormat end
  if server.name == 'jsonls' then opts.on_attach = disableFormat end
  if server.name == 'html' then opts.on_attach = disableFormat end

  if server.name == "efm" then opts = require 'plugin-config.efm' end

  if server.name == "eslint" then
    opts.on_attach = enableFormat
    opts.settings = {
      format = {enable = true} -- this will enable formatting
    }
  end

  if server.name == "tsserver" then opts.on_attach = disableFormat end

  server:setup(opts)
end)
