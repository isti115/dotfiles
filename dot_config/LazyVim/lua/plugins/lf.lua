return {
  "lmburns/lf.nvim",
  config = function()
    require("lf").setup({
      -- override from `drop`, which would jump to existing windows
      default_action = "edit",
    })
  end,
  keys = {
    { "<Leader>fl", "<Cmd>Lf<CR>", desc = "Open Lf", silent = true },
  },
  dependencies = { "akinsho/toggleterm.nvim" },
}
