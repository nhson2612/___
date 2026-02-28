-- ===============================
-- Cheatsheet Utility
-- ===============================

local M = {}

function M.show()
    -- Create buffer
    local buf = vim.api.nvim_create_buf(false, true)

    -- Cheatsheet content
    local lines = {
        "╔══════════════════════════════════════════════════════════════════╗",
        "║                    🚀 NEOVIM CHEATSHEET                          ║",
        "╚══════════════════════════════════════════════════════════════════╝",
        "",
        "📁 FILE & FIND",
        "  <leader>ff → Find files           <leader>fr → Recent files",
        "  <leader>fg → Find text            <leader>fb → Buffers",
        "  <leader>fk → All keymaps          <leader>e  → File explorer",
        "",
        "💻 TERMINAL",
        "  Ctrl+\\     → Toggle terminal     <leader>tf → Float terminal",
        "  <leader>th → Horizontal term      <leader>tv → Vertical term",
        "  <leader>gg → Lazygit              <leader>tn → Node REPL",
        "",
        "🪟 WINDOW",
        "  Ctrl+h/j/k/l → Navigate windows",
        "  Tab / Shift+Tab → Next/Prev buffer",
        "",
        "🔧 LSP",
        "  gd         → Go to definition     K          → Hover docs",
        "  <leader>rn → Rename               <leader>ca → Code action",
        "",
        "✏️  EDIT",
        "  gcc        → Comment line         gc         → Comment (visual)",
        "  J/K        → Move line up/down (visual)",
        "",
        "⚡ AUTOCOMPLETE",
        "  Ctrl+Space → Trigger              Enter      → Confirm",
        "  Tab/Shift+Tab → Navigate",
        "",
        "🎯 SHORTCUTS",
        "  <leader>w  → Save                 <leader>q  → Quit",
        "  F5         → Compile & run C++",
        "",
        "❓ HELP",
        "  <leader>fk → All keymaps          <leader>?  → This cheatsheet",
        "  :help      → Neovim help",
        "",
        "Press 'q' or ESC to close",
    }

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- Calculate window size
    local width = 70
    local height = #lines + 2
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    -- Create window
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    })

    -- Set options
    vim.api.nvim_buf_set_option(buf, "modifiable", false)
    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

    -- Keymaps to close
    vim.api.nvim_buf_set_keymap(
        buf,
        "n",
        "q",
        "<cmd>close<CR>",
        { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
        buf,
        "n",
        "<Esc>",
        "<cmd>close<CR>",
        { noremap = true, silent = true }
    )

    -- Syntax highlighting
    vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
end

return M
