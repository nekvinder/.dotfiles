return {
  'ThePrimeagen/harpoon',
  config = function()
    require("telescope").load_extension('harpoon')
    require("harpoon").setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 8,
      }
    })
  end,
}
