local utils = require "astronvim.utils"
local harpoonUI = require("harpoon.ui")
local harpoonMark = require("harpoon.mark")
local buffer = require("astronvim.utils.buffer")
return {
  n = {
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["-"] = {
      require("oil").open,
      desc = "Dir structure as file using oil plugin",
    },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },

    ["<C-p>"] = { function() harpoonUI.nav_prev() end, desc = "prev tab harpoon", },
    ["<C-n>"] = { function() harpoonUI.nav_next() end, desc = "next tab harpoon", },
    ["<C-i>"] = { function() harpoonUI.toggle_quick_menu() end, desc = "List harpoon", },
    ["<leader>ab"] = { function() harpoonUI.toggle_quick_menu() end, desc = "List harpoon", },
    ["<leader>bb"] = { function() harpoonUI.toggle_quick_menu() end, desc = "List harpoon", },
    ["<leader>aa"] = { function() harpoonMark.add_file() end, desc = "Add to harpoon", },
    ["<leader>ba"] = { function() harpoonMark.add_file() end, desc = "Add to harpoon", },
    ["<C-a>"] = { function() harpoonMark.add_file() end, desc = "Add to harpoon", },

    ["]]"] = { function() buffer.nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["[["] = { function() buffer.nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },

    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["U"] = { ":redo<cr>", desc = "Redo" },
    ["f"] = { "<cmd>Pounce<cr>", desc = "Pounce" },
  },
  i = {
    ["<C-J>"] = { 'copilot#Accept("<CR>")', silent = true, expr = true },
    ["<Tab>"] = { 'copilot#Accept("<CR>")', silent = true, expr = true }
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
