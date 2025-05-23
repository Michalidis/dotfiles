return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          -- files = { hidden = true, dirs = { ".", "~/.config/nvim/", "meme/src/app/generated/openapi/" } },
          -- grep = { hidden = true, dirs = { ".", "meme/src/app/generated/openapi/" } },
          buffers = { hidden = true },
          explorer = { auto_close = true },
        },
      },
      terminal = {
        win = {
          shell = "/bin/bash", -- or any other shell like "/bin/bash", "/bin/fish", etc.
        },
      },
    },
    keys = {
      {
        "<leader>ff",
        function()
          require("snacks.picker").files({
            -- Let fd read .gitignore by default
            hidden = true,
            dirs = { ".", "meme/src/app/generated/openapi/" },
          })
        end,
        desc = "Find Files (Root Dir, include `generated`)",
      },
      {
        "<leader>/",
        function()
          require("snacks.picker").grep({
            hidden = true,
            dirs = { ".", "meme/src/app/generated/openapi/" },
          })
        end,
        desc = "Grep (Root Dir, include `generated`)",
      },
    },
  },
}
