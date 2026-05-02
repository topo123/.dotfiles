return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Adds a file to the harpoon list' })
    vim.keymap.set('n', '<C-c>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<leader>oj', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<leader>ok', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<leader>ol', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<leader>o;', function()
      harpoon:list():select(4)
    end)
  end,
}
