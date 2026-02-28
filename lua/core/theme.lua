local M = {}

function M.setup()
  vim.cmd("highlight clear")
  vim.cmd("set termguicolors")

  -- Background
  vim.api.nvim_set_hl(0, "Normal",       { fg = "#E0E0E0", bg = "#0F1117" })
  vim.api.nvim_set_hl(0, "NormalFloat",  { fg = "#E0E0E0", bg = "#141722" })
  vim.api.nvim_set_hl(0, "CursorLine",   { bg = "#1A1F2B" })
  vim.api.nvim_set_hl(0, "LineNr",       { fg = "#3B4261" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#7AA2F7", bold = true })
  vim.api.nvim_set_hl(0, "SignColumn",   { bg = "NONE" })

  -- Syntax
  vim.api.nvim_set_hl(0, "Comment",   { fg = "#5C6370", italic = true })
  vim.api.nvim_set_hl(0, "Keyword",   { fg = "#C678DD", bold = true })
  vim.api.nvim_set_hl(0, "Function",  { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "String",    { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "Number",    { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "Type",      { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "Identifier",{ fg = "#E06C75" })

  -- Diagnostics
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#FF6B6B" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = "#56B6C2" })

  -- GitSigns
  vim.api.nvim_set_hl(0, "GitSignsAdd",    { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#E06C75" })

  -- Telescope
  vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#3B4261", bg = "#141722" })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#1A1F2B" })

  -- StatusLine
  vim.api.nvim_set_hl(0, "StatusLine",   { fg = "#E0E0E0", bg = "#1A1F2B" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#5C6370", bg = "#141722" })
end

return M
