local M = {}

M.pg_num = 1
M.num_pgs = 0
M.pg_list = {}
M.reset_list = { '', '', '', '', '', '', '', '', '', '' }

function M.paged_list(paths_list)
  if #paths_list == 0 or paths_list == nil then
    return {}
  end

  local sliced_list = {}
  local sub_list = {}
  local index = 1
  local sliced_indices = 0

  while index < #paths_list + 1 do
    table.insert(sub_list, paths_list[index])
    sliced_indices = sliced_indices + 1
    index = index + 1

    if sliced_indices == 10 then
      table.insert(sliced_list, sub_list)
      sliced_indices = 0
      sub_list = {}
    end
  end

  if #sub_list > 0 then
    table.insert(sliced_list, sub_list)
  end

  return sliced_list
end

function M.print_list(list)
  for i = 1, #list do
    local sub_list = list[i]
    local print_list = {}
    table.insert(print_list, { '[', 'None' })

    for j = 1, #sub_list do
      if j < #sub_list then
        table.insert(print_list, { sub_list[j], 'None' })
        table.insert(print_list, { ', ', 'None' })
      else
        table.insert(print_list, { sub_list[j], 'None' })
      end
    end

    table.insert(print_list, { ']\n', 'None' })

    vim.api.nvim_echo(print_list, false, {})
  end
end

function M.create_window(paths_list)
  M.page_list = M.paged_list(paths_list)
  M.num_pgs = #M.page_list

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, #M.page_list[M.pg_num], false, M.page_list[M.pg_num])

  local width = 100
  local height = 10
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  vim.wo[win].cursorline = true
  vim.api.nvim_win_set_cursor(win, { 1, 0 })

  vim.api.nvim_buf_set_keymap(buf, 'n', '<C-n>', '', {
    noremap = true,
    silent = true,
    callback = function()
      M.pg_num = M.pg_num + 1 > M.num_pgs and M.num_pgs or M.pg_num + 1
      vim.api.nvim_buf_set_lines(buf, 0, 10, false, M.reset_list)
      vim.api.nvim_buf_set_lines(buf, 0, #M.page_list[M.pg_num], false, M.page_list[M.pg_num])
    end,
  })

  vim.api.nvim_buf_set_keymap(buf, 'n', '<C-p>', '', {
    noremap = true,
    silent = true,
    callback = function()
      M.pg_num = M.pg_num - 1 < 1 and 1 or M.pg_num - 1
      vim.api.nvim_buf_set_lines(buf, 0, 10, false, M.reset_list)
      vim.api.nvim_buf_set_lines(buf, 0, #M.page_list[M.pg_num], false, M.page_list[M.pg_num])
    end,
  })

  vim.api.nvim_buf_set_keymap(buf, 'n', '<CR>', '', {
    noremap = true,
    silent = true,
    callback = function()
      local cursor = vim.api.nvim_win_get_cursor(win)
      local pg_list = M.page_list[M.pg_num]
      local choice = pg_list[cursor[1]]

      if choice == nil then
        return
      end

      M.pg_num = 1
      vim.api.nvim_win_close(win, true)
      print('✅ You chose: ' .. choice)
      vim.cmd('e' .. choice)
    end,
  })

  vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', '', {
    noremap = true,
    silent = true,
    callback = function()
      vim.api.nvim_win_close(win, true)
    end,
  })

  vim.bo[buf].modifiable = true
  vim.bo[buf].bufhidden = 'wipe'
end

function M.split(output)
  local list = {}

  for path in string.gmatch(output, '[^\n]*') do
    if path ~= nil and path ~= '\n' and path ~= '' then
      table.insert(list, path)
    end
  end

  return list
end

function M.find_file()
  local search_dir = '.'
  local search_file = ''
  local process_dir = vim.fn.input 'Enter file: '
  local last_slash_index = 0

  for i = #process_dir, 1, -1 do
    if string.sub(process_dir, i, i) == '/' then
      last_slash_index = i
      break
    end
  end

  search_file = string.sub(process_dir, last_slash_index + 1, #process_dir)

  if last_slash_index == 1 then
    search_dir = string.sub(process_dir, 1, 1)
  elseif last_slash_index > 0 then
    search_dir = string.sub(process_dir, 1, last_slash_index - 1)
  end

  local output = vim.fn.system('find ' .. search_dir .. ' -type f -name "' .. search_file .. '"')

  M.create_window(M.split(output))
end

function M.setup(opts)
  local keymap = opts.keymap
  vim.keymap.set('n', '<leader>' .. keymap, M.find_file, { desc = 'Allows user to search for files' })
end

return M
