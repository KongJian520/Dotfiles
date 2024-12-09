local M = {}

-- Tokyo Night 配色方案的颜色
M.colors = {
  bg = "#1a1b26",
  fg = "#c0caf5",
  -- 模式颜色
  normal = "#7aa2f7",    -- 蓝色
  insert = "#9ece6a",    -- 绿色
  command = "#e0af68",   -- 橙色
  visual = "#bb9af7",    -- 紫色
  replace = "#f7768e",   -- 红色
  -- 其他颜色
  gray = "#565f89",
  dark = "#16161e",
  blue = "#7aa2f7",
  cyan = "#7dcfff",
  red = "#f7768e",
  orange = "#ff9e64",
  yellow = "#e0af68",
  green = "#9ece6a",
  purple = "#bb9af7",
}

-- 设置不同模式的颜色
M.mode_colors = {
  n = M.colors.normal,
  i = M.colors.insert,
  v = M.colors.visual,
  V = M.colors.visual,
  ["\22"] = M.colors.visual,
  c = M.colors.command,
  s = M.colors.purple,
  S = M.colors.purple,
  ["\19"] = M.colors.purple,
  R = M.colors.replace,
  r = M.colors.replace,
  ["!"] = M.colors.command,
  t = M.colors.command,
}

return M