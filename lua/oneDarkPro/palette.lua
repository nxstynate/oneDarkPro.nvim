-- Solarized Dark
local M = {}

M.colors = {
  dark0_hard = "#282c34",
  dark0 = "#353b45",
  dark0_soft = "#3e4451",
  dark1 = "#4b5363",
  dark2 = "#5b626f",
  dark3 = "#73797e",
  dark4 = "#9ca0a4",
  light0_hard = "#f7f7f7",
  light0 = "#f2f2f2",
  light0_soft = "#e5e5e5",
  light1 = "#d9d7cc",
  light2 = "#b7b7a4",
  light3 = "#939377",
  light4 = "#6f6f5f",
  bright_red = "#ff6c6b",
  bright_green = "#98c379",
  bright_yellow = "#e5c07b",
  bright_blue = "#61afef",
  bright_purple = "#c678dd",
  bright_aqua = "#56b6c2",
  bright_orange = "#d19a66",
  neutral_red = "#e06c75",
  neutral_green = "#98c379",
  neutral_yellow = "#e5c07b",
  neutral_blue = "#61afef",
  neutral_purple = "#c678dd",
  neutral_aqua = "#56b6c2",
  neutral_orange = "#d19a66",
  faded_red = "#ff6c6b",
  faded_green = "#98c379",
  faded_yellow = "#e5c07b",
  faded_blue = "#61afef",
  faded_purple = "#c678dd",
  faded_aqua = "#56b6c2",
  faded_orange = "#d19a66",
  gray = "#5c6370",
}

M.get_base_colors = function(bg, contrast)
  local config = require("oneDarkPro").config
  local p = M.colors

  for color, hex in pairs(config.palette_overrides) do
    p[color] = hex
  end

  if bg == nil then
    bg = vim.o.background
  end

  local colors = {
    dark = {
      bg0 = p.dark0,
      bg1 = p.dark1,
      bg2 = p.dark0,
      bg3 = p.dark3,
      bg4 = p.dark4,
      fg0 = p.light0,
      fg1 = p.light1,
      fg2 = p.light2,
      fg3 = p.light3,
      fg4 = p.light4,
      red = p.bright_red,
      green = p.bright_green,
      yellow = p.bright_yellow,
      blue = p.bright_blue,
      purple = p.bright_purple,
      aqua = p.bright_aqua,
      orange = p.bright_orange,
      neutral_red = p.neutral_red,
      neutral_green = p.neutral_green,
      neutral_yellow = p.neutral_yellow,
      neutral_blue = p.neutral_blue,
      neutral_purple = p.neutral_purple,
      neutral_aqua = p.neutral_aqua,
      gray = p.gray,
    },
    light = {
      bg0 = p.light0,
      bg1 = p.light1,
      bg2 = p.light2,
      bg3 = p.light3,
      bg4 = p.light4,
      fg0 = p.dark0,
      fg1 = p.dark1,
      fg2 = p.dark2,
      fg3 = p.dark3,
      fg4 = p.dark4,
      red = p.faded_red,
      green = p.faded_green,
      yellow = p.faded_yellow,
      blue = p.faded_blue,
      purple = p.faded_purple,
      aqua = p.faded_aqua,
      orange = p.faded_orange,
      neutral_red = p.neutral_red,
      neutral_green = p.neutral_green,
      neutral_yellow = p.neutral_yellow,
      neutral_blue = p.neutral_blue,
      neutral_purple = p.neutral_purple,
      neutral_aqua = p.neutral_aqua,
      gray = p.gray,
    },
  }

  if contrast ~= nil and contrast ~= "" then
    colors[bg].bg0 = p[bg .. string.format("0_%s", contrast)]
  end

  return colors[bg]
end

return M
