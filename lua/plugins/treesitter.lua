-- ===============================
-- Syntax Highlighting: Treesitter
-- ===============================

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "cpp",
                "javascript",
                "typescript",
                "tsx",
                "json",
                "html",
                "css",
                "lua",
                "vim",
                "markdown",
            },
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
        })
    end,
}
