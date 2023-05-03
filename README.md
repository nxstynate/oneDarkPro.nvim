<div align="center">
      <h1>Solarized Dark for LazyVim</h1>
     </div>
<div align="center">
<h2>Transparent Mode</h2>
<p align="center">
    <img src="./images/oneDarkProOnTransparent.png" />
</p>
<h2>Dark Mode</h2>
<p align="center">
    <img src="./images/oneDarkProOnDark.png" />
</p>
</div>
# Prerequisites

Neovim 0.8.0+

# Installing

Using `packer`

```lua
use { "nxstynate/oneDarkPro.nvim" }
```

Using `lazy.nvim`

```lua
{ "nxstynate/oneDarkPro.nvim", priority = 1000 }
```

# Basic Usage

Inside `init.vim`

```vim
set background=dark " or light if you want light mode
colorscheme oneDarkPro
```

Inside `init.lua`

```lua
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme oneDarkPro]])
```

# Configuration

Additional settings for oneDarkPro are:

```lua
-- setup must be called before loading the colorscheme
-- Default options:
require("oneDarkPro").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme oneDarkPro")
```

## Overriding

### Palette

You can specify your own palette colors. For example:

```lua
require("oneDarkPro").setup({
    palette_overrides = {
        bright_green = "#990000",
    }
})
vim.cmd("colorscheme oneDarkPro")
```

More colors in the [palette.lua](lua/oneDarkPro/palette.lua) file

### Highlight groups

If you don't enjoy the current color for a specific highlight group, now you can just override it in the setup. For
example:

```lua
require("oneDarkPro").setup({
    overrides = {
        SignColumn = {bg = "#ff9900"}
    }
})
vim.cmd("colorscheme oneDarkPro")
```

Please note that the override values must follow the attributes from the highlight group map, such as:

- **fg** - foreground color
- **bg** - background color
- **bold** - true or false for bold font
- **italic** - true or false for italic font

Other values can be seen in `:h synIDattr`
