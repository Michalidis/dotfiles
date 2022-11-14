require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local nvim_lsp = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup_handlers({function(server_name)
    local opts = {}
    nvim_lsp[server_name].setup(opts)
end})

