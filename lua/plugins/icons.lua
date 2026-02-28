return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  config = function()
    require("nvim-web-devicons").setup({
      default = true,
      color_icons = true,
      strict = true,

      -- Ghi đè icon cho các loại file phổ biến với icon đẹp hơn
      override = {
        lua = {
          icon = "",
          color = "#51a0cf",
          cterm_color = "74",
          name = "Lua",
        },
        js = {
          icon = "",
          color = "#f7df1e",
          cterm_color = "220",
          name = "JavaScript",
        },
        ts = {
          icon = "",
          color = "#3178c6",
          cterm_color = "68",
          name = "TypeScript",
        },
        jsx = {
          icon = "",
          color = "#61dafb",
          cterm_color = "117",
          name = "JavaScriptReact",
        },
        tsx = {
          icon = "",
          color = "#61dafb",
          cterm_color = "117",
          name = "TypeScriptReact",
        },
        py = {
          icon = "",
          color = "#3572a5",
          cterm_color = "61",
          name = "Python",
        },
        rs = {
          icon = "",
          color = "#ce422b",
          cterm_color = "166",
          name = "Rust",
        },
        go = {
          icon = "",
          color = "#00acd7",
          cterm_color = "38",
          name = "Go",
        },
        md = {
          icon = "",
          color = "#519aba",
          cterm_color = "74",
          name = "Markdown",
        },
        json = {
          icon = "",
          color = "#cbcb41",
          cterm_color = "185",
          name = "Json",
        },
        yaml = {
          icon = "",
          color = "#6d8086",
          cterm_color = "66",
          name = "Yaml",
        },
        toml = {
          icon = "",
          color = "#9c4221",
          cterm_color = "130",
          name = "Toml",
        },
        sh = {
          icon = "",
          color = "#4d5a5e",
          cterm_color = "240",
          name = "Shell",
        },
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh",
        },
        vim = {
          icon = "",
          color = "#019833",
          cterm_color = "28",
          name = "Vim",
        },
        css = {
          icon = "",
          color = "#563d7c",
          cterm_color = "60",
          name = "CSS",
        },
        html = {
          icon = "",
          color = "#e34c26",
          cterm_color = "166",
          name = "HTML",
        },
        gitignore = {
          icon = "",
          color = "#f54d27",
          cterm_color = "202",
          name = "Gitignore",
        },
        dockerfile = {
          icon = "",
          color = "#384d54",
          cterm_color = "238",
          name = "Dockerfile",
        },
        lock = {
          icon = "",
          color = "#bbbbbb",
          cterm_color = "250",
          name = "Lock",
        },
      },

      -- Ghi đè theo extension mở rộng
      override_by_extension = {
        ["log"] = {
          icon = "",
          color = "#81e043",
          name = "Log",
        },
        ["env"] = {
          icon = "",
          color = "#faf743",
          name = "Env",
        },
      },

      -- Ghi đè theo tên file cụ thể
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f54d27",
          name = "Gitignore",
        },
        ["package.json"] = {
          icon = "",
          color = "#e8274b",
          name = "PackageJson",
        },
        ["package-lock.json"] = {
          icon = "",
          color = "#7a0d21",
          name = "PackageLockJson",
        },
        ["README.md"] = {
          icon = "",
          color = "#519aba",
          name = "Readme",
        },
        [".env"] = {
          icon = "",
          color = "#faf743",
          name = "Env",
        },
        ["Makefile"] = {
          icon = "",
          color = "#6d8086",
          name = "Makefile",
        },
        ["docker-compose.yml"] = {
          icon = "",
          color = "#2496ed",
          name = "DockerCompose",
        },
      },
    })
  end,
}
