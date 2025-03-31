return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "gemini-2.0-flash-001",
      debug = false, -- Enable to get debug messages in ~/.local/state/nvim/CopilotChat.nvim.log
      -- See Configuration section for more options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
