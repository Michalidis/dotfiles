-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Buffers
vim.keymap.set("n", "<C-W><C-Left>", ":bp<CR>", { desc = "Switch to previous buffer" })
vim.keymap.set("n", "<C-W><C-Right>", ":bn<CR>", { desc = "Switch to next buffer" })
vim.keymap.set("n", "<C-W><C-d>", ":bd<CR>", { desc = "Close current buffer" })

-- Move per paragraphs in normal mode
vim.keymap.set("n", "í", "{", { desc = "Move per paragraph up" })
vim.keymap.set("n", "é", "}", { desc = "Move per paragraph down" })

-- Move line up and down
vim.keymap.set("n", "<S-Down>", ":m .+1<CR>==", { desc = "Move line down in normal mode" })
vim.keymap.set("i", "<S-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down in insert mode" })
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down in visual mode" })
vim.keymap.set("n", "<S-Up>", ":m .-2<CR>==", { desc = "Move line up in normal mode" })
vim.keymap.set("i", "<S-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up in insert mode" })
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up in visual mode" })

-- Make tab in normal mode indent code
vim.keymap.set("n", "<tab>", "I<tab><esc>", { desc = "Indent code in normal mode" })
vim.keymap.set("n", "<S-tab>", "^i<bs><esc>", { desc = "De-Indent code in normal mode" })

-- Make tab in v mode indent code
vim.keymap.set("v", "<tab>", ">gv", { desc = "Indent code in visual mode" })
vim.keymap.set("v", "<S-tab>", "<gv", { desc = "De-Indent code in visual mode" })

-- Move between splits
vim.keymap.set("n", "<C-Left>", "<C-W>h", { desc = "Move to panel to the left", silent = true })
vim.keymap.set("n", "<C-Up>", "<C-W>k", { desc = "Move to upper panel", silent = true })
vim.keymap.set("n", "<C-Right>", "<C-W>l", { desc = "Move to panel to the right", silent = true })
vim.keymap.set("n", "<C-Down>", "<C-W>j", { desc = "Move to bottom panel", silent = true })

-- Hunk navigation
vim.keymap.set("n", "úh", ":lua require('gitsigns').prev_hunk()<CR>", { desc = "Navigate to previous hunk" })
vim.keymap.set("n", "äh", ":lua require('gitsigns').next_hunk()<CR>", { desc = "Navigate to next hunk" })

-- Error navigation
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
vim.keymap.set("n", "úe", diagnostic_goto(false, "ERROR"), { desc = "Navigate to previous error" })
vim.keymap.set("n", "äe", diagnostic_goto(true, "ERROR"), { desc = "Navigate to next error" })
