-- docs. https://github.com/ravitemer/mcphub.nvim

return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
  },
  -- comment the following line to ensure hub will be ready at the earliest
  cmd = "MCPHub", -- lazy load by default
  build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
  -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
  -- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
  config = function()
    require("mcphub").setup({
      auto_approve = true, -- Automatically approve all requests
      extensions = {
        codecompanion = {
          show_result_in_chat = true, -- Show tool results in chat
          make_vars = true, -- Create chat variables from resources
          make_slash_commands = true, -- make /slash_commands from MCP server prompts
        },
        avante = {
          make_slash_commands = true, -- make /slash commands from MCP server prompts
        },
      },
    })

    -- Load the code generation server
    require("plugins.mcphub_servers.codegen")
  end,
  keys = {
    { "<leader>m", "<cmd>MCPHub<cr>", desc = "MCPHub" },
  },
}
