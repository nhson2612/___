-- ===============================
-- Terminal Integration: ToggleTerm
-- ===============================

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<C-\>]],
            hide_numbers = true,
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            persist_mode = true,
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            autochdir = false,
            float_opts = {
                border = "curved",
                width = math.floor(vim.o.columns * 0.8),
                height = math.floor(vim.o.lines * 0.8),
                winblend = 3,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
            winbar = {
                enabled = true,
                name_formatter = function(term)
                    return term.name
                end,
            },
        })

        -- Custom terminal instances
        local Terminal = require("toggleterm.terminal").Terminal

        -- Lazygit
        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            float_opts = {
                border = "curved",
                width = math.floor(vim.o.columns * 0.9),
                height = math.floor(vim.o.lines * 0.9),
            },
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(
                    term.bufnr,
                    "n",
                    "q",
                    "<cmd>close<CR>",
                    { noremap = true, silent = true }
                )
            end,
            on_close = function(term)
                vim.cmd("startinsert!")
            end,
        })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        -- Node REPL
        local node = Terminal:new({
            cmd = "node",
            direction = "float",
            hidden = true,
        })

        function _node_toggle()
            node:toggle()
        end

        -- Python REPL
        local python = Terminal:new({
            cmd = "python3",
            direction = "float",
            hidden = true,
        })

        function _python_toggle()
            python:toggle()
        end

        -- Htop
        local htop = Terminal:new({
            cmd = "htop",
            direction = "float",
            hidden = true,
        })

        function _htop_toggle()
            htop:toggle()
        end
    end,
}
