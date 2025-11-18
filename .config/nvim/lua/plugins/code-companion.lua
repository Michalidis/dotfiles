-- docs. https://codecompanion.olimorris.dev/configuration/introduction.html

return {
  {
    "olimorris/codecompanion.nvim",
    init = function()
      require("plugins.codecompanion.fidget-spinner"):init()
    end,
    config = function()
      require("codecompanion").setup({
        opts = {
          language = "English",
        },
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              show_result_in_chat = true, -- Show mcp tool results in chat
              make_vars = true, -- Convert resources to #variables
              make_slash_commands = true, -- Add prompts as /slash commands
            },
          },
        },
        strategies = {
          chat = {
            -- adapter = "gemini",
            adapter = "copilot",
            keymaps = {
              close = {
                modes = { n = "<C-c>", i = "<C-c>" },
              },
              -- Add further custom keymaps here
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
        },
        display = {
          chat = {
            -- show_settings = true,
          },
        },

        adapters = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
              name = "copilot",
              schema = {
                model = {
                  default = "claude-sonnet-4",
                  -- default = "gpt-4.1",
                  -- default = "claude-3.7-sonnet",
                  -- default = "o3-mini-2025-01-31", -- Allows browsing internet, I think
                  -- default = "gemini-2.0-flash-001",
                },
              },
            })
          end,
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              name = "gemini",
              env = {
                api_key = "AIzaSyA8exbGAoK4NqpHWBBX6szPjmx9lFgTfkE",
              },
              schema = {
                model = {
                  -- default = "gemini-2.0-flash",
                  default = "gemini-2.5-pro-exp-03-25",
                },
              },
            })
          end,
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
      "j-hui/fidget.nvim",
    },
  },
}
