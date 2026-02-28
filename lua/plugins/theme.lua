-- ===============================
-- Theme: Catppuccin
-- ===============================
return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false, -- load ngay khi start
    config = function()
      require("tokyonight").setup({
        style = "storm", -- storm | moon | night | day
        transparent = false,
        terminal_colors = true,

        styles = {
          comments = { italic = true },
          keywords = { bold = true },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },

        on_highlights = function(hl, c)
          hl.CursorLine = { bg = "#1a1f2b" }
          hl.LineNr = { fg = "#3b4261" }
          hl.CursorLineNr = { fg = c.blue, bold = true }
        end,
      })

      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
