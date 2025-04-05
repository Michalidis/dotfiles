-- docs. https://github.com/Davidyz/VectorCode/tree/main

return {
  "Davidyz/VectorCode",
  version = "*", -- optional, depending on whether you're on nightly or release
  build = "pipx upgrade vectorcode", -- optional but recommended if you set `version = "*"`
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function() -- Default configuration
    require("vectorcode").setup({
      async_opts = {
        debounce = 10,
        events = { "BufWritePost", "InsertEnter", "BufReadPost" },
        exclude_this = true,
        n_query = 1,
        notify = false,
        query_cb = require("vectorcode.utils").make_surrounding_lines_cb(-1),
        run_on_register = false,
        timeout_ms = 5000,
      },
      async_backend = "default", -- or "lsp"
      exclude_this = true,
      n_query = 1,
      notify = true,
      timeout_ms = 5000,
      on_setup = {
        update = false, -- set to true to enable update when `setup` is called.
        lsp = false,
      },
    })
  end,
}

-- return {
--   "Davidyz/VectorCode",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--   },
--   config = function()
--     require("VectorCode").setup({
--       -- Basic configuration
--       db_path = vim.fn.stdpath("data") .. "/vectorcode_db",
--       max_entries = 1000,
--       -- Enable automatic indexing of files on save
--       auto_index = true,
--       -- File types to index
--       file_types = { "lua", "python", "javascript", "typescript", "rust", "go" },
--       -- Exclude patterns
--       exclude_patterns = { "node_modules", ".git", "target", "build" }
--     })
--
--     -- Set up keymaps
--     vim.keymap.set("n", "<leader>vi", "<cmd>VCIndex<CR>", { desc = "Index current file" })
--     vim.keymap.set("n", "<leader>vs", "<cmd>VCSearch<CR>", { desc = "Search code vectors" })
--     vim.keymap.set("n", "<leader>vc", "<cmd>VCClear<CR>", { desc = "Clear vector database" })
--   end,
-- }
