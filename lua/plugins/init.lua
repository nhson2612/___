-- ===============================
-- Plugins Loader
-- ===============================

require("lazy").setup({
    -- UI & Theme
    require("plugins.theme"),
    require("plugins.lualine"),
    require("plugins.alpha"),
    require("plugins.indent-blankline"),

    -- File Management
    require("plugins.nvim-tree"),
    require("plugins.telescope"),

    -- LSP & Completion
    require("plugins.lsp"),
    require("plugins.cmp"),

    -- Syntax & Editing
    require("plugins.treesitter"),
    require("plugins.autopairs"),
    require("plugins.comment"),

    -- Terminal
    require("plugins.toggleterm"),

    -- Git
    require("plugins.gitsigns"),

    -- Utilities
    require("plugins.which-key"),

    require("plugins.rust"),

    require("plugins.icons"),
})
