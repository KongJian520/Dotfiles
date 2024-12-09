local opt = vim.opt

-- 关闭相对行号，使用绝对行号
opt.number = true
opt.relativenumber = false

-- 创建自定义行号显示函数
_G.custom_line_number = function()
  local current_line = vim.v.lnum
  local mod = current_line % 10
  
  if mod == 0 then
    -- 10的整数倍行显示实际行号，使用高亮
    return string.format("%%#LineNrSpecial#%d", current_line)
  else
    -- 其他行显示与10的余数，使用普通颜色
    return string.format("%%#LineNr#%d", mod)
  end
end

-- 设置行号颜色
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#707070' })
vim.api.nvim_set_hl(0, 'LineNrSpecial', { fg = '#ffa500', bold = true })

-- 设置自定义行号格式
vim.opt.statuscolumn = '%!v:lua.custom_line_number()'

-- 确保每次切换缓冲区时重新应用设置
vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter' }, {
  callback = function()
    vim.opt.statuscolumn = '%!v:lua.custom_line_number()'
  end
})