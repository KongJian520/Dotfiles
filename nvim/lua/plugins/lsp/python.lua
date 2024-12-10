return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                diagnosticMode = "workspace",
                inlayHints = {
                  variableTypes = true,
                  functionReturnTypes = true,
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "python" })
      end
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        nls.builtins.formatting.black,
        nls.builtins.formatting.ruff,
        nls.builtins.diagnostics.ruff,
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      config = function()
        require("dap-python").setup("python")
      end,
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python",   --both are optionals for debugging
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
      -- This function gets called by the plugin when a new result from fd is received
      -- You can change the filename displayed here to what you like.
      -- Here in the example for linux/mac we replace the home directory with '~' and remove the /bin/python part.
      local function shorter_name(filename)
        return filename:gsub(os.getenv("HOME"), "~"):gsub("/bin/python", "")
      end


      require("venv-selector").setup {
        settings = {
          options = {
            -- If you put the callback here as a global option, its used for all searches (including the default ones by the plugin)
            on_telescope_result_callback = shorter_name
          },

          search = {
            my_venvs = {
              command = "fd /bin/python$ $WORKSPACE_PATH --full-path --color never -E /proc -unrestricted",
              on_telescope_result_callback = shorter_name
            },
          },
        },
      }
    end,
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>" },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "pyright", "black", "ruff" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "pyright" },
    },
  },
}
