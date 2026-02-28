-- ===============================
-- Fuzzy Finder: Telescope
-- ===============================

return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                layout_config = {
                    horizontal = { preview_width = 0.55 },
                },
                file_ignore_patterns = {
                    "node_modules/",
                    "%.git/",
                    "dist/",
                    "build/",
                    "%.next/",
                    "coverage/",
                    "%.cache/",
                    "vendor/",
                    "target/",
                },
            },
            pickers = {
                find_files = {
                    hidden = false,
                    no_ignore = false,
                },
            },
        })
    end,
}
