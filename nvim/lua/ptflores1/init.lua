require("ptflores1.remap")
require("ptflores1.set")
require("ptflores1.lazy_init")

local augroup = vim.api.nvim_create_augroup
local ptfloresGroup = augroup('ptflores1', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('LspAttach', {
    group = ptfloresGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        local client = vim.lsp.get_client_by_id(e.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup', 'preview', 'noselect' }
            vim.lsp.completion.enable(true, client.id, e.buf, { autotrigger = true })
        end

        -- Format on save
        if client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = e.buf,
                callback = function()
                    --vim.lsp.buf.format({ bufnr = e.buf, id = client.id })
                    require("conform").format({ { bufnr = e.buf, id = client.id } })
                end,
            })
        end
    end
})

vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#bb9af7", fg = "#0000FF" })
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'YankHighlight',
            timeout = 40,
        })
    end,
})
