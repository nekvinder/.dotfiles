-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local utils = require "astronvim.utils"
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
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
    ["<leader>bp"] = { function() require("harpoon.ui").nav_prev() end, desc = "prev tab harpoon", },
    ["<leader>bn"] = { function() require("harpoon.ui").nav_next() end, desc = "next tab harpoon", },
    ["<leader>bb"] = { function() require("harpoon.ui").toggle_quick_menu() end, desc = "List harpoon", },
    ["<leader>ba"] = { function() require("harpoon.mark").add_file() end, desc = "Add to harpoon", },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<C-g>"] = { function() utils.toggle_term_cmd "lazygit" end, desc = "ToggleTerm lazygit" },
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
