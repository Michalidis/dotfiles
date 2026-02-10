local spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
local spinner_index = 0
local spinner_timer = nil
local cc_loading = false

vim.api.nvim_create_autocmd("User", {
  pattern = "CodeCompanionRequestStarted",
  callback = function()
    cc_loading = true
    spinner_index = 0
    if spinner_timer then
      spinner_timer:stop()
      spinner_timer:close()
    end
    spinner_timer = vim.uv.new_timer()
    spinner_timer:start(
      0,
      80,
      vim.schedule_wrap(function()
        spinner_index = (spinner_index % #spinner_frames) + 1
        vim.cmd("redrawstatus")
      end)
    )
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "CodeCompanionRequestFinished",
  callback = function()
    cc_loading = false
    if spinner_timer then
      spinner_timer:stop()
      spinner_timer:close()
      spinner_timer = nil
    end
    vim.cmd("redrawstatus")
  end,
})

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_x = {
          {
            function()
              if cc_loading then
                return spinner_frames[spinner_index] .. " CodeCompanion"
              end
              return ""
            end,
            color = { fg = "#f7c67f" },
          },
          function()
            return vim.g.mcphub_status or ""
          end,
        },
      },
    })
  end,
}
