return {
  "github/copilot.vim",
  lazy = false,
  config = function()
    vim.cmd([[ imap <silent><script><expr> <Right> copilot#Accept("\<C-o>l") ]])
  end,
}
