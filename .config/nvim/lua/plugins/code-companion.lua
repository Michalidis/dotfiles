-- docs. https://codecompanion.olimorris.dev/configuration/introduction.html

return {
  {
    "olimorris/codecompanion.nvim",
    init = function() end,
    config = function()
      require("codecompanion").setup({
        opts = {
          language = "English",
        },
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              -- MCP Tools
              make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
              show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
              add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
              show_result_in_chat = true, -- Show tool results directly in chat buffer
              format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
              -- MCP Resources
              make_vars = true, -- Convert MCP resources to #variables for prompts
              -- MCP Prompts
              make_slash_commands = true, -- Add MCP prompts as /slash commands
            },
          },
        },
        interactions = {
          chat = {
            -- adapter = "gemini",
            adapter = {
              name = "copilot",
              model = "claude-opus-4.6",
            },
            tools = {
              opts = {
                auto_submit_errors = true, -- Send any errors to the LLM automatically?
                auto_submit_success = true, -- Send any successful output to the LLM automatically?
              },
              ["cmd_runner"] = {
                opts = {
                  require_approval_before = true,
                },
              },
            },
            keymaps = {
              close = {
                modes = { n = "<C-c>", i = "<C-c>" },
              },
              -- Add further custom keymaps here
            },
            opts = {
              ---Decorate the user message before it's sent to the LLM
              ---@param message string
              ---@param adapter CodeCompanion.Adapter
              ---@param context table
              ---@return string
              prompt_decorator = function(message, adapter, context)
                return string.format([[<prompt>%s</prompt>]], message)
              end,
            },
            slash_commands = {
              ["file"] = {
                -- Location to the slash command in CodeCompanion
                callback = "strategies.chat.slash_commands.file",
                description = "Select a file using Snacks",
                opts = {
                  provider = "snacks", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
                  contains_code = true,
                },
              },
              ["help"] = {
                callback = "strategies.chat.slash_commands.help",
                description = "Display help using Snacks",
                opts = {
                  provider = "snacks", -- Using snacks as requested
                },
              },
            },
          },
          inline = {
            adapter = "copilot",
            -- adapter = "gemini",
          },
          cmd = {
            adapter = "copilot",
            -- adapter = "gemini",
          },
        },

        display = {
          chat = {
            intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
            separator = "─", -- The separator between the different messages in the chat buffer
            show_context = true, -- Show context (from slash commands and variables) in the chat buffer?
            show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
            show_settings = false, -- Show LLM settings at the top of the chat buffer?
            show_token_count = true, -- Show the token count for each response?
            show_tools_processing = true, -- Show the loading message when tools are being executed?
            start_in_insert_mode = false, -- Open the chat buffer in insert mode?
            icons = {
              chat_context = "📎️", -- You can also apply an icon to the fold
            },
            fold_context = true,
            -- show_settings = true,
          },
          diff = {
            enabled = true,
          },
        },

        adapters = {
          acp = {
            copilot_cli = function()
              return require("codecompanion.adapters").extend("copilot", {
                commands = {
                  default = {
                    "claude-opus-4.6",
                    "gpt-4.1",
                    "claude-3.7-sonnet",
                    "o3-mini-2025-01-31", -- Allows browsing internet, I think
                    "gemini-2.0-flash-001",
                  },
                },
              })
            end,
            gemini_cli = function()
              return require("codecompanion.adapters").extend("gemini", {
                env = {
                  api_key = "AIzaSyA8exbGAoK4NqpHWBBX6szPjmx9lFgTfkE",
                },
                commands = {
                  default = {
                    "gemini-2.5-pro-exp-03-25",
                    "gemini-2.0-flash",
                  },
                },
              })
            end,
          },
        },
        prompt_library = {
          ["LazyVim Expert (EXAMPLE)"] = {
            strategy = "chat",
            description = "Provides expert advice on LazyVim",
            opts = {
              -- You can specify files/buffers/etc. to use as context here
            },
            prompts = {
              {
                role = "system",
                content = "You are an experienced developer with Lua and Neovim. You are an expert in LazyVim and its configuration.",
              },
              {
                role = "user",
                content = "Hello, I need help with ...",
              },
            },
          },
          ["Code Review"] = {
            strategy = "chat",
            description = "Review code for improvements and bugs",
            opts = {
              index = 12,
              is_slash_cmd = false,
              auto_submit = false,
              short_name = "review",
            },
            references = {
              { type = "file" },
            },
            prompts = {
              {
                role = "user",
                content = [[Please review this code thoroughly. Focus on:
  1. Potential bugs or edge cases
  2. Performance optimizations
  3. Code structure and readability
  4. Security concerns
  5. Best practices for this language
  6. Ensure the code is correct and follows best practices
  7. Suggest code improvements with technology available in Angular 19
]],
              },
            },
          },
          ["Figma to Component"] = {
            strategy = "chat",
            description = "Convert Figma designs to code components",
            opts = {
              index = 13,
              is_slash_cmd = false,
              auto_submit = false,
              short_name = "Figma",
            },
            references = {
              { type = "file" },
            },
            prompts = {
              {
                role = "user",
                content = [[@mcp

Convert my Figma design to an Angular 19 component.
Node URL: ``
Image folder: `./meme/src/assets/images/`

Get File ID and Node ID from Node URL: `https://www.figma.com/file/<FILE_ID>?node-id=<NODE_ID>`

Make sure to use the latest Angular 19 features and best practices.
Wherever possible, use Angular Material components for consistency with the design system.
Convert pixels to ems for responsive design. Our design ratio is 16px = 1em.
Ensure the component is modular and reusable.
Try to match values to our variables defined in file `meme/src/assets/css/_variables.scss` if available. If some values are not available, define new variables in the same file. Import the variables file in the component's SCSS file as `@use "variables" as *;`.
If a node contains an image, use the `download_figma_images` tool to download the image and place it in the provided Image folder.
Always download images in PNG format while ignoring overlapping layers.
Do not include any comments in the final code.
]],
              },
            },
          },
        },
      })
    end,
    keys = {
      { "<leader>acc", "<cmd>CodeCompanionChat toggle<cr>", desc = "Toggle CodeCompanion Chat" },
      { "<leader>aca", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
