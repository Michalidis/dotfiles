return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    config = function()
      local vectorcode_ctx = require("vectorcode.integrations.copilotchat").make_context_provider({
        prompt_header = "Here are relevant files from the repository:", -- Customize header text
        prompt_footer = "\nConsider this context when answering:", -- Customize footer text
        skip_empty = true, -- Skip adding context when no files are retrieved
      })
      require("CopilotChat").setup({
        -- Your other CopilotChat options...

        contexts = {
          -- Add the VectorCode context provider
          vectorcode = vectorcode_ctx,
        },

        -- Enable VectorCode context in your prompts
        prompts = {
          Explain = {
            prompt = "Explain the following code in detail:\n$input",
            context = { "selection", "vectorcode" }, -- Add vectorcode to the context
          },
          -- Other prompts...
        },
      })
    end,
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "claude-3.7-sonnet",
      debug = false, -- Enable to get debug messages in ~/.local/state/nvim/CopilotChat.nvim.log
      -- See Configuration section for more options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
