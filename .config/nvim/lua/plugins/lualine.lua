return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_x = {
          function()
            return vim.g.mcphub_status or ""
          end,
        },
      },
    })
  end,
}
