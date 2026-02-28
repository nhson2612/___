return {
  -- Plugin chính cho Rust (LSP, Debugger, Formatting, Code Actions)
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        -- Cấu hình Tools
        tools = {
          hover_actions = {
            auto_focus = true,
            border = "rounded",
          },
          -- Inlay hints (hiển thị type hints inline)
          inlay_hints = {
            auto = true,
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
          },
          -- Code lens (hiển thị references, implementations)
          code_lens = {
            enable = true,
          },
        },

        -- Cấu hình LSP (Rust Analyzer)
        server = {
          on_attach = function(client, bufnr)
            -- Phím tắt cho Rust
            local map = function(keys, func, desc)
              vim.keymap.set('n', keys, func, {
                buffer = bufnr,
                desc = "Rust: " .. desc,
                silent = true
              })
            end

            -- LSP Actions
            map("K", function() vim.cmd.RustLsp('hover', 'actions') end, "Hover Actions")
            map("gd", vim.lsp.buf.definition, "Go to Definition")
            map("gD", vim.lsp.buf.declaration, "Go to Declaration")
            map("gi", vim.lsp.buf.implementation, "Go to Implementation")
            map("gr", vim.lsp.buf.references, "Show References")
            map("gs", vim.lsp.buf.signature_help, "Signature Help")

            -- Code Actions
            map("<leader>ca", function() vim.cmd.RustLsp('codeAction') end, "Code Action")
            map("<leader>cr", vim.lsp.buf.rename, "Rename Symbol")

            -- Run & Debug
            map("<leader>rr", function() vim.cmd.RustLsp('runnables') end, "Runnables")
            map("<leader>rt", function() vim.cmd.RustLsp('testables') end, "Run Tests")
            map("<leader>rd", function() vim.cmd.RustLsp('debuggables') end, "Debug")

            -- Cargo Commands
            map("<leader>rc", function() vim.cmd.RustLsp('openCargo') end, "Open Cargo.toml")
            map("<leader>rp", function() vim.cmd.RustLsp('parentModule') end, "Parent Module")

            -- Macro & Documentation
            map("<leader>re", function() vim.cmd.RustLsp('expandMacro') end, "Expand Macro")
            map("<leader>rh", function() vim.cmd.RustLsp('renderDiagnostic') end, "Render Diagnostic")
            map("<leader>rd", function() vim.cmd.RustLsp('openDocs') end, "Open docs.rs")

            -- View Crate Graph
            map("<leader>rg", function() vim.cmd.RustLsp('crateGraph') end, "View Crate Graph")

            -- Workspace Commands
            map("<leader>rw", function() vim.cmd.RustLsp('reloadWorkspace') end, "Reload Workspace")

            -- Diagnostics
            map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
            map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
            map("<leader>dl", vim.diagnostic.setloclist, "Diagnostic List")

            -- Format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end,

          default_settings = {
            ['rust-analyzer'] = {
              -- Cargo settings
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = {
                  enable = true,
                },
              },

              -- Check on save settings
              checkOnSave = {
                command = "clippy", -- Sử dụng clippy thay vì check
                extraArgs = {
                  "--all-targets",
                  "--all-features",
                },
              },

              -- Proc macro support
              procMacro = {
                enable = true,
                attributes = {
                  enable = true,
                },
              },

              -- Diagnostics
              diagnostics = {
                enable = true,
                experimental = {
                  enable = true,
                },
                disabled = {
                  -- "unresolved-proc-macro",
                },
              },

              -- Inlay hints
              inlayHints = {
                bindingModeHints = {
                  enable = true,
                },
                chainingHints = {
                  enable = true,
                },
                closingBraceHints = {
                  minLines = 10,
                },
                closureReturnTypeHints = {
                  enable = "with_block",
                },
                lifetimeElisionHints = {
                  enable = "skip_trivial",
                  useParameterNames = true,
                },
                parameterHints = {
                  enable = true,
                },
                reborrowHints = {
                  enable = "mutable",
                },
                typeHints = {
                  enable = true,
                  hideClosureInitialization = false,
                  hideNamedConstructor = false,
                },
              },

              -- Completion settings
              completion = {
                callable = {
                  snippets = "add_parentheses",
                },
                postfix = {
                  enable = true,
                },
              },

              -- Hover settings
              hover = {
                actions = {
                  enable = true,
                  references = {
                    enable = true,
                  },
                },
                documentation = {
                  enable = true,
                },
              },

              -- Lens settings
              lens = {
                enable = true,
                references = {
                  adt = { enable = true },
                  enumVariant = { enable = true },
                  method = { enable = true },
                  trait = { enable = true },
                },
                implementations = {
                  enable = true,
                },
                run = {
                  enable = true,
                },
                debug = {
                  enable = true,
                },
              },
            },
          },
        },

        -- DAP (Debug Adapter Protocol)
        dap = {
          adapter = {
            type = "executable",
            command = "lldb-vscode",
            name = "rt_lldb",
          },
        },
      }
    end,
  },

  -- Plugin quản lý Crates.io dependencies
  {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local crates = require('crates')
      crates.setup({
        completion = {
          cmp = {
            enabled = true,
          },
          crates = {
            enabled = true,
            max_results = 8,
            min_chars = 3,
          },
        },
        popup = {
          autofocus = true,
          border = "rounded",
        },
        lsp = {
          enabled = true,
          on_attach = function(client, bufnr)
            -- Keymaps cho crates.nvim
            local map = function(keys, func, desc)
              vim.keymap.set('n', keys, func, {
                buffer = bufnr,
                desc = "Crates: " .. desc,
                silent = true
              })
            end

            map("<leader>ct", crates.toggle, "Toggle Crates")
            map("<leader>cr", crates.reload, "Reload Crates")
            map("<leader>cv", crates.show_versions_popup, "Show Versions")
            map("<leader>cf", crates.show_features_popup, "Show Features")
            map("<leader>cd", crates.show_dependencies_popup, "Show Dependencies")
            map("<leader>cu", crates.update_crate, "Update Crate")
            map("<leader>ca", crates.update_all_crates, "Update All Crates")
            map("<leader>cU", crates.upgrade_crate, "Upgrade Crate")
            map("<leader>cA", crates.upgrade_all_crates, "Upgrade All Crates")
            map("<leader>cH", crates.open_homepage, "Open Homepage")
            map("<leader>cR", crates.open_repository, "Open Repository")
            map("<leader>cD", crates.open_documentation, "Open Documentation")
            map("<leader>cC", crates.open_crates_io, "Open Crates.io")
          end,
        },
      })
    end,
  },

  -- Rust tools utilities
  {
    'rust-lang/rust.vim',
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
      vim.g.rustfmt_emit_files = 1
      vim.g.rustfmt_fail_silently = 0
      vim.g.rust_clip_command = 'xclip -selection clipboard'
    end,
  },

  -- Better syntax highlighting và code folding
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "rust",
          "toml",
          "ron",
        })
      end

      -- Thêm parser cho Rust
      if type(opts.highlight) == "table" then
        opts.highlight.additional_vim_regex_highlighting = { "rust" }
      end
    end,
  },

  -- Debug Adapter Protocol
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      -- Setup DAP UI
      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 10,
            position = "bottom",
          },
        },
      })

      -- Setup virtual text
      require("nvim-dap-virtual-text").setup()

      -- Auto open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Keymaps for debugging
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { desc = "Debug: " .. desc })
      end

      map("<F5>", dap.continue, "Continue")
      map("<F10>", dap.step_over, "Step Over")
      map("<F11>", dap.step_into, "Step Into")
      map("<F12>", dap.step_out, "Step Out")
      map("<leader>db", dap.toggle_breakpoint, "Toggle Breakpoint")
      map("<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, "Conditional Breakpoint")
      map("<leader>dr", dap.repl.open, "Open REPL")
      map("<leader>dl", dap.run_last, "Run Last")
      map("<leader>du", dapui.toggle, "Toggle Debug UI")
    end,
  },

  -- Testing framework
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'rouge8/neotest-rust',
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-rust') {
            args = { "--no-capture" },
            dap_adapter = "lldb",
          }
        },
        icons = {
          passed = "✓",
          running = "●",
          failed = "✗",
          skipped = "○",
          unknown = "?",
        },
      })

      -- Test keymaps
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { desc = "Test: " .. desc })
      end

      map("<leader>tt", function() require("neotest").run.run() end, "Run Nearest Test")
      map("<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, "Run File")
      map("<leader>ta", function() require("neotest").run.run(vim.fn.getcwd()) end, "Run All Tests")
      map("<leader>ts", function() require("neotest").summary.toggle() end, "Toggle Summary")
      map("<leader>to", function() require("neotest").output.open({ enter = true }) end, "Show Output")
      map("<leader>tO", function() require("neotest").output_panel.toggle() end, "Toggle Output Panel")
      map("<leader>tS", function() require("neotest").run.stop() end, "Stop Test")
      map("<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, "Debug Nearest Test")
    end,
  },

  -- Snippet support for Rust
  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Custom Rust snippets
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      ls.add_snippets("rust", {
        s("test", {
          t({"#[test]", "fn "}), i(1, "test_name"), t({"() {", "    "}), i(2, "// test body"), t({"", "}"}),
        }),
        s("testmod", {
          t({"#[cfg(test)]", "mod tests {", "    use super::*;", "", "    #[test]", "    fn "}),
          i(1, "test_name"), t({"() {", "        "}), i(2, "// test body"), t({"", "    }", "}"}),
        }),
        s("derive", {
          t("#[derive("), i(1, "Debug"), t(")]"),
        }),
        s("allow", {
          t("#[allow("), i(1, "dead_code"), t(")]"),
        }),
      })
    end,
  },
}
