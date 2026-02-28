-- ===============================
-- File Explorer: NvimTree
-- ===============================

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
            view = { width = 35 },
            renderer = {
                group_empty = true,
                icons = {
                    glyphs = {
                        default = "",
                        folder = {
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                        },
                    },
                },
            },
            filters = { dotfiles = false },
        })
    end,
}
