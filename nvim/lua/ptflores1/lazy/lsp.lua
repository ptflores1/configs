return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "williamboman/mason.nvim",
        "j-hui/fidget.nvim",
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },

    config = function()
        require("fidget").setup({})
        local mason = require("mason")

        mason.setup()

        local capabilities = require('blink.cmp').get_lsp_capabilities()
        vim.lsp.config('lua_ls', { capabilities = capabilities })
        vim.lsp.config('terraform', { capabilities = capabilities })
        vim.lsp.enable({ 'lua_ls', 'basedpyright', 'tailwindcss', 'ts_ls', 'sqlls', 'ruff', 'terraform' })

        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
