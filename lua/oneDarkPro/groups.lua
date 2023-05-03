local M = {}

-- neovim terminal mode colors
local function set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.bg0
  vim.g.terminal_color_8 = colors.gray
  vim.g.terminal_color_1 = colors.neutral_red
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_2 = colors.neutral_green
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_3 = colors.neutral_yellow
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_4 = colors.neutral_blue
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_5 = colors.neutral_purple
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_6 = colors.neutral_aqua
  vim.g.terminal_color_14 = colors.aqua
  vim.g.terminal_color_7 = colors.fg4
  vim.g.terminal_color_15 = colors.fg1
end

M.setup = function()
  local config = require("oneDarkPro").config
  local colors = require("oneDarkPro.palette").get_base_colors(vim.o.background, config.contrast)

  set_terminal_colors(colors)

  local groups = {
    -- Base groups
    OneDarkProFg0 = { fg = colors.fg0 },
    OneDarkProFg1 = { fg = colors.fg1 },
    OneDarkProFg2 = { fg = colors.fg2 },
    OneDarkProFg3 = { fg = colors.fg3 },
    OneDarkProFg4 = { fg = colors.fg4 },
    OneDarkProGray = { fg = colors.gray },
    OneDarkProBg0 = { fg = colors.bg0 },
    OneDarkProBg1 = { fg = colors.bg1 },
    OneDarkProBg2 = { fg = colors.bg2 },
    OneDarkProBg3 = { fg = colors.bg3 },
    OneDarkProBg4 = { fg = colors.bg4 },
    OneDarkProRed = { fg = colors.red },
    OneDarkProRedBold = { fg = colors.red, bold = config.bold },
    OneDarkProGreen = { fg = colors.green },
    OneDarkProGreenBold = { fg = colors.green, bold = config.bold },
    OneDarkProYellow = { fg = colors.yellow },
    OneDarkProYellowBold = { fg = colors.yellow, bold = config.bold },
    OneDarkProBlue = { fg = colors.blue },
    OneDarkProBlueBold = { fg = colors.blue, bold = config.bold },
    OneDarkProPurple = { fg = colors.purple },
    OneDarkProPurpleBold = { fg = colors.purple, bold = config.bold },
    OneDarkProAqua = { fg = colors.aqua },
    OneDarkProAquaBold = { fg = colors.aqua, bold = config.bold },
    OneDarkProOrange = { fg = colors.orange },
    OneDarkProOrangeBold = { fg = colors.orange, bold = config.bold },
    OneDarkProRedSign = config.transparent_mode and { fg = colors.red, reverse = config.invert_signs }
      or { fg = colors.red, bg = colors.bg1, reverse = config.invert_signs },
    OneDarkProGreenSign = config.transparent_mode and { fg = colors.green, reverse = config.invert_signs }
      or { fg = colors.green, bg = colors.bg1, reverse = config.invert_signs },
    OneDarkProYellowSign = config.transparent_mode and { fg = colors.yellow, reverse = config.invert_signs }
      or { fg = colors.yellow, bg = colors.bg1, reverse = config.invert_signs },
    OneDarkProBlueSign = config.transparent_mode and { fg = colors.blue, reverse = config.invert_signs }
      or { fg = colors.blue, bg = colors.bg1, reverse = config.invert_signs },
    OneDarkProPurpleSign = config.transparent_mode and { fg = colors.purple, reverse = config.invert_signs }
      or { fg = colors.purple, bg = colors.bg1, reverse = config.invert_signs },
    OneDarkProAquaSign = config.transparent_mode and { fg = colors.aqua, reverse = config.invert_signs }
      or { fg = colors.aqua, bg = colors.bg1, reverse = config.invert_signs },
    OneDarkProOrangeSign = config.transparent_mode and { fg = colors.orange, reverse = config.invert_signs }
      or { fg = colors.orange, bg = colors.bg1, reverse = config.invert_signs },
    OneDarkProRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    OneDarkProGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    OneDarkProYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    OneDarkProBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    OneDarkProPurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    OneDarkProAquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    OneDarkProOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
    Normal = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg0 },
    NormalFloat = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg1 },
    NormalNC = config.dim_inactive and { fg = colors.fg0, bg = colors.bg1 } or { link = "Normal" },
    CursorLine = { bg = colors.bg1 },
    CursorColumn = { link = "CursorLine" },
    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = config.invert_tabline },
    TabLineSel = { fg = colors.green, bg = colors.bg1, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },
    MatchParen = { bg = colors.bg3, bold = config.bold },
    ColorColumn = { bg = colors.bg1 },
    Conceal = { fg = colors.blue },
    CursorLineNr = { fg = colors.yellow, bg = colors.bg1 },
    NonText = { link = "OneDarkProBg2" },
    SpecialKey = { link = "OneDarkProFg4" },
    Visual = { bg = colors.bg3, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    IncSearch = { fg = colors.orange, bg = colors.bg0, reverse = config.inverse },
    CurSearch = { link = "IncSearch" },
    QuickFixLine = { fg = colors.bg0, bg = colors.yellow, bold = config.bold },
    Underlined = { fg = colors.blue, underline = config.underline },
    StatusLine = { fg = colors.bg2, bg = colors.fg1, reverse = config.inverse },
    StatusLineNC = { fg = colors.bg1, bg = colors.fg4, reverse = config.inverse },
    WinBar = { fg = colors.fg4, bg = colors.bg0 },
    WinBarNC = { fg = colors.fg3, bg = colors.bg1 },
    WinSeparator = config.transparent_mode and { fg = colors.bg3, bg = nil } or { fg = colors.bg3, bg = colors.bg0 },
    WildMenu = { fg = colors.blue, bg = colors.bg2, bold = config.bold },
    Directory = { link = "OneDarkProBlueBold" },
    Title = { link = "OneDarkProGreenBold" },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "OneDarkProYellowBold" },
    ModeMsg = { link = "OneDarkProYellowBold" },
    Question = { link = "OneDarkProOrangeBold" },
    WarningMsg = { link = "OneDarkProRedBold" },
    LineNr = { fg = colors.bg4 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic.folds },
    FoldColumn = config.transparent_mode and { fg = colors.gray, bg = nil } or { fg = colors.gray, bg = colors.bg1 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "OneDarkProOrange" },
    Comment = { fg = colors.gray, italic = config.italic.comments },
    -- Todo         anything that needs extra attention; mostly the
    --              keywords TODO FIXME and XXX
    Todo = { fg = colors.bg0, bg = colors.yellow, bold = config.bold, italic = config.italic.comments },
    Done = { fg = colors.orange, bold = config.bold, italic = config.italic.comments },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Statement = { link = "OneDarkProRed" },
    Conditional = { link = "OneDarkProRed" },
    Repeat = { link = "OneDarkProRed" },
    Label = { link = "OneDarkProRed" },
    Exception = { link = "OneDarkProRed" },
    Operator = { fg = colors.orange, italic = config.italic.operators },
    Keyword = { link = "OneDarkProRed" },
    Identifier = { link = "OneDarkProBlue" },
    Function = { link = "OneDarkProGreenBold" },
    PreProc = { link = "OneDarkProAqua" },
    Include = { link = "OneDarkProAqua" },
    Define = { link = "OneDarkProAqua" },
    Macro = { link = "OneDarkProAqua" },
    PreCondit = { link = "OneDarkProAqua" },
    Constant = { link = "OneDarkProPurple" },
    Character = { link = "OneDarkProPurple" },
    String = { fg = colors.green, italic = config.italic.strings },
    Boolean = { link = "OneDarkProPurple" },
    Number = { link = "OneDarkProPurple" },
    Float = { link = "OneDarkProPurple" },
    Type = { link = "OneDarkProYellow" },
    StorageClass = { link = "OneDarkProOrange" },
    Structure = { link = "OneDarkProAqua" },
    Typedef = { link = "OneDarkProYellow" },
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = config.inverse },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = config.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    SpellCap = { link = "OneDarkProBlueUnderline" },
    SpellBad = { link = "OneDarkProRedUnderline" },
    SpellLocal = { link = "OneDarkProAquaUnderline" },
    SpellRare = { link = "OneDarkProPurpleUnderline" },
    Whitespace = { fg = colors.bg2 },
    -- LSP Diagnostic
    DiagnosticError = { link = "OneDarkProRed" },
    DiagnosticSignError = { link = "OneDarkProRedSign" },
    DiagnosticUnderlineError = { link = "OneDarkProRedUnderline" },
    DiagnosticWarn = { link = "OneDarkProYellow" },
    DiagnosticSignWarn = { link = "OneDarkProYellowSign" },
    DiagnosticUnderlineWarn = { link = "OneDarkProYellowUnderline" },
    DiagnosticInfo = { link = "OneDarkProBlue" },
    DiagnosticSignInfo = { link = "OneDarkProBlueSign" },
    DiagnosticUnderlineInfo = { link = "OneDarkProBlueUnderline" },
    DiagnosticHint = { link = "OneDarkProAqua" },
    DiagnosticSignHint = { link = "OneDarkProAquaSign" },
    DiagnosticUnderlineHint = { link = "OneDarkProAquaUnderline" },
    DiagnosticFloatingError = { link = "OneDarkProRed" },
    DiagnosticFloatingWarn = { link = "OneDarkProOrange" },
    DiagnosticFloatingInfo = { link = "OneDarkProBlue" },
    DiagnosticFloatingHint = { link = "OneDarkProAqua" },
    DiagnosticVirtualTextError = { link = "OneDarkProRed" },
    DiagnosticVirtualTextWarn = { link = "OneDarkProYellow" },
    DiagnosticVirtualTextInfo = { link = "OneDarkProBlue" },
    DiagnosticVirtualTextHint = { link = "OneDarkProAqua" },
    LspReferenceRead = { link = "OneDarkProYellowBold" },
    LspReferenceText = { link = "OneDarkProYellowBold" },
    LspReferenceWrite = { link = "OneDarkProOrangeBold" },
    LspCodeLens = { link = "OneDarkProGray" },
    LspSignatureActiveParameter = { link = "Search" },

    -- nvim-treesitter
    -- See `nvim-treesitter/CONTRIBUTING.md`

    --
    -- Misc
    --
    -- @comment               ; line and block comments
    ["@comment"] = { link = "Comment" },
    -- @comment.documentation ; comments documenting code
    -- @none                  ; completely disable the highlight
    ["@none"] = { bg = "NONE", fg = "NONE" },
    -- @preproc               ; various preprocessor directives & shebangs
    ["@preproc"] = { link = "PreProc" },
    -- @define                ; preprocessor definition directives
    ["@define"] = { link = "Define" },
    -- @operator              ; symbolic operators (e.g. `+` / `*`)
    ["@operator"] = { link = "Operator" },

    --
    -- Punctuation
    --
    -- @punctuation.delimiter ; delimiters (e.g. `;` / `.` / `,`)
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    -- @punctuation.bracket   ; brackets (e.g. `()` / `{}` / `[]`)
    ["@punctuation.bracket"] = { link = "Delimiter" },
    -- @punctuation.special   ; special symbols (e.g. `{}` in string interpolation)
    ["@punctuation.special"] = { link = "Delimiter" },

    --
    -- Literals
    --
    -- @string               ; string literals
    ["@string"] = { link = "String" },
    -- @string.documentation ; string documenting code (e.g. Python docstrings)
    -- @string.regex         ; regular expressions
    ["@string.regex"] = { link = "String" },
    -- @string.escape        ; escape sequences
    ["@string.escape"] = { link = "SpecialChar" },
    -- @string.special       ; other special strings (e.g. dates)
    ["@string.special"] = { link = "SpecialChar" },

    -- @character            ; character literals
    ["@character"] = { link = "Character" },
    -- @character.special    ; special characters (e.g. wildcards)
    ["@character.special"] = { link = "SpecialChar" },

    -- @boolean              ; boolean literals
    ["@boolean"] = { link = "Boolean" },
    -- @number               ; numeric literals
    ["@number"] = { link = "Number" },
    -- @float                ; floating-point number literals
    ["@float"] = { link = "Float" },

    --
    -- Functions
    --
    -- @function         ; function definitions
    ["@function"] = { link = "Function" },
    -- @function.builtin ; built-in functions
    ["@function.builtin"] = { link = "Special" },
    -- @function.call    ; function calls
    ["@function.call"] = { link = "Function" },
    -- @function.macro   ; preprocessor macros
    ["@function.macro"] = { link = "Macro" },

    -- @method           ; method definitions
    ["@method"] = { link = "Function" },
    -- @method.call      ; method calls
    ["@method.call"] = { link = "Function" },

    -- @constructor      ; constructor calls and definitions
    ["@constructor"] = { link = "Special" },
    -- @parameter        ; parameters of a function
    ["@parameter"] = { link = "Identifier" },

    --
    -- Keywords
    --
    -- @keyword             ; various keywords
    ["@keyword"] = { link = "Keyword" },
    -- @keyword.coroutine   ; keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    -- @keyword.function    ; keywords that define a function (e.g. `func` in Go, `def` in Python)
    ["@keyword.function"] = { link = "Keyword" },
    -- @keyword.operator    ; operators that are English words (e.g. `and` / `or`)
    ["@keyword.operator"] = { link = "OneDarkProRed" },
    -- @keyword.return      ; keywords like `return` and `yield`
    ["@keyword.return"] = { link = "Keyword" },

    -- @conditional         ; keywords related to conditionals (e.g. `if` / `else`)
    ["@conditional"] = { link = "Conditional" },
    -- @conditional.ternary ; ternary operator (e.g. `?` / `:`)

    -- @repeat              ; keywords related to loops (e.g. `for` / `while`)
    ["@repeat"] = { link = "Repeat" },
    -- @debug               ; keywords related to debugging
    ["@debug"] = { link = "Debug" },
    -- @label               ; GOTO and other labels (e.g. `label:` in C)
    ["@label"] = { link = "Label" },
    -- @include             ; keywords for including modules (e.g. `import` / `from` in Python)
    ["@include"] = { link = "Include" },
    -- @exception           ; keywords related to exceptions (e.g. `throw` / `catch`)
    ["@exception"] = { link = "Exception" },

    --
    -- Types
    --
    -- @type            ; type or class definitions and annotations
    ["@type"] = { link = "Type" },
    -- @type.builtin    ; built-in types
    ["@type.builtin"] = { link = "Type" },
    -- @type.definition ; type definitions (e.g. `typedef` in C)
    ["@type.definition"] = { link = "Typedef" },
    -- @type.qualifier  ; type qualifiers (e.g. `const`)
    ["@type.qualifier"] = { link = "Type" },

    -- @storageclass    ; modifiers that affect storage in memory or life-time
    ["@storageclass"] = { link = "StorageClass" },
    -- @attribute       ; attribute annotations (e.g. Python decorators)
    ["@attribute"] = { link = "PreProc" },
    -- @field           ; object and struct fields
    ["@field"] = { link = "Identifier" },
    -- @property        ; similar to `@field`
    ["@property"] = { link = "Identifier" },

    --
    -- Identifiers
    --
    -- @variable         ; various variable names
    ["@variable"] = { link = "OneDarkProFg1" },
    -- @variable.builtin ; built-in variable names (e.g. `this`)
    ["@variable.builtin"] = { link = "Special" },

    -- @constant         ; constant identifiers
    ["@constant"] = { link = "Constant" },
    -- @constant.builtin ; built-in constant values
    ["@constant.builtin"] = { link = "Special" },
    -- @constant.macro   ; constants defined by the preprocessor
    ["@constant.macro"] = { link = "Define" },

    -- @namespace        ; modules or namespaces
    ["@namespace"] = { link = "OneDarkProFg1" },
    -- @symbol           ; symbols or atoms
    ["@symbol"] = { link = "Identifier" },

    --
    -- Text
    --
    -- @text                  ; non-structured text
    ["@text"] = { link = "OneDarkProFg1" },
    -- @text.strong           ; bold text
    ["@text.strong"] = { bold = config.bold },
    -- @text.emphasis         ; text with emphasis
    ["@text.emphasis"] = { italic = config.italic.strings },
    -- @text.underline        ; underlined text
    ["@text.underline"] = { underline = config.underline },
    -- @text.strike           ; strikethrough text
    ["@text.strike"] = { strikethrough = config.strikethrough },
    -- @text.title            ; text that is part of a title
    ["@text.title"] = { link = "Title" },
    -- @text.literal          ; literal or verbatim text (e.g., inline code)
    ["@text.literal"] = { link = "String" },
    -- @text.quote            ; text quotations
    -- @text.uri              ; URIs (e.g. hyperlinks)
    ["@text.uri"] = { link = "Underlined" },
    -- @text.math             ; math environments (e.g. `$ ... $` in LaTeX)
    ["@text.math"] = { link = "Special" },
    -- @text.environment      ; text environments of markup languages
    ["@text.environment"] = { link = "Macro" },
    -- @text.environment.name ; text indicating the type of an environment
    ["@text.environment.name"] = { link = "Type" },
    -- @text.reference        ; text references, footnotes, citations, etc.
    ["@text.reference"] = { link = "Constant" },

    -- @text.todo             ; todo notes
    ["@text.todo"] = { link = "Todo" },
    -- @text.note             ; info notes
    ["@text.note"] = { link = "SpecialComment" },
    -- @text.note.comment     ; XXX in comments
    ["@text.note.comment"] = { fg = colors.purple, bold = config.bold },
    -- @text.warning          ; warning notes
    ["@text.warning"] = { link = "WarningMsg" },
    -- @text.danger           ; danger/error notes
    ["@text.danger"] = { link = "ErrorMsg" },
    -- @text.danger.comment   ; FIXME in comments
    ["@text.danger.comment"] = { fg = colors.fg0, bg = colors.red, bold = config.bold },

    -- @text.diff.add         ; added text (for diff files)
    ["@text.diff.add"] = { link = "diffAdded" },
    -- @text.diff.delete      ; deleted text (for diff files)
    ["@text.diff.delete"] = { link = "diffRemoved" },

    --
    -- Tags
    --
    -- @tag           ; XML tag names
    ["@tag"] = { link = "Tag" },
    -- @tag.attribute ; XML tag attributes
    ["@tag.attribute"] = { link = "Identifier" },
    -- @tag.delimiter ; XML tag delimiters
    ["@tag.delimiter"] = { link = "Delimiter" },

    --
    -- Conceal
    --
    -- @conceal ; for captures that are only used for concealing

    --
    -- Spell
    --
    -- @spell   ; for defining regions to be spellchecked
    -- @nospell ; for defining regions that should NOT be spellchecked

    -- Treesitter
    -- See `:help treesitter`
    -- Those are not part of the nvim-treesitter
    ["@punctuation"] = { link = "Delimiter" },
    ["@macro"] = { link = "Macro" },
    ["@structure"] = { link = "Structure" },

    -- Semantic token
    -- See `:help lsp-semantic-highlight`
    ["@lsp.type.class"] = { link = "@constructor" },
    ["@lsp.type.comment"] = {}, -- do not overwrite comments
    ["@lsp.type.decorator"] = { link = "@parameter" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@keyword" },
    ["@lsp.type.macro"] = { link = "@macro" },
    ["@lsp.type.method"] = { link = "@method" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.struct"] = { link = "@constructor" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"] = { link = "@variable" },

    -- gitcommit
    gitcommitSelectedFile = { link = "OneDarkProGreen" },
    gitcommitDiscardedFile = { link = "OneDarkProRed" },
    -- gitsigns.nvim
    GitSignsAdd = { link = "OneDarkProGreenSign" },
    GitSignsChange = { link = "OneDarkProAquaSign" },
    GitSignsDelete = { link = "OneDarkProRedSign" },
    -- nvim-tree
    NvimTreeSymlink = { fg = colors.neutral_aqua },
    NvimTreeRootFolder = { fg = colors.neutral_purple, bold = true },
    NvimTreeFolderIcon = { fg = colors.neutral_blue, bold = true },
    NvimTreeFileIcon = { fg = colors.light2 },
    NvimTreeExecFile = { fg = colors.neutral_green, bold = true },
    NvimTreeOpenedFile = { fg = colors.bright_red, bold = true },
    NvimTreeSpecialFile = { fg = colors.neutral_yellow, bold = true, underline = true },
    NvimTreeImageFile = { fg = colors.neutral_purple },
    NvimTreeIndentMarker = { fg = colors.dark3 },
    NvimTreeGitDirty = { fg = colors.neutral_yellow },
    NvimTreeGitStaged = { fg = colors.neutral_yellow },
    NvimTreeGitMerge = { fg = colors.neutral_purple },
    NvimTreeGitRenamed = { fg = colors.neutral_purple },
    NvimTreeGitNew = { fg = colors.neutral_yellow },
    NvimTreeGitDeleted = { fg = colors.neutral_red },
    NvimTreeWindowPicker = { bg = colors.faded_aqua },
    -- termdebug
    debugPC = { bg = colors.faded_blue },
    debugBreakpoint = { link = "OneDarkProRedSign" },
    -- vim-startify
    StartifyBracket = { link = "OneDarkProFg3" },
    StartifyFile = { link = "OneDarkProFg1" },
    StartifyNumber = { link = "OneDarkProBlue" },
    StartifyPath = { link = "OneDarkProGray" },
    StartifySlash = { link = "OneDarkProGray" },
    StartifySection = { link = "OneDarkProYellow" },
    StartifySpecial = { link = "OneDarkProBg2" },
    StartifyHeader = { link = "OneDarkProOrange" },
    StartifyFooter = { link = "OneDarkProBg2" },
    StartifyVar = { link = "StartifyPath" },
    StartifySelect = { link = "Title" },
    -- vim-dirvish
    DirvishPathTail = { link = "OneDarkProAqua" },
    DirvishArg = { link = "OneDarkProYellow" },
    -- netrw
    netrwDir = { link = "OneDarkProAqua" },
    netrwClassify = { link = "OneDarkProAqua" },
    netrwLink = { link = "OneDarkProGray" },
    netrwSymLink = { link = "OneDarkProFg1" },
    netrwExe = { link = "OneDarkProYellow" },
    netrwComment = { link = "OneDarkProGray" },
    netrwList = { link = "OneDarkProBlue" },
    netrwHelpCmd = { link = "OneDarkProAqua" },
    netrwCmdSep = { link = "OneDarkProFg3" },
    netrwVersion = { link = "OneDarkProGreen" },
    -- nerdtree
    NERDTreeDir = { link = "OneDarkProAqua" },
    NERDTreeDirSlash = { link = "OneDarkProAqua" },
    NERDTreeOpenable = { link = "OneDarkProOrange" },
    NERDTreeClosable = { link = "OneDarkProOrange" },
    NERDTreeFile = { link = "OneDarkProFg1" },
    NERDTreeExecFile = { link = "OneDarkProYellow" },
    NERDTreeUp = { link = "OneDarkProGray" },
    NERDTreeCWD = { link = "OneDarkProGreen" },
    NERDTreeHelp = { link = "OneDarkProFg1" },
    NERDTreeToggleOn = { link = "OneDarkProGreen" },
    NERDTreeToggleOff = { link = "OneDarkProRed" },
    -- coc.nvim
    CocErrorSign = { link = "OneDarkProRedSign" },
    CocWarningSign = { link = "OneDarkProOrangeSign" },
    CocInfoSign = { link = "OneDarkProBlueSign" },
    CocHintSign = { link = "OneDarkProAquaSign" },
    CocErrorFloat = { link = "OneDarkProRed" },
    CocWarningFloat = { link = "OneDarkProOrange" },
    CocInfoFloat = { link = "OneDarkProBlue" },
    CocHintFloat = { link = "OneDarkProAqua" },
    CocDiagnosticsError = { link = "OneDarkProRed" },
    CocDiagnosticsWarning = { link = "OneDarkProOrange" },
    CocDiagnosticsInfo = { link = "OneDarkProBlue" },
    CocDiagnosticsHint = { link = "OneDarkProAqua" },
    CocSelectedText = { link = "OneDarkProRed" },
    CocMenuSel = { link = "PmenuSel" },
    CocCodeLens = { link = "OneDarkProGray" },
    CocErrorHighlight = { link = "OneDarkProRedUnderline" },
    CocWarningHighlight = { link = "OneDarkProOrangeUnderline" },
    CocInfoHighlight = { link = "OneDarkProBlueUnderline" },
    CocHintHighlight = { link = "OneDarkProAquaUnderline" },
    -- telescope.nvim
    TelescopeNormal = { link = "OneDarkProFg1" },
    TelescopeSelection = { link = "OneDarkProOrangeBold" },
    TelescopeSelectionCaret = { link = "OneDarkProRed" },
    TelescopeMultiSelection = { link = "OneDarkProGray" },
    TelescopeBorder = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopeNormal" },
    TelescopeMatching = { link = "OneDarkProBlue" },
    TelescopePromptPrefix = { link = "OneDarkProRed" },
    TelescopePrompt = { link = "TelescopeNormal" },
    -- nvim-cmp
    CmpItemAbbr = { link = "OneDarkProFg0" },
    CmpItemAbbrDeprecated = { link = "OneDarkProFg1" },
    CmpItemAbbrMatch = { link = "OneDarkProBlueBold" },
    CmpItemAbbrMatchFuzzy = { link = "OneDarkProBlueUnderline" },
    CmpItemMenu = { link = "OneDarkProGray" },
    CmpItemKindText = { link = "OneDarkProOrange" },
    CmpItemKindVariable = { link = "OneDarkProOrange" },
    CmpItemKindMethod = { link = "OneDarkProBlue" },
    CmpItemKindFunction = { link = "OneDarkProBlue" },
    CmpItemKindConstructor = { link = "OneDarkProYellow" },
    CmpItemKindUnit = { link = "OneDarkProBlue" },
    CmpItemKindField = { link = "OneDarkProBlue" },
    CmpItemKindClass = { link = "OneDarkProYellow" },
    CmpItemKindInterface = { link = "OneDarkProYellow" },
    CmpItemKindModule = { link = "OneDarkProBlue" },
    CmpItemKindProperty = { link = "OneDarkProBlue" },
    CmpItemKindValue = { link = "OneDarkProOrange" },
    CmpItemKindEnum = { link = "OneDarkProYellow" },
    CmpItemKindOperator = { link = "OneDarkProYellow" },
    CmpItemKindKeyword = { link = "OneDarkProPurple" },
    CmpItemKindEvent = { link = "OneDarkProPurple" },
    CmpItemKindReference = { link = "OneDarkProPurple" },
    CmpItemKindColor = { link = "OneDarkProPurple" },
    CmpItemKindSnippet = { link = "OneDarkProGreen" },
    CmpItemKindFile = { link = "OneDarkProBlue" },
    CmpItemKindFolder = { link = "OneDarkProBlue" },
    CmpItemKindEnumMember = { link = "OneDarkProAqua" },
    CmpItemKindConstant = { link = "OneDarkProOrange" },
    CmpItemKindStruct = { link = "OneDarkProYellow" },
    CmpItemKindTypeParameter = { link = "OneDarkProYellow" },
    diffAdded = { link = "OneDarkProGreen" },
    diffRemoved = { link = "OneDarkProRed" },
    diffChanged = { link = "OneDarkProAqua" },
    diffFile = { link = "OneDarkProOrange" },
    diffNewFile = { link = "OneDarkProYellow" },
    diffOldFile = { link = "OneDarkProOrange" },
    diffLine = { link = "OneDarkProBlue" },
    diffIndexLine = { link = "diffChanged" },
    -- navic (highlight icons)
    NavicIconsFile = { link = "OneDarkProBlue" },
    NavicIconsModule = { link = "OneDarkProOrange" },
    NavicIconsNamespace = { link = "OneDarkProBlue" },
    NavicIconsPackage = { link = "OneDarkProAqua" },
    NavicIconsClass = { link = "OneDarkProYellow" },
    NavicIconsMethod = { link = "OneDarkProBlue" },
    NavicIconsProperty = { link = "OneDarkProAqua" },
    NavicIconsField = { link = "OneDarkProPurple" },
    NavicIconsConstructor = { link = "OneDarkProBlue" },
    NavicIconsEnum = { link = "OneDarkProPurple" },
    NavicIconsInterface = { link = "OneDarkProGreen" },
    NavicIconsFunction = { link = "OneDarkProBlue" },
    NavicIconsVariable = { link = "OneDarkProPurple" },
    NavicIconsConstant = { link = "OneDarkProOrange" },
    NavicIconsString = { link = "OneDarkProGreen" },
    NavicIconsNumber = { link = "OneDarkProOrange" },
    NavicIconsBoolean = { link = "OneDarkProOrange" },
    NavicIconsArray = { link = "OneDarkProOrange" },
    NavicIconsObject = { link = "OneDarkProOrange" },
    NavicIconsKey = { link = "OneDarkProAqua" },
    NavicIconsNull = { link = "OneDarkProOrange" },
    NavicIconsEnumMember = { link = "OneDarkProYellow" },
    NavicIconsStruct = { link = "OneDarkProPurple" },
    NavicIconsEvent = { link = "OneDarkProYellow" },
    NavicIconsOperator = { link = "OneDarkProRed" },
    NavicIconsTypeParameter = { link = "OneDarkProRed" },
    NavicText = { link = "OneDarkProWhite" },
    NavicSeparator = { link = "OneDarkProWhite" },
    -- html
    htmlTag = { link = "OneDarkProAquaBold" },
    htmlEndTag = { link = "OneDarkProAquaBold" },
    htmlTagName = { link = "OneDarkProBlue" },
    htmlArg = { link = "OneDarkProOrange" },
    htmlTagN = { link = "OneDarkProFg1" },
    htmlSpecialTagName = { link = "OneDarkProBlue" },
    htmlLink = { fg = colors.fg4, underline = config.underline },
    htmlSpecialChar = { link = "OneDarkProRed" },
    htmlBold = { fg = colors.fg0, bg = colors.bg0, bold = config.bold },
    htmlBoldUnderline = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, underline = config.underline },
    htmlBoldItalic = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, italic = true },
    htmlBoldUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      bold = config.bold,
      italic = true,
      underline = config.underline,
    },
    htmlUnderline = { fg = colors.fg0, bg = colors.bg0, underline = config.underline },
    htmlUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      italic = true,
      underline = config.underline,
    },
    htmlItalic = { fg = colors.fg0, bg = colors.bg0, italic = true },
    -- xml
    xmlTag = { link = "OneDarkProAquaBold" },
    xmlEndTag = { link = "OneDarkProAquaBold" },
    xmlTagName = { link = "OneDarkProBlue" },
    xmlEqual = { link = "OneDarkProBlue" },
    docbkKeyword = { link = "OneDarkProAquaBold" },
    xmlDocTypeDecl = { link = "OneDarkProGray" },
    xmlDocTypeKeyword = { link = "OneDarkProPurple" },
    xmlCdataStart = { link = "OneDarkProGray" },
    xmlCdataCdata = { link = "OneDarkProPurple" },
    dtdFunction = { link = "OneDarkProGray" },
    dtdTagName = { link = "OneDarkProPurple" },
    xmlAttrib = { link = "OneDarkProOrange" },
    xmlProcessingDelim = { link = "OneDarkProGray" },
    dtdParamEntityPunct = { link = "OneDarkProGray" },
    dtdParamEntityDPunct = { link = "OneDarkProGray" },
    xmlAttribPunct = { link = "OneDarkProGray" },
    xmlEntity = { link = "OneDarkProRed" },
    xmlEntityPunct = { link = "OneDarkProRed" },
    -- clojure
    clojureKeyword = { link = "OneDarkProBlue" },
    clojureCond = { link = "OneDarkProOrange" },
    clojureSpecial = { link = "OneDarkProOrange" },
    clojureDefine = { link = "OneDarkProOrange" },
    clojureFunc = { link = "OneDarkProYellow" },
    clojureRepeat = { link = "OneDarkProYellow" },
    clojureCharacter = { link = "OneDarkProAqua" },
    clojureStringEscape = { link = "OneDarkProAqua" },
    clojureException = { link = "OneDarkProRed" },
    clojureRegexp = { link = "OneDarkProAqua" },
    clojureRegexpEscape = { link = "OneDarkProAqua" },
    clojureRegexpCharClass = { fg = colors.fg3, bold = config.bold },
    clojureRegexpMod = { link = "clojureRegexpCharClass" },
    clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    clojureParen = { link = "OneDarkProFg3" },
    clojureAnonArg = { link = "OneDarkProYellow" },
    clojureVariable = { link = "OneDarkProBlue" },
    clojureMacro = { link = "OneDarkProOrange" },
    clojureMeta = { link = "OneDarkProYellow" },
    clojureDeref = { link = "OneDarkProYellow" },
    clojureQuote = { link = "OneDarkProYellow" },
    clojureUnquote = { link = "OneDarkProYellow" },
    -- C
    cOperator = { link = "OneDarkProPurple" },
    cppOperator = { link = "OneDarkProPurple" },
    cStructure = { link = "OneDarkProOrange" },
    -- python
    pythonBuiltin = { link = "OneDarkProOrange" },
    pythonBuiltinObj = { link = "OneDarkProOrange" },
    pythonBuiltinFunc = { link = "OneDarkProOrange" },
    pythonFunction = { link = "OneDarkProAqua" },
    pythonDecorator = { link = "OneDarkProRed" },
    pythonInclude = { link = "OneDarkProBlue" },
    pythonImport = { link = "OneDarkProBlue" },
    pythonRun = { link = "OneDarkProBlue" },
    pythonCoding = { link = "OneDarkProBlue" },
    pythonOperator = { link = "OneDarkProRed" },
    pythonException = { link = "OneDarkProRed" },
    pythonExceptions = { link = "OneDarkProPurple" },
    pythonBoolean = { link = "OneDarkProPurple" },
    pythonDot = { link = "OneDarkProFg3" },
    pythonConditional = { link = "OneDarkProRed" },
    pythonRepeat = { link = "OneDarkProRed" },
    pythonDottedName = { link = "OneDarkProGreenBold" },
    -- CSS
    cssBraces = { link = "OneDarkProBlue" },
    cssFunctionName = { link = "OneDarkProYellow" },
    cssIdentifier = { link = "OneDarkProOrange" },
    cssClassName = { link = "OneDarkProGreen" },
    cssColor = { link = "OneDarkProBlue" },
    cssSelectorOp = { link = "OneDarkProBlue" },
    cssSelectorOp2 = { link = "OneDarkProBlue" },
    cssImportant = { link = "OneDarkProGreen" },
    cssVendor = { link = "OneDarkProFg1" },
    cssTextProp = { link = "OneDarkProAqua" },
    cssAnimationProp = { link = "OneDarkProAqua" },
    cssUIProp = { link = "OneDarkProYellow" },
    cssTransformProp = { link = "OneDarkProAqua" },
    cssTransitionProp = { link = "OneDarkProAqua" },
    cssPrintProp = { link = "OneDarkProAqua" },
    cssPositioningProp = { link = "OneDarkProYellow" },
    cssBoxProp = { link = "OneDarkProAqua" },
    cssFontDescriptorProp = { link = "OneDarkProAqua" },
    cssFlexibleBoxProp = { link = "OneDarkProAqua" },
    cssBorderOutlineProp = { link = "OneDarkProAqua" },
    cssBackgroundProp = { link = "OneDarkProAqua" },
    cssMarginProp = { link = "OneDarkProAqua" },
    cssListProp = { link = "OneDarkProAqua" },
    cssTableProp = { link = "OneDarkProAqua" },
    cssFontProp = { link = "OneDarkProAqua" },
    cssPaddingProp = { link = "OneDarkProAqua" },
    cssDimensionProp = { link = "OneDarkProAqua" },
    cssRenderProp = { link = "OneDarkProAqua" },
    cssColorProp = { link = "OneDarkProAqua" },
    cssGeneratedContentProp = { link = "OneDarkProAqua" },
    -- javascript
    javaScriptBraces = { link = "OneDarkProFg1" },
    javaScriptFunction = { link = "OneDarkProAqua" },
    javaScriptIdentifier = { link = "OneDarkProRed" },
    javaScriptMember = { link = "OneDarkProBlue" },
    javaScriptNumber = { link = "OneDarkProPurple" },
    javaScriptNull = { link = "OneDarkProPurple" },
    javaScriptParens = { link = "OneDarkProFg3" },
    -- typescript
    typescriptReserved = { link = "OneDarkProAqua" },
    typescriptLabel = { link = "OneDarkProAqua" },
    typescriptFuncKeyword = { link = "OneDarkProAqua" },
    typescriptIdentifier = { link = "OneDarkProOrange" },
    typescriptBraces = { link = "OneDarkProFg1" },
    typescriptEndColons = { link = "OneDarkProFg1" },
    typescriptDOMObjects = { link = "OneDarkProFg1" },
    typescriptAjaxMethods = { link = "OneDarkProFg1" },
    typescriptLogicSymbols = { link = "OneDarkProFg1" },
    typescriptDocSeeTag = { link = "Comment" },
    typescriptDocParam = { link = "Comment" },
    typescriptDocTags = { link = "vimCommentTitle" },
    typescriptGlobalObjects = { link = "OneDarkProFg1" },
    typescriptParens = { link = "OneDarkProFg3" },
    typescriptOpSymbols = { link = "OneDarkProFg3" },
    typescriptHtmlElemProperties = { link = "OneDarkProFg1" },
    typescriptNull = { link = "OneDarkProPurple" },
    typescriptInterpolationDelimiter = { link = "OneDarkProAqua" },
    -- purescript
    purescriptModuleKeyword = { link = "OneDarkProAqua" },
    purescriptModuleName = { link = "OneDarkProFg1" },
    purescriptWhere = { link = "OneDarkProAqua" },
    purescriptDelimiter = { link = "OneDarkProFg4" },
    purescriptType = { link = "OneDarkProFg1" },
    purescriptImportKeyword = { link = "OneDarkProAqua" },
    purescriptHidingKeyword = { link = "OneDarkProAqua" },
    purescriptAsKeyword = { link = "OneDarkProAqua" },
    purescriptStructure = { link = "OneDarkProAqua" },
    purescriptOperator = { link = "OneDarkProBlue" },
    purescriptTypeVar = { link = "OneDarkProFg1" },
    purescriptConstructor = { link = "OneDarkProFg1" },
    purescriptFunction = { link = "OneDarkProFg1" },
    purescriptConditional = { link = "OneDarkProOrange" },
    purescriptBacktick = { link = "OneDarkProOrange" },
    -- coffescript
    coffeeExtendedOp = { link = "OneDarkProFg3" },
    coffeeSpecialOp = { link = "OneDarkProFg3" },
    coffeeCurly = { link = "OneDarkProOrange" },
    coffeeParen = { link = "OneDarkProFg3" },
    coffeeBracket = { link = "OneDarkProOrange" },
    -- ruby
    rubyStringDelimiter = { link = "OneDarkProGreen" },
    rubyInterpolationDelimiter = { link = "OneDarkProAqua" },
    rubyDefinedOperator = { link = "rubyKeyword" },
    -- objc
    objcTypeModifier = { link = "OneDarkProRed" },
    objcDirective = { link = "OneDarkProBlue" },
    -- go
    goDirective = { link = "OneDarkProAqua" },
    goConstants = { link = "OneDarkProPurple" },
    goDeclaration = { link = "OneDarkProRed" },
    goDeclType = { link = "OneDarkProBlue" },
    goBuiltins = { link = "OneDarkProOrange" },
    -- lua
    luaIn = { link = "OneDarkProRed" },
    luaFunction = { link = "OneDarkProAqua" },
    luaTable = { link = "OneDarkProOrange" },
    -- moonscript
    moonSpecialOp = { link = "OneDarkProFg3" },
    moonExtendedOp = { link = "OneDarkProFg3" },
    moonFunction = { link = "OneDarkProFg3" },
    moonObject = { link = "OneDarkProYellow" },
    -- java
    javaAnnotation = { link = "OneDarkProBlue" },
    javaDocTags = { link = "OneDarkProAqua" },
    javaCommentTitle = { link = "vimCommentTitle" },
    javaParen = { link = "OneDarkProFg3" },
    javaParen1 = { link = "OneDarkProFg3" },
    javaParen2 = { link = "OneDarkProFg3" },
    javaParen3 = { link = "OneDarkProFg3" },
    javaParen4 = { link = "OneDarkProFg3" },
    javaParen5 = { link = "OneDarkProFg3" },
    javaOperator = { link = "OneDarkProOrange" },
    javaVarArg = { link = "OneDarkProGreen" },
    -- elixir
    elixirDocString = { link = "Comment" },
    elixirStringDelimiter = { link = "OneDarkProGreen" },
    elixirInterpolationDelimiter = { link = "OneDarkProAqua" },
    elixirModuleDeclaration = { link = "OneDarkProYellow" },
    -- scala
    scalaNameDefinition = { link = "OneDarkProFg1" },
    scalaCaseFollowing = { link = "OneDarkProFg1" },
    scalaCapitalWord = { link = "OneDarkProFg1" },
    scalaTypeExtension = { link = "OneDarkProFg1" },
    scalaKeyword = { link = "OneDarkProRed" },
    scalaKeywordModifier = { link = "OneDarkProRed" },
    scalaSpecial = { link = "OneDarkProAqua" },
    scalaOperator = { link = "OneDarkProFg1" },
    scalaTypeDeclaration = { link = "OneDarkProYellow" },
    scalaTypeTypePostDeclaration = { link = "OneDarkProYellow" },
    scalaInstanceDeclaration = { link = "OneDarkProFg1" },
    scalaInterpolation = { link = "OneDarkProAqua" },
    -- markdown
    markdownItalic = { fg = colors.fg3, italic = true },
    markdownBold = { fg = colors.fg3, bold = config.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = config.bold, italic = true },
    markdownH1 = { link = "OneDarkProGreenBold" },
    markdownH2 = { link = "OneDarkProGreenBold" },
    markdownH3 = { link = "OneDarkProYellowBold" },
    markdownH4 = { link = "OneDarkProYellowBold" },
    markdownH5 = { link = "OneDarkProYellow" },
    markdownH6 = { link = "OneDarkProYellow" },
    markdownCode = { link = "OneDarkProAqua" },
    markdownCodeBlock = { link = "OneDarkProAqua" },
    markdownCodeDelimiter = { link = "OneDarkProAqua" },
    markdownBlockquote = { link = "OneDarkProGray" },
    markdownListMarker = { link = "OneDarkProGray" },
    markdownOrderedListMarker = { link = "OneDarkProGray" },
    markdownRule = { link = "OneDarkProGray" },
    markdownHeadingRule = { link = "OneDarkProGray" },
    markdownUrlDelimiter = { link = "OneDarkProFg3" },
    markdownLinkDelimiter = { link = "OneDarkProFg3" },
    markdownLinkTextDelimiter = { link = "OneDarkProFg3" },
    markdownHeadingDelimiter = { link = "OneDarkProOrange" },
    markdownUrl = { link = "OneDarkProPurple" },
    markdownUrlTitleDelimiter = { link = "OneDarkProGreen" },
    markdownLinkText = { fg = colors.gray, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- haskell
    haskellType = { link = "OneDarkProBlue" },
    haskellIdentifier = { link = "OneDarkProAqua" },
    haskellSeparator = { link = "OneDarkProFg4" },
    haskellDelimiter = { link = "OneDarkProOrange" },
    haskellOperators = { link = "OneDarkProPurple" },
    haskellBacktick = { link = "OneDarkProOrange" },
    haskellStatement = { link = "OneDarkProPurple" },
    haskellConditional = { link = "OneDarkProPurple" },
    haskellLet = { link = "OneDarkProRed" },
    haskellDefault = { link = "OneDarkProRed" },
    haskellWhere = { link = "OneDarkProRed" },
    haskellBottom = { link = "OneDarkProRedBold" },
    haskellImportKeywords = { link = "OneDarkProPurpleBold" },
    haskellDeclKeyword = { link = "OneDarkProOrange" },
    haskellDecl = { link = "OneDarkProOrange" },
    haskellDeriving = { link = "OneDarkProPurple" },
    haskellAssocType = { link = "OneDarkProAqua" },
    haskellNumber = { link = "OneDarkProAqua" },
    haskellPragma = { link = "OneDarkProRedBold" },
    haskellTH = { link = "OneDarkProAquaBold" },
    haskellForeignKeywords = { link = "OneDarkProGreen" },
    haskellKeyword = { link = "OneDarkProRed" },
    haskellFloat = { link = "OneDarkProAqua" },
    haskellInfix = { link = "OneDarkProPurple" },
    haskellQuote = { link = "OneDarkProGreenBold" },
    haskellShebang = { link = "OneDarkProYellowBold" },
    haskellLiquid = { link = "OneDarkProPurpleBold" },
    haskellQuasiQuoted = { link = "OneDarkProBlueBold" },
    haskellRecursiveDo = { link = "OneDarkProPurple" },
    haskellQuotedType = { link = "OneDarkProRed" },
    haskellPreProc = { link = "OneDarkProFg4" },
    haskellTypeRoles = { link = "OneDarkProRedBold" },
    haskellTypeForall = { link = "OneDarkProRed" },
    haskellPatternKeyword = { link = "OneDarkProBlue" },
    -- json
    jsonKeyword = { link = "OneDarkProGreen" },
    jsonQuote = { link = "OneDarkProGreen" },
    jsonBraces = { link = "OneDarkProFg1" },
    jsonString = { link = "OneDarkProFg1" },
    -- mail
    mailQuoted1 = { link = "OneDarkProAqua" },
    mailQuoted2 = { link = "OneDarkProPurple" },
    mailQuoted3 = { link = "OneDarkProYellow" },
    mailQuoted4 = { link = "OneDarkProGreen" },
    mailQuoted5 = { link = "OneDarkProRed" },
    mailQuoted6 = { link = "OneDarkProOrange" },
    mailSignature = { link = "Comment" },
    -- c#
    csBraces = { link = "OneDarkProFg1" },
    csEndColon = { link = "OneDarkProFg1" },
    csLogicSymbols = { link = "OneDarkProFg1" },
    csParens = { link = "OneDarkProFg3" },
    csOpSymbols = { link = "OneDarkProFg3" },
    csInterpolationDelimiter = { link = "OneDarkProFg3" },
    csInterpolationAlignDel = { link = "OneDarkProAquaBold" },
    csInterpolationFormat = { link = "OneDarkProAqua" },
    csInterpolationFormatDel = { link = "OneDarkProAquaBold" },
    -- rust btw
    rustSigil = { link = "OneDarkProOrange" },
    rustEscape = { link = "OneDarkProAqua" },
    rustStringContinuation = { link = "OneDarkProAqua" },
    rustEnum = { link = "OneDarkProAqua" },
    rustStructure = { link = "OneDarkProAqua" },
    rustModPathSep = { link = "OneDarkProFg2" },
    rustCommentLineDoc = { link = "Comment" },
    rustDefault = { link = "OneDarkProAqua" },
    -- ocaml
    ocamlOperator = { link = "OneDarkProFg1" },
    ocamlKeyChar = { link = "OneDarkProOrange" },
    ocamlArrow = { link = "OneDarkProOrange" },
    ocamlInfixOpKeyword = { link = "OneDarkProRed" },
    ocamlConstructor = { link = "OneDarkProOrange" },
    -- lspsaga.nvim
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionBorder = { link = "OneDarkProFg1" },
    LspSagaCodeActionContent = { fg = colors.green, bold = config.bold },
    LspSagaLspFinderBorder = { link = "OneDarkProFg1" },
    LspSagaAutoPreview = { link = "OneDarkProOrange" },
    TargetWord = { fg = colors.blue, bold = config.bold },
    FinderSeparator = { link = "OneDarkProAqua" },
    LspSagaDefPreviewBorder = { link = "OneDarkProBlue" },
    LspSagaHoverBorder = { link = "OneDarkProOrange" },
    LspSagaRenameBorder = { link = "OneDarkProBlue" },
    LspSagaDiagnosticSource = { link = "OneDarkProOrange" },
    LspSagaDiagnosticBorder = { link = "OneDarkProPurple" },
    LspSagaDiagnosticHeader = { link = "OneDarkProGreen" },
    LspSagaSignatureHelpBorder = { link = "OneDarkProGreen" },
    SagaShadow = { link = "OneDarkProBg0" },

    -- dashboard-nvim
    DashboardShortCut = { link = "OneDarkProOrange" },
    DashboardHeader = { link = "OneDarkProAqua" },
    DashboardCenter = { link = "OneDarkProYellow" },
    DashboardFooter = { fg = colors.purple, italic = true },
    -- mason
    MasonHighlight = { link = "OneDarkProAqua" },
    MasonHighlightBlock = { fg = colors.bg0, bg = colors.blue },
    MasonHighlightBlockBold = { fg = colors.bg0, bg = colors.blue, bold = true },
    MasonHighlightSecondary = { fg = colors.yellow },
    MasonHighlightBlockSecondary = { fg = colors.bg0, bg = colors.yellow },
    MasonHighlightBlockBoldSecondary = { fg = colors.bg0, bg = colors.yellow, bold = true },
    MasonHeader = { link = "MasonHighlightBlockBoldSecondary" },
    MasonHeaderSecondary = { link = "MasonHighlightBlockBold" },
    MasonMuted = { fg = colors.fg4 },
    MasonMutedBlock = { fg = colors.bg0, bg = colors.fg4 },
    MasonMutedBlockBold = { fg = colors.bg0, bg = colors.fg4, bold = true },
    -- lsp-inlayhints.nvim
    LspInlayHint = { link = "comment" },
    -- carbon.nvim
    CarbonFile = { link = "OneDarkProFg1" },
    CarbonExe = { link = "OneDarkProYellow" },
    CarbonSymlink = { link = "OneDarkProAqua" },
    CarbonBrokenSymlink = { link = "OneDarkProRed" },
    CarbonIndicator = { link = "OneDarkProGray" },
    CarbonDanger = { link = "OneDarkProRed" },
    CarbonPending = { link = "OneDarkProYellow" },
    -- noice.nvim
    NoiceCursor = { link = "TermCursor" },
    -- notify.nvim
    NotifyDEBUGBorder = { link = "OneDarkProBlue" },
    NotifyDEBUGIcon = { link = "OneDarkProBlue" },
    NotifyDEBUGTitle = { link = "OneDarkProBlue" },
    NotifyERRORBorder = { link = "OneDarkProRed" },
    NotifyERRORIcon = { link = "OneDarkProRed" },
    NotifyERRORTitle = { link = "OneDarkProRed" },
    NotifyINFOBorder = { link = "OneDarkProAqua" },
    NotifyINFOIcon = { link = "OneDarkProAqua" },
    NotifyINFOTitle = { link = "OneDarkProAqua" },
    NotifyTRACEBorder = { link = "OneDarkProGreen" },
    NotifyTRACEIcon = { link = "OneDarkProGreen" },
    NotifyTRACETitle = { link = "OneDarkProGreen" },
    NotifyWARNBorder = { link = "OneDarkProYellow" },
    NotifyWARNIcon = { link = "OneDarkProYellow" },
    NotifyWARNTitle = { link = "OneDarkProYellow" },

    -- ts-rainbow2 (maintained fork)
    TSRainbowRed = { fg = colors.red },
    TSRainbowOrange = { fg = colors.orange },
    TSRainbowYellow = { fg = colors.yellow },
    TSRainbowGreen = { fg = colors.green },
    TSRainbowBlue = { fg = colors.blue },
    TSRainbowViolet = { fg = colors.purple },
    TSRainbowCyan = { fg = colors.cyan },
  }

  for group, hl in pairs(config.overrides) do
    if groups[group] then
      -- "link" should not mix with other configs (:h hi-link)
      groups[group].link = nil
    end

    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

return M
