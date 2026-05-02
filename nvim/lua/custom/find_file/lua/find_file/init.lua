-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local M = {}

function M.setup(opts)
  opts = opts or {}
  require('find_file.core').setup(opts)
end

return M
