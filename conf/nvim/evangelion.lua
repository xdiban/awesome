local M = {}

M.base_30 = {
  white = "#e9e4d7",
  darker_black = "#171624",
  black = "#171624",
  black2 = "#323c41",
  one_bg = "#3a4248",
  one_bg2 = "#3a4248",
  one_bg3 = "#424a50",
  grey = "#4a5258",
  grey_fg = "#65597f",
  grey_fg2 = "#daa58d",
  light_grey = "#ebe0d1",
  red = "#c45075",
  baby_pink = "#c45075",
  pink = "#e96eb4",
  line = "#3a4248",
  green = "#add97a",
  vibrant_green = "#add97a",
  nord_blue = "#af3e8e",
  blue = "#af3e8e",
  yellow = "#daa58d",
  sun = "#daa58d",
  purple = "#e96eb4",
  dark_purple = "#e96eb4",
  teal = "#e4c9b8",
  orange = "#e4c9b8",
  cyan = "#ebe0d1",
  statusline_bg = "#323c41",
  lightbg = "#424a50",
  pmenu_bg = "#add97a",
  folder_bg = "#af3e8e",
}

M.base_16 = {
  base00 = "#171624",
  base01 = "#323c41",
  base02 = "#3a4248",
  base03 = "#424a50",
  base04 = "#4a5258",
  base05 = "#e9e4d7",
  base06 = "#ebe0d1",
  base07 = "#f2e7de",
  base08 = "#7a6c91",
  base09 = "#e96eb4",
  base0A = "#add97a",
  base0B = "#daa58d",
  base0C = "#e4c9b8",
  base0D = "#af3e8e",
  base0E = "#c45075",
  base0F = "#e96eb4",
}

M.type = "dark"

M = require("base46").override_theme(M, "evangelion")

return M
