return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-jest",
  },
  opts = {
    adapters = {
      ["neotest-jest"] = {
        jestConfigFile = function(path)
          return require("utils.path").get_project_root(path) .. "jest.config.ts"
        end,
        env = { CI = true },
        cwd = function(path)
          return require("utils.path").get_project_root(path)
        end,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>t",  "", desc = "+test" },
    { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end,              desc = "Run File" },
    { "<leader>tT", function() require("neotest").run.run(require("utils.path").current_project_root()) end,       desc = "Run Project" },
    { "<leader>tA", function() require("neotest").run.run(vim.uv.cwd()) end,                    desc = "Run All" },
    { "<leader>tr", function() require("neotest").run.run() end,                                desc = "Run Nearest" },
    { "<leader>tl", function() require("neotest").run.run_last() end,                           desc = "Run Last" },
    { "<leader>ts", function() require("neotest").summary.toggle() end,                         desc = "Toggle Summary" },
    { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end,                    desc = "Toggle Output Panel" },
    { "<leader>tS", function() require("neotest").run.stop() end,                               desc = "Stop" },
    { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end,         desc = "Toggle Watch" },
  },
}
