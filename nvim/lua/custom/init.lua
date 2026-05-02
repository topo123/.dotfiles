return {
  dir = vim.fn.stdpath 'config' .. '/lua/custom/find_file',
  config = function()
    require('find_file').setup { keymap = 'ff' }
  end,
}
