return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "ts_ls", "eslint", "clangd" },
            automatic_installation = true,
        })

        -- TypeScript/JavaScript
        vim.lsp.config("ts_ls", {})
        vim.lsp.enable("ts_ls")

        -- ESLint
        vim.lsp.config("eslint", {})
        vim.lsp.enable("eslint")

        -- C/C++
        vim.lsp.config("clangd", {
            cmd = { "clangd", "--background-index", "--clang-tidy" },
        })
        vim.lsp.enable("clangd")

        -- Diagnostic config
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = true,
            severity_sort = true,
        })

        -- Keymaps
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local opts = { buffer = args.buf }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
        })
    end,
}
