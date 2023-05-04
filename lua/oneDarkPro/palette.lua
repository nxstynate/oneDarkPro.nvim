-- Solarized Dark
local M = {}

M.colors = {
  dark0_hard = "#133e5c",
  dark0 = "#0c4b63",
  dark0_soft = "#5e7880",
  dark1 = "#748c93",
  dark2 = "#97a9b0",
  dark3 = "#aeb3b3",
  dark4 = "#f3e7cf",
  light0_hard = "#fcf1d8",
  light0 = "#f3e7cf",
  light0_soft = "#f3e7cf",
  light1 = "#aeb3b3",
  light2 = "#97a9b0",
  light3 = "#748c93",
  light4 = "#5e7880",
  bright_red = "#e32b25",
  bright_green = "#95b32c",
  bright_yellow = "#c08d2d",
  bright_blue = "#279ed2",
  bright_purple = "#7c81d3",
  bright_aqua = "#3ba9b5",
  bright_orange = "#d6502d",
  neutral_red = "#e32b25",
  neutral_green = "#95b32c",
  neutral_yellow = "#c08d2d",
  neutral_blue = "#279ed2",
  neutral_purple = "#7c81d3",
  neutral_aqua = "#3ba9b5",
  neutral_orange = "#d6502d",
  faded_red = "#e32b25",
  faded_green = "#95b32c",
  faded_yellow = "#c08d2d",
  faded_blue = "#279ed2",
  faded_purple = "#7c81d3",
  faded_aqua = "#3ba9b5",
  faded_orange = "#d6502d",
  gray = "#aeb3b3",
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
