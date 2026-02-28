-- ===============================
-- Core Keymaps
-- ===============================

local keymap = vim.keymap.set

-- General
keymap("n", "<leader>w", ":w<CR>", { desc = "Save" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap("n", "<Esc>", ":noh<CR>", { desc = "Clear highlights" })

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Down window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Up window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Right window" })

-- File explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Find text" })
keymap("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find help" })
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recent files" })
keymap("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Keymaps cheatsheet" })
keymap("n", "<leader>fc", ":Telescope commands<CR>", { desc = "Commands" })

-- Buffer navigation
keymap("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<leader>x", ":bdelete<CR>", { desc = "Close buffer" })

-- Move lines
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- C++ compile & run
keymap("n", "<F5>", ":w<CR>:!g++ -std=c++17 -O2 -Wall % -o %:r && ./%:r<CR>", { desc = "Compile & run C++" })

-- Terminal keymaps
keymap("n", "<leader>th", ":ToggleTerm size=15 direction=horizontal<CR>", { desc = "Horizontal terminal" })
keymap("n", "<leader>tv", ":ToggleTerm size=80 direction=vertical<CR>", { desc = "Vertical terminal" })
keymap("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "Float terminal" })
keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { desc = "Lazygit" })
keymap("n", "<leader>tn", "<cmd>lua _node_toggle()<CR>", { desc = "Node REPL" })
keymap("n", "<leader>tp", "<cmd>lua _python_toggle()<CR>", { desc = "Python REPL" })
keymap("n", "<leader>tt", "<cmd>lua _htop_toggle()<CR>", { desc = "Htop" })

-- Terminal mode mappings
keymap("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Terminal left window" })
keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Terminal down window" })
keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Terminal up window" })
keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Terminal right window" })

-- Cheatsheet popup
keymap("n", "<leader>?", function()
    require("utils.cheatsheet").show()
end, { desc = "Quick cheatsheet" })

-- Window resizing
keymap("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease height" })
keymap("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase width" })

-- Go to usages (references)
keymap("n", "gr", ":Telescope lsp_references<CR>", { desc = "Go to references" })
-- Hoặc nếu muốn dùng leader key:
-- keymap("n", "<leader>fu", ":Telescope lsp_references<CR>", { desc = "Find usages" })
