return {
  -- Python language extras - includes Ruff LSP and other Python tools
  { import = "lazyvim.plugins.extras.lang.python" },

  -- Configure LSP servers with proper Ruff settings
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          init_options = {
            settings = {
              lineLength = 120,
              format = {
                lineLength = 120,
              },
              -- Add support for Docker project structure
              args = {
                "--extend-select=I", -- Enable import sorting
              },
            },
          },
        },
        -- Configure pyright for Docker environment
        pyright = {
          before_init = function(_, config)
            -- Auto-detect project root and Python environment
            local util = require("lspconfig.util")
            local root = vim.fs.dirname(vim.fs.find(".git", { path = config.root_dir, upward = true })[1])
              or config.root_dir

            -- Look for virtual environment
            local venv_python = root .. "/venv/bin/python"
            local has_venv = vim.fn.executable(venv_python) == 1

            -- Look for Docker indicators
            local has_docker = vim.fn.findfile("docker-compose.yml", root .. ";")
              or vim.fn.findfile("Dockerfile", root .. ";")
              or vim.fn.findfile("docker/Dockerfile.app", root .. ";")

            if has_docker ~= "" or has_venv then
              local interpreter_path = has_venv and venv_python or "python3"

              config.settings = vim.tbl_deep_extend("force", config.settings or {}, {
                python = {
                  defaultInterpreterPath = interpreter_path,
                  analysis = {
                    extraPaths = {
                      root .. "/src", -- Local source path
                      "/app/src", -- Docker PYTHONPATH
                    },
                    stubPath = root .. "/src",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    autoImportCompletions = true,
                    diagnosticMode = "workspace",
                  },
                },
              })

              -- Set PYTHONPATH environment variable for the LSP
              vim.env.PYTHONPATH = root .. "/src" .. (vim.env.PYTHONPATH and ":" .. vim.env.PYTHONPATH or "")
            end
          end,
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,
              },
            },
          },
        },
      },
    },
  },

  -- Configure conform.nvim to use Ruff as primary formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        ruff_format = {
          args = {
            "format",
            "--line-length",
            "120",
            "--stdin-filename",
            "$FILENAME",
            "-",
          },
        },
        ruff_fix = {
          args = {
            "check",
            "--fix",
            "--line-length",
            "120",
            "--stdin-filename",
            "$FILENAME",
            "-",
          },
        },
      },
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format" },
      },
    },
  },

  -- Ensure Ruff is installed via Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "ruff",
        "mypy",
      },
    },
  },

  -- Configure nvim-lint to use Ruff for linting
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "ruff" },
      },
    },
  },
}
