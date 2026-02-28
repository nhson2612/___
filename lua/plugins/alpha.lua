-- ===============================
-- Dashboard: Alpha
-- ===============================

return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Header
    dashboard.section.header.val = {
        [[ ]],
        [[ ███╗   ██╗██╗  ██╗███████╗ ██████╗ ███╗   ██╗██████╗  ██████╗  ██████╗ ]],
        [[ ████╗  ██║██║  ██║██╔════╝██╔═══██╗████╗  ██║██╔══██╗██╔════╝ ██╔═══██╗]],
        [[ ██╔██╗ ██║███████║███████╗██║   ██║██╔██╗ ██║██████╔╝██║  ███╗██║   ██║]],
        [[ ██║╚██╗██║██╔══██║╚════██║██║   ██║██║╚██╗██║██╔═══╝ ██║   ██║██║   ██║]],
        [[ ██║ ╚████║██║  ██║███████║╚██████╔╝██║ ╚████║██║     ╚██████╔╝╚██████╔╝]],
        [[ ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝      ╚═════╝  ╚═════╝ ]],
        [[ ]],
        [[                     N H S O N 2 6 1 2                      ]],
        [[ ]],
    }
        -- Menu
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
            dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
            dashboard.button("g", "  Find text", ":Telescope live_grep<CR>"),
            dashboard.button("k", "⌨  Cheatsheet", ":Telescope keymaps<CR>"),
            dashboard.button("n", "  New file", ":enew<CR>"),
            dashboard.button("e", "  File explorer", ":NvimTreeToggle<CR>"),
            dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),
            dashboard.button("q", "  Quit", ":qa<CR>"),
        }

        -- Footer
        local function footer()
            local total_plugins = #vim.tbl_keys(require("lazy").plugins())
            return "⚡ Neovim loaded " .. total_plugins .. " plugins"
        end

        dashboard.section.footer.val = footer()

        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"
        dashboard.section.footer.opts.hl = "Type"

        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)

        -- Disable statusline in dashboard
        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
                vim.opt.laststatus = 0
            end,
        })

        vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            callback = function()
                vim.opt.laststatus = 3
            end,
        })
    end,
}
