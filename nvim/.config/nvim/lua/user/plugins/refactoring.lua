return {
  "ThePrimeagen/refactoring.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require("pounce").setup {
      -- Configuration here, or leave empty to use defaults
    }
  end,
}
