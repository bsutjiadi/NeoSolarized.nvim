local colors = require("NeoSolarized.colors")

local M = {}
function M.setup()
  local config = require("NeoSolarized.config")
  local options = config.options
  local theme = {
    config = options, colors = colors.setup(),
  }

  local c = theme.colors

  theme.highlights = {
    --Conceal                                  = { fg = c.red },                                  -- placeholder characters substituted for concealed text (see 'conceallevel'). I don't use the conceal feature

    --------------------------------------------------------------------------
    CurSearch                                = { link = "IncSearch" },
    IncSearch                                = { bg = c.orange, fg = c.bg0 },                                     -- 'incsearch' highlighting; also used for the text replaced with ":s///c" InfoText     = { sp = c.blue, undercurl = options.styles.undercurl },
    Search                                   = { bg = c.yellow, fg = c.bg0 },                                   -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.

    --CurrentWord                              = { fg = c.bg0, bg = c.white },                    -- not sure what this does..
    --Cursor                                   = { fg = c.white, bg = c.red },                      -- character under the cursor
    --CursorColumn                             = { link = "CursorLine" },                         -- Screen-column at the cursor, when 'cursorcolumn' is set.
    --CursorIM                                 = { fg = c.bg0, bg = c.fg0 },                      -- like Cursor, but used when in IME mode |CursorIM|
    CursorLine                               = { bg = options.transparent and c.bg0 or c.bg1 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set. horizontal line highlighting
    --CursorLineNr                             = { fg = c.red },                                -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    ColorColumn                              = { bg = c.bg1 },                                  -- used for the columns set with 'colorcolumn'
    LineNr                                   = { bg = options.transparent and c.none or c.bg1, fg = c.fg1 },      -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set. line number side bar background
    --------------------------------------------------------------------------

    Comment                                  = { fg = c.fg1, style = options.styles.comments }, -- any comment
    Directory                                = { fg = c.cyan, bold = true },                                 -- directory names (and other special names in listings)
    Normal                                   = { fg = c.fg0, bg = options.transparent and c.none or c.bg0 },      -- normal text, doesn't apply to .py files apparently..
    Keyword                                  = { fg = c.green, style = options.styles.keywords },     --  any other keyword ('def, return, class, etc')
    Boolean                                  = { fg = c.magenta },                                   --  a boolean constant: TRUE, false
    Special                                  = { fg = c.violet },                                   -- (preferred) any special symbol
    Conditional                              = { fg = c.green, italic = options.enable_italics },    --  if, then, else, endif, switch, etc.
    Structure                                = { fg = c.orange },                                   --  struct, union, enum, etc.
    Type                                     = { fg = c.yellow },                                   -- (preferred) int, long, char, etc.
    Number                                   = { fg = c.cyan },                                   --   a number constant: 234, 0xff
    Float                                    = { fg = c.cyan },                                   --    a floating point constant: 2.3e10
    Constant                                 = { fg = c.cyan },                                     -- (preferred) any constant
    Operator                                 = { fg = c.orange },                                   -- "sizeof", "+", "*", etc.
    String                                   = { fg = c.cyan, style = options.styles.string },     --   a string constant: "this is a string"

    --------------------------------------------------------------------------
    DiffAdd                                  = { bg = c.diff_add },                             -- diff mode: Added line |diff.txt|
    DiffChange                               = { bg = c.diff_change },                          -- diff mode: Changed line |diff.txt|
    DiffDelete                               = { bg = c.diff_delete },                          -- diff mode: Deleted line |diff.txt|
    DiffText                                 = { bg = c.diff_text },                            -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer                              = { fg = c.bg1 },                                  -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ErrorMsg                                 = { fg = c.red },                                  -- error messages on the command line
    ErrorText                                = { sp = c.red, undercurl = options.styles.undercurl },
    FloatBorder                              = { fg = c.base1, bg = options.transparent and c.none or c.bg1 },
    FoldColumn                               = { bg = options.transparent and c.none or c.bg0, fg = c.bg1 }, -- 'foldcolumn'
    Folded                                   = { fg = c.blue, bg = c.bg1 },                                  -- line used for closed folds
    Foo                                      = { bg = c.magenta, fg = c.magenta },
    HintText                                 = { sp = c.green, undercurl = false },

    MatchParen                               = { fg = c.orange, bold = true },                                    -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

    ModeMsg                                  = { fg = c.fg2, bold = true },                                       -- 'showmode' message (e.g., "-- INSERT -- ")
    MoreMsg                                  = { fg = c.blue },                                                   -- |more-prompt|
    MsgArea                                  = { fg = c.base2 },                                                  -- Area for messages and cmdline
    NonText                                  = { fg = c.fg2 },                                                    -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    --NormalFloat                              = { fg = c.fg0, bg = options.transparent and c.none or c.bg1 },      -- Normal text in floating windows.
    NormalNC                                 = { fg = c.fg0, bg = options.transparent and c.none or c.bg0 },      -- normal text in non-current windows
    NormalSB                                 = { fg = c.fg0, bg = c.bg0 },                                        -- normal text in sidebar
    Pmenu                                    = { bg = options.transparent and c.none or c.bg1, fg = c.fg0 },      -- Popup menu: normal item.
    PmenuSbar                                = { bg = options.transparent and c.none or c.bg1 },                  -- Popup menu: scrollbar.
    PmenuSel                                 = { bg = c.fg2, fg = c.base3 },                                      -- Popup menu: selected item.
    PmenuThumb                               = { bg = c.base1 },                                                  -- Popup menu: Thumb of the scrollbar.
    Question                                 = { fg = c.blue },                                                   -- |hit-enter| prompt and yes/no questions
    QuickFixLine                             = { bg = c.bg1, bold = true, undercurl = options.styles.undercurl }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    SignColumn                               = { bg = options.transparent and c.none or c.bg0 },                  -- column where |signs| are displayed
    SignColumnSB                             = { bg = c.bg0, fg = c.bg1 },                                        -- column where |signs| are displayed
    SpecialKey                               = { fg = c.fg2 },                                                    -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad                                 = { sp = c.red, undercurl = options.styles.undercurl },              -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap                                 = { sp = c.blue, undercurl = options.styles.undercurl },             -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal                               = { sp = c.magenta, undercurl = options.styles.undercurl },           -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare                                = { sp = c.green, undercurl = options.styles.undercurl },            -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine                               = { fg = c.fg0, bg = options.transparent and c.none or c.bg0 },      -- status line of current window
    StatusLineNC                             = { fg = c.fg2 },                                                    -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    Substitute                               = { bg = c.red, fg = c.bg0 },                                        -- |:substitute| replacement text highlighting
    TabLine                                  = { fg = c.fg2 },                                                    -- tab pages line, not active tab page label
    TabLineFill                              = { bg = c.bg0 },                                                    -- tab pages line, where there are no labels
    TabLineSel                               = { fg = c.bg0, bg = c.blue },                                       -- tab pages line, active tab page label
    Title                                    = { fg = c.blue, bold = true },                                      -- titles for output from ":set all", ":autocmd" etc.
    VertSplit                                = { fg = options.transparent and c.bg0 or c.base1 },                 -- the column separating vertically split windows
    Visual                                   = {
      bg = config.is_day() and c.base1 or c.bg1,
      fg = config.is_day() and c.fg0 or c.none
    },                                                                                                       -- Visual mode selection
    VisualNOS                                = { bg = c.bg1 },                                               -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg                               = { fg = c.red },                                               -- warning messages
    WarningText                              = { sp = c.yellow, undercurl = options.styles.undercurl },
    Whitespace                               = { fg = c.fg2 },                                               -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu                                 = { bg = c.bg1 },                                               -- current match in 'wildmenu' completion
    WinSeparator                             = { fg = options.transparent and c.bg0 or c.bg1, bold = true }, -- the column separating vertically split windows
    lCursor                                  = { fg = c.bg0, bg = c.fg0 },                                   -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Character                                = { fg = c.green },                                    --  a character constant: 'c', '\n'
    Identifier                               = { fg = c.blue, style = options.styles.variables },   -- (preferred) any variable name
    Function                                 = { fg = c.blue, style = options.styles.functions }, -- function name (also: methods for classes)
    Statement                                = { fg = c.red, italic = options.enable_italics },     -- (preferred) any statement
    Repeat                                   = { fg = c.violet, italic = options.enable_italics },     --   for, do, while, etc.
    Label                                    = { fg = c.orange },                                   --    case, default, etc.
    Exception                                = { fg = c.red, italic = options.enable_italics },     --  try, catch, throw
    PreProc                                  = { fg = c.magenta, italic = options.enable_italics },  -- (preferred) generic Preprocessor
    PreCondit                                = { fg = c.magenta, italic = options.enable_italics },
    Include                                  = { fg = c.orange, italic = options.enable_italics },     --  preprocessor #include
    Define                                   = { fg = c.magenta, italic = options.enable_italics },  --   preprocessor #define
    Macro                                    = { fg = c.cyan },                                     --    same as Define
    StorageClass                             = { fg = c.orange },                                   -- static, register, volatile, etc.
    Typedef                                  = { fg = c.red, italic = options.enable_italics },     --  A typedef
    SpecialChar                              = { fg = c.yellow },                                   --  special character in a constant
    Tag                                      = { fg = c.orange },                                   --    you can use CTRL-] on this
    Delimiter                                = { fg = c.fg0 },                                      --  character that needs attention
    SpecialComment                           = { fg = c.red },                                    -- special things inside a comment
    Debug                                    = { fg = c.orange },                                   --    debugging statements
    Underlined                               = { underline = true },                                -- (preferred) text that stands out, HTML links
    Bold                                     = { bold = true },
    Italic                                   = { italic = true },
    -- ("Ignore", below, may be invisible...)
    Ignore                                   = { fg = c.base1 },                 -- (preferred) left blank, hidden  |hl-Ignore|
    Error                                    = { fg = c.red },                   -- (preferred) any erroneous construct
    Todo                                     = { fg = c.magenta, bold = true }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
--    qfLineNr                                 = { fg = c.base1 },
--    qfFileName                               = { fg = c.blue },
--    -- Diagnostic
--    RedSign                                  = { fg = c.red },
--    YellowSign                               = { fg = c.yellow },
--    GreenSign                                = { fg = c.green },
--    BlueSign                                 = { fg = c.blue },
--    VirtualTextWarning                       = { fg = c.yellow },
--    VirtualTextError                         = { fg = c.red },
--    VirtualTextInfo                          = { fg = c.blue },
--    VirtualTextHint                          = { fg = c.green },
--    ErrorFloat                               = { fg = c.red, bg = options.transparent and c.none or c.bg1 },
--    WarningFloat                             = { fg = c.yellow, bg = options.transparent and c.none or c.bg1 },
--    InfoFloat                                = { fg = c.blue, bg = options.transparent and c.none or c.bg1 },
--    HintFloat                                = { fg = c.green, bg = options.transparent and c.none or c.bg1 },
--    --[[ WinBarNC                   = { fg = c.base1 }, ]]
--    DiagnosticFloatingError                  = { link = "ErrorFloat" },
--    DiagnosticFloatingWarn                   = { link = "WarningFloat" },
--    DiagnosticFloatingInfo                   = { link = "InfoFloat" },
--    DiagnosticFloatingHint                   = { link = "HintFloat" },
--    DiagnosticError                          = { link = "ErrorText" },
--    DiagnosticWarn                           = { link = "WarningText" },
--    DiagnosticInfo                           = { link = "InfoText" },
--    DiagnosticHint                           = { link = "HintText" },
--    DiagnosticVirtualTextError               = { link = "VirtualTextError" },
--    DiagnosticVirtualTextWarn                = { link = "VirtualTextWarning" },
--    DiagnosticVirtualTextInfo                = { link = "VirtualTextInfo" },
--    DiagnosticVirtualTextHint                = { link = "VirtualTextHint" },
--    DiagnosticUnderlineError                 = { link = "ErrorText" },
--    DiagnosticUnderlineWarn                  = { link = "WarningText" },
--    DiagnosticUnderlineInfo                  = { link = "InfoText" },
--    DiagnosticUnderlineHint                  = { link = "HintText" },
--    DiagnosticSignError                      = { link = "RedSign" },
--    DiagnosticSignWarn                       = { link = "YellowSign" },
--    DiagnosticSignInfo                       = { link = "BlueSign" },
--    DiagnosticSignHiblue                     = { link = "GreenSign" },
--    -- These groups are for the native LSP client. Some other LSP clients may
--    -- use these groups, or use their own. Consult your LSP client's
--    -- documentation.
--    LspDiagnosticsFloatingError              = { link = "DiagnosticFloatingError" },
--    LspDiagnosticsFloatingWarning            = { link = "DiagnosticFloatingWarn" },
--    LspDiagnosticsFloatingInformation        = { link = "DiagnosticFloatingInfo" },
--    LspDiagnosticsFloatingHint               = { link = "DiagnosticFloatingHint" },
--    LspDiagnosticsDefaultError               = { link = "DiagnosticError" },
--    LspDiagnosticsDefaultWarning             = { link = "DiagnosticWarn" },
--    LspDiagnosticsDefaultInformation         = { link = "DiagnosticInfo" },
--    LspDiagnosticsDefaultHint                = { link = "DiagnosticHint" },
--    LspDiagnosticsVirtualTextError           = { link = "DiagnosticVirtualTextError" },
--    LspDiagnosticsVirtualTextWarning         = { link = "DiagnosticVirtualTextWarn" },
--    LspDiagnosticsVirtualTextInformation     = { link = "DiagnosticVirtualTextInfo" },
--    LspDiagnosticsVirtualTextHint            = { link = "DiagnosticVirtualTextHint" },
--    LspDiagnosticsUnderlineError             = { link = "DiagnosticUnderlineError" },
--    LspDiagnosticsUnderlineWarning           = { link = "DiagnosticUnderlineWarn" },
--    LspDiagnosticsUnderlineInformation       = { link = "DiagnosticUnderlineInfo" },
--    LspDiagnosticsUnderlineHint              = { link = "DiagnosticUnderlineHint" },
--    LspDiagnosticsSignError                  = { link = "DiagnosticSignError" },
--    LspDiagnosticsSignWarning                = { link = "DiagnosticSignWarn" },
--    LspDiagnosticsSignInformation            = { link = "DiagnosticSignInfo" },
--    LspDiagnosticsSignHint                   = { link = "DiagnosticSignHint" },
--    LspReferenceText                         = { link = "CurrentWord" },
--    LspReferenceRead                         = { link = "CurrentWord" },
--    LspReferenceWrite                        = { link = "CurrentWord" },
--    LspCodeLens                              = { link = "VirtualTextInfo" },
--    LspCodeLensSeparator                     = { link = "VirtualTextHint" },
--    LspSignatureActiveParameter              = { link = "Search" },
--    TermCursor                               = { link = "Cursor" },
--    healthError                              = { fg = c.red },
--    healthSuccess                            = { fg = c.green },
--    healthWarning                            = { fg = c.yellow },
--    ALEErrorSign                             = { link = "ErrorMsg" },
--    ALEWarningSign                           = { link = "WarningMsg" },
--    -- These highlight Groups are for Tree-sitter
--    TSAnnotation                             = { fg = c.magenta },
--    TSAttribute                              = { fg = c.magenta },
--    TSBoolean                                = { fg = c.magenta },
--    TSCharacter                              = { fg = c.cyan },
--    TSComment                                = { link = "Comment" },
--    TSConditional                            = { link = "Conditional" },
--    TSConstBuiltin                           = { fg = c.blue, italic = true },
--    TSConstMacro                             = { fg = c.blue, italic = true },
--    TSConstant                               = { fg = c.fg0 },
--    TSConstructor                            = { fg = c.green, bold = true },
--    TSException                              = { fg = c.red },
--    TSField                                  = { fg = c.green },
--    TSFloat                                  = { fg = c.magenta },
--    TSFuncBuiltin                            = { fg = c.green, bold = true },
--    TSFuncMacro                              = { fg = c.green, bold = true },
--    TSFunction                               = { fg = c.green, bold = true },
--    TSInclude                                = { fg = c.red },
--    TSKeyword                                = { fg = c.red },
--    TSKeywordFunction                        = { fg = c.red },
--    TSKeywordOperator                        = { fg = c.orange },
--    TSLabel                                  = { fg = c.orange },
--    TSMethod                                 = { fg = c.green, bold = true },
--    TSNamespace                              = { fg = c.yellow, italic = true },
--    TSNone                                   = { fg = c.fg0 },
--    TSNumber                                 = { fg = c.magenta },
--    TSOperator                               = { fg = c.orange },
--    TSParameter                              = { fg = c.fg0 },
--    TSParameterReference                     = { fg = c.fg0 },
--    TSProperty                               = { fg = c.blue },
--    TSPunctBracket                           = { fg = c.fg0 },
--    TSPunctDelimiter                         = { fg = c.base1 },
--    TSPunctSpecial                           = { fg = c.blue },
--    TSRepeat                                 = { fg = c.red },
--    TSStorageClass                           = { fg = c.orange },
--    TSString                                 = { fg = c.cyan },
--    TSStringEscape                           = { fg = c.green },
--    TSStringRegex                            = { fg = c.green },
--    TSSymbol                                 = { fg = c.fg0 },
--    TSTag                                    = { fg = c.orange },
--    TSTagDelimiter                           = { fg = c.green },
--    TSText                                   = { fg = c.green },
--    TSStrike                                 = { fg = c.base1 },
--    TSMath                                   = { fg = c.blue },
--    TSType                                   = { fg = c.yellow },
--    TSTypeBuiltin                            = { fg = c.yellow, italic = true },
--    TSURI                                    = { link = "markdownUrl" },
--    TSVariable                               = { fg = c.fg0 },
--    TSVariableBuiltin                        = { fg = c.blue, italic = true },
--    --- Identifiers
    ["@variable"]                            = { fg = c.fg0, style = options.styles.variables }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"]                    = { fg = c.violet },                                  -- Variable names that are defined by the languages, like `this` or `self`.
--    ["@text.reference"]                      = { fg = c.magenta },
--    ["@text.todo.unchecked"]                 = { fg = c.blue },                                 -- For brackets and parens.
--    ["@text.todo.checked"]                   = { fg = c.green },                                -- For brackets and parens.
--    ["@text.warning"]                        = { fg = c.bg, bg = c.yellow },
--    ["@text.danger"]                         = { fg = c.fg0, bg = c.red },
--    ["@text.diff.add"]                       = { link = "DiffAdd" },
--    ["@text.diff.delete"]                    = { link = "DiffDelete" },
--    ["@namespace"]                           = { link = "Include" },
--    -- LSP Semantic Token Groups
--    ["@lsp.type.comment"]                    = { link = "TSComment" },
--    ["@lsp.type.enum"]                       = { link = "@type" },
--    ["@lsp.type.enumMember"]                 = { link = "TSConstructor" },
--    ["@lsp.type.interface"]                  = { fg = c.blue },
--    ["@lsp.type.keyword"]                    = { link = "TSKeyword" },
--    ["@lsp.type.modifier"]                   = { fg = c.red },
--    ["@lsp.type.namespace"]                  = { link = "TSNameSpace" },
--    ["@lsp.type.parameter"]                  = { link = "TSParameter" },
--    ["@lsp.type.property"]                   = { link = "TSProperty" },
--    ["@lsp.type.variable"]                   = { fg = c.fg0 },
--    ["@lsp.typemod.function.defaultLibrary"] = { link = "TSFuncBuiltin" },
--    ["@lsp.typemod.macro.defaultLibrary"]    = { link = "TSFuncBuiltin" },
--    ["@lsp.typemod.method.defaultLibrary"]   = { link = "TSFuncBuiltin" },
--    ["@lsp.typemod.operator.injected"]       = { link = "TSOperator" },
--    ["@lsp.typemod.string.injected"]         = { link = "@string" },
--    ["@lsp.typemod.type.defaultLibrary"]     = { fg = c.blue },
--    ["@lsp.typemod.variable.defaultLibrary"] = { link = "TSVariableBuiltin" },
--    ["@lsp.typemod.variable.injected"]       = { link = "TSVariable" },
--    -- ts-rainbow
--    rainbowcol1                              = { fg = c.red },
--    rainbowcol2                              = { fg = c.orange },
--    rainbowcol3                              = { fg = c.yellow },
--    rainbowcol4                              = { fg = c.green },
--    rainbowcol5                              = { fg = c.cyan },
--    rainbowcol6                              = { fg = c.blue },
--    rainbowcol7                              = { fg = c.magenta },
--    -- LspTrouble
--    TroubleText                              = { fg = c.fg0 },
--    TroubleCount                             = { fg = c.base1 },
--    TroubleNormal                            = { fg = c.base1 },
--    -- Illuminate
--    illuminatedWord                          = { link = "CurrentWord" },
--    illuminatedCurWord                       = { link = "CurrentWord" },
--    IlluminatedWordText                      = { link = "CurrentWord" },
--    IlluminatedWordRead                      = { link = "CurrentWord" },
--    IlluminatedWordWrite                     = { link = "CurrentWord" },
--    -- diff
--    diffAdded                                = { fg = c.green },
--    diffRemoved                              = { fg = c.red },
--    diffChanged                              = { fg = c.blue },
--    diffOldFile                              = { fg = c.yellow },
--    diffNewFile                              = { fg = c.orange },
--    diffFile                                 = { fg = c.cyan },
--    diffLine                                 = { fg = c.base1 },
--    diffIndexLine                            = { fg = c.magenta },
--    -- Neogit
--    NeogitBranch                             = { fg = c.magenta },
--    NeogitRemote                             = { fg = c.violet },
--    NeogitHunkHeader                         = { fg = c.fg0 },
--    NeogitHunkHeaderHighlight                = { fg = c.blue },
--    NeogitDiffContextHighlight               = { fg = c.fg2 },
--    NeogitDiffDeleteHighlight                = { fg = c.red },
--    NeogitDiffAddHighlight                   = { fg = c.green },
--    -- Neotest
--    NeotestPassed                            = { fg = c.green },
--    NeotestRunning                           = { fg = c.yellow },
--    NeotestFailed                            = { fg = c.red },
--    NeotestSkipped                           = { fg = c.blue },
--    NeotestTest                              = { fg = c.base1 },
--    NeotestNamespace                         = { fg = c.bg_green },
--    NeotestFocused                           = { fg = c.yellow },
--    NeotestFile                              = { fg = c.cyan },
--    NeotestDir                               = { fg = c.blue },
--    NeotestBorder                            = { fg = c.blue },
--    NeotestIndent                            = { fg = c.base2 },
--    NeotestExpandMarker                      = { fg = c.base2 },
--    NeotestAdapterName                       = { fg = c.magenta, bold = true },
--    NeotestWinSelect                         = { fg = c.blue },
--    NeotestMarked                            = { fg = c.blue },
--    NeotestTarget                            = { fg = c.blue },
--    -- GitGutter
--    GitGutterAdd                             = { link = "GreenSign" },
--    GitGutterChange                          = { link = "BlueSign" },
--    GitGutterDelete                          = { link = "RedSign" },
--    GitGutterChangeDelete                    = { fg = c.magenta },
--    GitGutterAddLine                         = { link = "diffAdded" },
--    GitGutterChangeLine                      = { link = "diffChanged" },
--    GitGutterDeleteLine                      = { link = "diffRemoved" },
--    GitGutterChangeDeleteLine                = { fg = c.magenta },
--    GitGutterAddLineNr                       = { fg = c.green },
--    GitGutterChangeLineNr                    = { fg = c.blue },
--    GitGutterDeleteLineNr                    = { fg = c.red },
--    GitGutterChangeDeleteLineNr              = { fg = c.magenta },
--    -- GitSigns
--    GitSignsAdd                              = { link = "GreenSign" }, -- diff mode: Added line |diff.txt|
--    GitSignsChange                           = { link = "BlueSign" },  -- diff mode: Changed line |diff.txt|
--    GitSignsDelete                           = { link = "RedSign" },   -- diff mode: Deleted line |diff.txt|
--    GitSignsAddNr                            = { fg = c.green },
--    GitSignsChangeNr                         = { fg = c.blue },
--    GitSignsDeleteNr                         = { fg = c.red },
--    GitSignsAddLn                            = { link = "diffAdded" },
--    GitSignsDeleteLn                         = { link = "diffRemoved" },
--    GitSignsCurrentLineBlame                 = { fg = c.base1 },
--    -- Telescope
--    TelescopeMatching                        = { fg = c.green, bold = true },
--    TelescopeBorder                          = { fg = c.base1, bg = options.transparent and c.none or c.bg0 },
--    TelescopeNormal                          = { fg = c.fg0, bg = options.transparent and c.none or c.bg0 },
--    TelescopePromptPrefix                    = { fg = c.orange },
--    TelescopeSelection                       = { link = "diffAdded" },
--    -- NvimTree
--    NvimTreeSymlink                          = { fg = c.fg0 },
--    NvimTreeFolderName                       = { fg = c.green },
--    NvimTreeRootFolder                       = { fg = c.base1 },
--    NvimTreeFolderIcon                       = { fg = c.orange },
--    NvimTreeEmptyFolderName                  = { fg = c.green },
--    NvimTreeOpenedFolderName                 = { fg = c.green },
--    NvimTreeExecFile                         = { fg = c.fg0 },
--    NvimTreeOpenedFile                       = { fg = c.fg0 },
--    NvimTreeSpecialFile                      = { fg = c.fg0 },
--    NvimTreeImageFile                        = { fg = c.fg0 },
--    NvimTreeMarkdownFile                     = { fg = c.fg0 },
--    NvimTreeIndentMarker                     = { fg = c.fg2 },
--    NvimTreeGitDirty                         = { fg = c.yellow },
--    NvimTreeGitStaged                        = { fg = c.blue },
--    NvimTreeGitMerge                         = { fg = c.orange },
--    NvimTreeGitRenamed                       = { fg = c.magenta },
--    NvimTreeGitNew                           = { fg = c.cyan },
--    NvimTreeGitDeleted                       = { fg = c.red },
--    NvimTreeLspDiagnosticsError              = { link = "RedSign" },
--    NvimTreeLspDiagnosticsWarning            = { link = "YellowSign" },
--    NvimTreeLspDiagnosticsInformation        = { link = "BlueSign" },
--    NvimTreeLspDiagnosticsHint               = { link = "GreenSign" },
--    -- NeoTree
--    NeoTreeDirectoryName                     = { fg = c.blue },
--    NeoTreeDirectoryIcon                     = { fg = c.blue },
--    NeoTreeNormal                            = { fg = c.fg0, bg = options.transparent and c.none or c.bg0 },
--    NeoTreeExpander                          = { fg = c.base1 },
--    NeoTreeIndentMarker                      = { fg = c.base1 },
--    NeoTreeRootName                          = { fg = c.blue, bold = true },
--    NeoTreeSymbolicLinkTarget                = { fg = c.magenta },
--    NeoTreeGitAdded                          = { fg = c.green },
--    NeoTreeGitConflict                       = { fg = c.red },
--    NeoTreeGitDeleted                        = { fg = c.red },
--    NeoTreeGitIgnored                        = { fg = c.base1 },
--    NeoTreeGitModified                       = { fg = c.yellow },
--    NeoTreeGitUnstaged                       = { fg = c.red },
--    NeoTreeGitUntracked                      = { fg = c.blue },
--    NeoTreeGitStaged                         = { fg = c.green },
--    NeoTreeFloatBorder                       = { fg = c.blue },
--    NeoTreeFloatTitle                        = { fg = c.base3 },
--    NeoTreeFileNameOpened                    = { fg = c.magenta },
--    NeoTreeDimText                           = { fg = c.base1 },
--    NeoTreeFilterTerm                        = { fg = c.green, bold = true },
--    NeoTreeTabActive                         = { bg = options.transparent and c.none or c.bg0, fg = c.cyan, bold = true },
--    NeoTreeTabInactive                       = { bg = options.transparent and c.none or c.bg1, fg = c.base2 },
--    NeoTreeTabSeparatorActive                = {
--      fg = options.transparent and c.none or c.bg0,
--      bg = options.transparent and c.none or c.bg0
--    },
--    NeoTreeTabSeparatorInactive              = {
--      fg = options.transparent and c.none or c.bg1,
--      bg = options.transparent and c.none or c.bg1
--    },
--    NeoTreeVertSplit                         = { fg = c.base, bg = options.transparent and c.none or c.bg1 },
--    NeoTreeStatusLineNC                      = { fg = c.cyan, bg = c.cyan },
--    -- Fern
--    FernBranchText                           = { fg = c.blue },
--    -- glyph palette
--    GlyphPalette1                            = { fg = c.red },
--    GlyphPalette2                            = { fg = c.green },
--    GlyphPalette3                            = { fg = c.yellow },
--    GlyphPalette4                            = { fg = c.blue },
--    GlyphPalette6                            = { fg = c.green },
--    GlyphPalette7                            = { fg = c.fg0 },
--    GlyphPalette9                            = { fg = c.red },
--    -- Dashboard
--    DashboardShortCut                        = { fg = c.violet },
--    DashboardHeader                          = { fg = c.blue },
--    DashboardCenter                          = { fg = c.magenta },
--    DashboardFooter                          = { fg = c.red, italic = true },
--    -- Alpha
--    AlphaShortcut                            = { fg = c.orange },
--    AlphaHeader                              = { fg = c.red },
--    AlphaHeaderLabel                         = { fg = c.base2 },
--    AlphaFooter                              = { fg = c.red, italic = true },
--    AlphaButtons                             = { fg = c.magenta },
--    -- WhichKey
--    WhichKey                                 = { fg = c.red },
--    WhichKeyGroup                            = { fg = c.blue },
--    WhichKeyDesc                             = { fg = c.magenta },
--    WhichKeySeparator                        = { fg = c.green },
--    WhichKeyFloat                            = { bg = options.transparent and c.none or c.bg1 },
--    WhichKeyValue                            = { fg = c.fg2 },
--    -- LspSaga (Start)
--    -- general
--    TitleString                              = { link = "String" },
--    TitleSymbol                              = { link = "Symbol" },
--    TitleIcon                                = { fg = c.red },
--    SagaBorder                               = { link = "FloatBorder" },
--    SagaExpand                               = { fg = c.red },
--    SagaCollapse                             = { fg = c.red },
--    SagaBeacon                               = { bg = c.magenta },
--    -- code action
--    ActionPreviewNormal                      = { link = 'SagaBorder' },
--    ActionPreviewBorder                      = { link = 'SagaBorder' },
--    ActionPreviewTitle                       = { fg = c.magenta },
--    CodeActionNormal                         = { link = 'SagaBorder' },
--    CodeActionBorder                         = { link = 'SagaBorder' },
--    CodeActionText                           = { fg = c.yellow },
--    CodeActionConceal                        = { fg = c.green },
--    -- finder
--    FinderSelection                          = { fg = c.violet, bold = true },
--    FinderFileName                           = { fg = c.base3 },
--    FinderCount                              = { link = 'Title' },
--    FinderIcon                               = { fg = c.violet },
--    FinderType                               = { fg = c.magenta },
--    --finder spinner
--    FinderSpinnerTitle                       = { fg = c.magenta, bold = true },
--    FinderSpinner                            = { fg = c.magenta, bold = true },
--    FinderPreviewSearch                      = { link = 'Search' },
--    FinderVirtText                           = { fg = c.red },
--    FinderNormal                             = { link = 'SagaBorder' },
--    FinderBorder                             = { link = 'SagaBorder' },
--    FinderPreviewBorder                      = { link = 'SagaBorder' },
--    -- definition
--    DefinitionBorder                         = { link = 'SagaBorder' },
--    DefinitionNormal                         = { link = 'Normal' },
--    DefinitionSearch                         = { link = 'Search' },
--    -- hover
--    HoverNormal                              = { link = 'SagaBorder' },
--    HoverBorder                              = { link = 'SagaBorder' },
--    -- rename
--    RenameBorder                             = { link = 'SagaBorder' },
--    RenameNormal                             = { fg = c.orange },
--    RenameMatch                              = { link = 'Search' },
--    -- diagnostic
--    DiagnosticSource                         = { link = 'Normal' },
--    DiagnosticNormal                         = { link = 'Normal' },
--    DiagnosticBorder                         = { link = 'SagaBorder' },
--    DiagnosticErrorBorder                    = { link = 'SagaBorder' },
--    DiagnosticWarnBorder                     = { link = 'SagaBorder' },
--    DiagnosticHintBorder                     = { link = 'SagaBorder' },
--    DiagnosticInfoBorder                     = { link = 'SagaBorder' },
--    DiagnosticPos                            = { fg = c.fg2 },
--    DiagnosticWord                           = { fg = c.fg0 },
--    -- Call Hierachry
--    CallHierarchyNormal                      = { link = 'SagaBorder' },
--    CallHierarchyBorder                      = { link = 'SagaBorder' },
--    CallHierarchyIcon                        = { fg = c.magenta },
--    CallHierarchyTitle                       = { fg = c.red },
--    -- lightbulb
--    LspSagaLightBulb                         = { link = 'DiagnosticSignHint' },
--    -- shadow
--    SagaShadow                               = { bg = c.bg1 },
--    -- Outline
--    OutlineIndent                            = { fg = c.magenta },
--    OutlinePreviewBorder                     = { link = 'SagaBorder' },
--    OutlinePreviewNormal                     = { link = 'SagaBorder' },
--    -- Float term
--    TerminalBorder                           = { link = 'SagaBorder' },
--    TerminalNormal                           = { link = 'SagaBorder' },
--    -- LspSaga (end)
--
--    -- BufferLine
--    BufferLineIndicatorSelected              = { link = "GreenSign" },
--    -- Barbar
--    BufferCurrent                            = { bg = c.fg2, fg = c.fg0 },
--    BufferCurrentIndex                       = { bg = c.fg2, fg = c.base2 },
--    BufferCurrentMod                         = { bg = c.fg2, fg = c.yellow },
--    BufferCurrentSign                        = { bg = c.fg2, fg = c.yellow },
--    BufferCurrentTarget                      = { bg = c.fg2, fg = c.red },
--    BufferVisible                            = { bg = c.bg1, fg = c.fg0 },
--    BufferVisibleIndex                       = { bg = c.bg1, fg = c.yellow },
--    BufferVisibleMod                         = { bg = c.bg1, fg = c.red },
--    BufferVisibleSign                        = { bg = c.bg1, fg = c.green },
--    BufferVisibleTarget                      = { bg = c.bg1, fg = c.red },
--    BufferInactive                           = { bg = c.bg1, fg = c.base2 },
--    BufferInactiveIndex                      = { bg = c.bg1, fg = c.base2 },
--    BufferInactiveMod                        = { bg = c.bg1, fg = c.red },
--    BufferInactiveSign                       = { bg = c.bg1, fg = c.blue },
--    BufferInactiveTarget                     = { bg = c.bg1, fg = c.red },
--    BufferTabpages                           = { bg = c.bg1, fg = c.none },
--    BufferTabpage                            = { bg = c.bg1, fg = c.blue },
--    -- Sneak
--    Sneak                                    = { link = "Search" },
--    SneakScope                               = { link = "DiffText" },
--    -- Hop
--    HopNextKey                               = { fg = c.magenta, bold = true },
--    HopNextKey1                              = { fg = c.blue, bold = true },
--    HopNextKey2                              = { fg = c.cyan },
--    HopUnmatched                             = { fg = c.base3 },
--    LeapMatch                                = { bg = c.magenta, fg = c.fg0, bold = true },
--    LeapLabelPrimary                         = { fg = c.magenta, bold = true },
--    LeapLabelSecondary                       = { fg = c.green, bold = true },
--    LeapBackdrop                             = { fg = c.base2 },
--    LightspeedGreyWash                       = { fg = c.base2 },
--    LightspeedCursor                         = { link = "Cursor" },
--    LightspeedLabel                          = { fg = c.red, bg = c.none, bold = true, underline = true },
--    LightspeedLabelDistant                   = { fg = c.blue, bg = c.none, bold = true, underline = true },
--    LightspeedLabelDistantOverlapped         = { fg = c.bg_green, underline = true },
--    LightspeedLabelOverlapped                = { fg = c.violet, underline = true },
--    LightspeedMaskedChar                     = { fg = c.magenta },
--    LightspeedOneCharMatch                   = { bg = c.magenta, fg = c.fg0, bold = true },
--    LightspeedPendingOpArea                  = { bg = c.green, fg = c.bg0 },
--    LightspeedShortcut                       = { bg = c.red, fg = c.fg0, bold = true },
--    LightspeedUnlabeledMatch                 = { fg = c.fg0, bg = c.none, bold = true },
--    -- Cmp
--    CmpDocumentation                         = { fg = c.fg0, bg = options.transparent and c.none or c.bg1 },
--    CmpDocumentationBorder                   = { fg = c.bg1, bg = options.transparent and c.none or c.bg0 },
--    CmpItemKindDefault                       = { fg = c.fg2, bg = c.none },
--    CmpItemAbbrMatch                         = { fg = c.green, bold = true },
--    CmpItemAbbrMatchFuzzy                    = { fg = c.green, bold = true },
--    CmpItemAbbr                              = { fg = c.fg0 },
--    CmpItemAbbrDeprecated                    = { fg = c.base1 },
--    CmpItemMenu                              = { fg = c.fg0 },
--    CmpItemKind                              = { fg = c.yellow },
--    CmpItemKindText                          = { fg = c.fg0 },
--    CmpItemKindMethod                        = { fg = c.green },
--    CmpItemKindFunction                      = { fg = c.green },
--    CmpItemKindConstructor                   = { fg = c.green },
--    CmpItemKindField                         = { fg = c.green },
--    CmpItemKindVariable                      = { fg = c.blue },
--    CmpItemKindClass                         = { fg = c.yellow },
--    CmpItemKindInterface                     = { fg = c.yellow },
--    CmpItemKindModule                        = { fg = c.yellow },
--    CmpItemKindProperty                      = { fg = c.blue },
--    CmpItemKindUnit                          = { fg = c.magenta },
--    CmpItemKindValue                         = { fg = c.magenta },
--    CmpItemKindEnum                          = { fg = c.yellow },
--    CmpItemKindKeyword                       = { fg = c.red },
--    CmpItemKindSnippet                       = { fg = c.cyan },
--    CmpItemKindColor                         = { fg = c.cyan },
--    CmpItemKindFile                          = { fg = c.cyan },
--    CmpItemKindReference                     = { fg = c.cyan },
--    CmpItemKindFolder                        = { fg = c.cyan },
--    CmpItemKindEnumMember                    = { fg = c.magenta },
--    CmpItemKindConstant                      = { fg = c.blue },
--    CmpItemKindStruct                        = { fg = c.yellow },
--    CmpItemKindEvent                         = { fg = c.orange },
--    CmpItemKindOperator                      = { fg = c.orange },
--    CmpItemKindTypeParameter                 = { fg = c.yellow },
--    NavicIconsFile                           = { fg = c.fg0 },
--    NavicIconsModule                         = { fg = c.yellow },
--    NavicIconsNamespace                      = { fg = c.fg0 },
--    NavicIconsPackage                        = { fg = c.fg0 },
--    NavicIconsClass                          = { fg = c.orange },
--    NavicIconsMethod                         = { fg = c.blue },
--    NavicIconsProperty                       = { fg = c.green },
--    NavicIconsField                          = { fg = c.green },
--    NavicIconsConstructor                    = { fg = c.orange },
--    NavicIconsEnum                           = { fg = c.orange },
--    NavicIconsInterface                      = { fg = c.orange },
--    NavicIconsFunction                       = { fg = c.blue },
--    NavicIconsVariable                       = { fg = c.magenta },
--    NavicIconsConstant                       = { fg = c.magenta },
--    NavicIconsString                         = { fg = c.green },
--    NavicIconsNumber                         = { fg = c.orange },
--    NavicIconsBoolean                        = { fg = c.orange },
--    NavicIconsArray                          = { fg = c.orange },
--    NavicIconsObject                         = { fg = c.orange },
--    NavicIconsKey                            = { fg = c.magenta },
--    NavicIconsKeyword                        = { fg = c.magenta },
--    NavicIconsNull                           = { fg = c.orange },
--    NavicIconsEnumMember                     = { fg = c.green },
--    NavicIconsStruct                         = { fg = c.orange },
--    NavicIconsEvent                          = { fg = c.orange },
--    NavicIconsOperator                       = { fg = c.fg0 },
--    NavicIconsTypeParameter                  = { fg = c.green },
--    NavicText                                = { fg = c.fg0 },
--    NavicSeparator                           = { fg = c.fg0 },
--    -- Indent Blank Line
--    IblIndent                                = { fg = options.transparent and c.bg1 or c.fg2, bg = c.none },
--    IblScope                                 = { fg = c.text, bg = c.none },
--    RainbowRed                               = { blend = 0, fg = c.red },
--    RainbowYellow                            = { blend = 0, fg = c.yellow },
--    RainbowBlue                              = { blend = 0, fg = c.blue },
--    RainbowOrange                            = { blend = 0, fg = c.magenta },
--    RainbowGreen                             = { blend = 0, fg = c.green },
--    RainbowViolet                            = { blend = 0, fg = c.violet },
--    RainbowCyan                              = { blend = 0, fg = c.magenta },
--    -- Scrollbar
--    ScrollbarHandle                          = { fg = c.none, bg = c.bg1 },
--    ScrollbarSearchHandle                    = { fg = c.orange, bg = c.bg1 },
--    ScrollbarSearch                          = { fg = c.orange, bg = c.none },
--    ScrollbarErrorHandle                     = { fg = c.red, bg = c.bg1 },
--    ScrollbarError                           = { fg = c.red, bg = c.none },
--    ScrollbarWarnHandle                      = { fg = c.yellow, bg = c.bg1 },
--    ScrollbarWarn                            = { fg = c.yellow, bg = c.none },
--    ScrollbarInfoHandle                      = { fg = c.green, bg = c.bg1 },
--    ScrollbarInfo                            = { fg = c.green, bg = c.none },
--    ScrollbarHintHandle                      = { fg = c.blue, bg = c.bg1 },
--    ScrollbarHint                            = { fg = c.blue, bg = c.none },
--    ScrollbarMiscHandle                      = { fg = c.magenta, bg = c.bg1 },
--    ScrollbarMisc                            = { fg = c.magenta, bg = c.none },
--    -- Yanky
--    YankyPut                                 = { link = "IncSearch" },
--    YankyYanked                              = { link = "IncSearch" },
--    -- Notify
--    NotifyERRORBorder                        = { fg = c.red },
--    NotifyWARNBorder                         = { fg = c.yellow },
--    NotifyINFOBorder                         = { fg = c.green },
--    NotifyDEBUGBorder                        = { fg = c.base1 },
--    NotifyTRACEBorder                        = { fg = c.magenta },
--    NotifyERRORIcon                          = { fg = c.red },
--    NotifyWARNIcon                           = { fg = c.yellow },
--    NotifyINFOIcon                           = { fg = c.green },
--    NotifyDEBUGIcon                          = { fg = c.base1 },
--    NotifyTRACEIcon                          = { fg = c.magenta },
--    NotifyERRORTitle                         = { fg = c.red },
--    NotifyWARNTitle                          = { fg = c.yellow },
--    NotifyINFOTitle                          = { fg = c.green },
--    NotifyDEBUGTitle                         = { fg = c.base1 },
--    NotifyTRACETitle                         = { fg = c.magenta },
--    -- Mini
--    MiniCompletionActiveParameter            = { underline = true },
--    MiniCursorword                           = { bg = c.fg2 },
--    MiniCursorwordCurrent                    = { bg = c.fg2 },
--    MiniIndentscopeSymbol                    = { fg = options.transparent and c.bg1 or c.fg2 },
--    MiniIndentscopePrefix                    = { nocombine = true }, -- Make it invisible
--    MiniJump                                 = { bg = c.magenta, fg = "#ffffff" },
--    MiniJump2dSpot                           = { fg = c.magenta, bold = true, nocombine = true },
--    MiniStarterCurrent                       = { nocombine = true },
--    MiniStarterFooter                        = { fg = c.yellow, italic = true },
--    MiniStarterHeader                        = { fg = c.blue },
--    MiniStarterInactive                      = { fg = c.base1, style = options.styles.comments },
--    MiniStarterItem                          = { fg = c.fg0, bg = options.transparent and c.none or c.bg0 },
--    MiniStarterItemBullet                    = { fg = c.base2 },
--    MiniStarterItemPrefix                    = { fg = c.red },
--    MiniStarterSection                       = { fg = c.blue },
--    MiniStarterQuery                         = { fg = c.green },
--    MiniStatuslineDevinfo                    = { fg = c.fg1, bg = c.bg1 },
--    MiniStatuslineFileinfo                   = { fg = c.fg1, bg = c.bg1 },
--    MiniStatuslineFilename                   = { fg = c.fg1, bg = c.fg2 },
--    MiniStatuslineInactive                   = { fg = c.blue, bg = c.bg1 },
--    MiniStatuslineModeCommand                = { fg = "BLACK", bg = c.yellow, bold = true },
--    MiniStatuslineModeInsert                 = { fg = "BLACK", bg = c.green, bold = true },
--    MiniStatuslineModeNormal                 = { fg = "BLACK", bg = c.blue, bold = true },
--    MiniStatuslineModeOther                  = { fg = "BLACK", bg = c.cyan, bold = true },
--    MiniStatuslineModeReplace                = { fg = "BLACK", bg = c.red, bold = true },
--    MiniStatuslineModeVisual                 = { fg = "BLACK", bg = c.magenta, bold = true },
--    MiniSurround                             = { bg = c.orange, fg = "BLACK" },
--    MiniTablineCurrent                       = { fg = c.fg1, bg = c.fg2 },
--    MiniTablineFill                          = { bg = "BLACK" },
--    MiniTablineHidden                        = { fg = "BLACK", bg = c.bg1 },
--    MiniTablineModifiedCurrent               = { fg = c.red, bg = c.fg2 },
--    MiniTablineModifiedHidden                = { bg = c.bg1, fg = c.bg_red },
--    MiniTablineModifiedVisible               = { fg = c.yellow, bg = c.bg1 },
--    MiniTablineTabpagesection                = { bg = c.bg1, fg = c.none },
--    MiniTablineVisible                       = { fg = c.fg, bg = c.bg1 },
--    MiniTestEmphasis                         = { bold = true },
--    MiniTestFail                             = { fg = c.red, bold = true },
--    MiniTestPass                             = { fg = c.green, bold = true },
--    MiniTrailspace                           = { bg = c.red },
--    -- Noice
--
--    NoiceCompletionItemKindDefault           = { fg = c.fg2, bg = c.none },
--    NoiceCompletionItemKindKeyword           = { fg = c.violet, bg = c.none },
--    NoiceCompletionItemKindVariable          = { fg = c.magenta, bg = c.none },
--    NoiceCompletionItemKindConstant          = { fg = c.magenta, bg = c.none },
--    NoiceCompletionItemKindReference         = { fg = c.magenta, bg = c.none },
--    NoiceCompletionItemKindValue             = { fg = c.magenta, bg = c.none },
--    NoiceCompletionItemKindFunction          = { fg = c.blue, bg = c.none },
--    NoiceCompletionItemKindMethod            = { fg = c.blue, bg = c.none },
--    NoiceCompletionItemKindConstructor       = { fg = c.blue, bg = c.none },
--    NoiceCompletionItemKindClass             = { fg = c.orange, bg = c.none },
--    NoiceCompletionItemKindInterface         = { fg = c.orange, bg = c.none },
--    NoiceCompletionItemKindStruct            = { fg = c.orange, bg = c.none },
--    NoiceCompletionItemKindEvent             = { fg = c.orange, bg = c.none },
--    NoiceCompletionItemKindEnum              = { fg = c.orange, bg = c.none },
--    NoiceCompletionItemKindUnit              = { fg = c.orange, bg = c.none },
--    NoiceCompletionItemKindModule            = { fg = c.yellow, bg = c.none },
--    NoiceCompletionItemKindProperty          = { fg = c.green1, bg = c.none },
--    NoiceCompletionItemKindField             = { fg = c.green1, bg = c.none },
--    NoiceCompletionItemKindTypeParameter     = { fg = c.green1, bg = c.none },
--    NoiceCompletionItemKindEnumMember        = { fg = c.green1, bg = c.none },
--    NoiceCompletionItemKindOperator          = { fg = c.green1, bg = c.none },
--    NoiceCompletionItemKindSnippet           = { fg = "BLACK", bg = c.none },
--
--    -- Dropbar.nvim
--    DropBarMenuHoverEntry                    = { link = "Visual" },
--    DropBarMenuHoverIcon                     = { reverse = true },
--    DropBarMenuHoverSymbol                   = { bold = true },
--    DropBarIconUISeparator                   = { fg = c.fg2 },
--    DropBarKindArray                         = { fg = c.fg1 },
--    DropBarKindBoolean                       = { fg = c.fg1 },
--    DropBarKindBreakStatement                = { fg = c.fg1 },
--    DropBarKindCall                          = { fg = c.fg1 },
--    DropBarKindCaseStatement                 = { fg = c.fg1 },
--    DropBarKindClass                         = { fg = c.fg1 },
--    DropBarKindConstant                      = { fg = c.fg1 },
--    DropBarKindConstructor                   = { fg = c.fg1 },
--    DropBarKindContinueStatement             = { fg = c.fg1 },
--    DropBarKindDeclaration                   = { fg = c.fg1 },
--    DropBarKindDelete                        = { fg = c.fg1 },
--    DropBarKindDoStatement                   = { fg = c.fg1 },
--    DropBarKindElseStatement                 = { fg = c.fg1 },
--    DropBarKindEnum                          = { fg = c.fg1 },
--    DropBarKindEnumMember                    = { fg = c.fg1 },
--    DropBarKindEvent                         = { fg = c.fg1 },
--    DropBarKindField                         = { fg = c.fg1 },
--    DropBarKindFile                          = { fg = c.fg1 },
--    DropBarKindFolder                        = { fg = c.fg1 },
--    DropBarKindForStatement                  = { fg = c.fg1 },
--    DropBarKindFunction                      = { fg = c.fg1 },
--    DropBarKindIdentifier                    = { fg = c.fg1 },
--    DropBarKindIfStatement                   = { fg = c.fg1 },
--    DropBarKindInterface                     = { fg = c.fg1 },
--    DropBarKindKeyword                       = { fg = c.fg1 },
--    DropBarKindList                          = { fg = c.fg1 },
--    DropBarKindMacro                         = { fg = c.fg1 },
--    DropBarKindMarkdownH1                    = { fg = c.fg1 },
--    DropBarKindMarkdownH2                    = { fg = c.fg1 },
--    DropBarKindMarkdownH3                    = { fg = c.fg1 },
--    DropBarKindMarkdownH4                    = { fg = c.fg1 },
--    DropBarKindMarkdownH5                    = { fg = c.fg1 },
--    DropBarKindMarkdownH6                    = { fg = c.fg1 },
--    DropBarKindMethod                        = { fg = c.fg1 },
--    DropBarKindModule                        = { fg = c.fg1 },
--    DropBarKindNamespace                     = { fg = c.fg1 },
--    DropBarKindNull                          = { fg = c.fg1 },
--    DropBarKindNumber                        = { fg = c.fg1 },
--    DropBarKindObject                        = { fg = c.fg1 },
--    DropBarKindOperator                      = { fg = c.fg1 },
--    DropBarKindPackage                       = { fg = c.fg1 },
--    DropBarKindProperty                      = { fg = c.fg1 },
--    DropBarKindReference                     = { fg = c.fg1 },
--    DropBarKindRepeat                        = { fg = c.fg1 },
--    DropBarKindScope                         = { fg = c.fg1 },
--    DropBarKindSpecifier                     = { fg = c.fg1 },
--    DropBarKindStatement                     = { fg = c.fg1 },
--    DropBarKindString                        = { fg = c.fg1 },
--    DropBarKindStruct                        = { fg = c.fg1 },
--    DropBarKindSwitchStatement               = { fg = c.fg1 },
--    DropBarKindType                          = { fg = c.fg1 },
--    DropBarKindTypeParameter                 = { fg = c.fg1 },
--    DropBarKindUnit                          = { fg = c.fg1 },
--    DropBarKindValue                         = { fg = c.fg1 },
--    DropBarKindVariable                      = { fg = c.fg1 },
--    DropBarKindWhileStatement                = { fg = c.fg1 },
--
--    --[[
--      language specific settings are need to keep from here.
--      Here one can define vim's build in Language specific highlight group.
--    --]]
--
--    -- HTML
--    htmlH1                                    = { fg = c.red, bold = true },
--    htmlH2                                    = { fg = c.orange, bold = true },
--    htmlH3                                    = { fg = c.yellow, bold = true },
--    htmlH4                                    = { fg = c.green, bold = true },
--    htmlH5                                    = { fg = c.blue, bold = true },
--    htmlH6                                    = { fg = c.magenta, bold = true },
--    htmlLink                                  = { underline = true },
--    htmlBold                                  = { bold = true },
--    htmlBoldUnderline                         = { underline = true, bold = true },
--    htmlBoldItalics                           = { italic = true, bold = true },
--    htmlBoldUnderlineItalic                   = { underline = true, italic = true, bold = true },
--    htmlUnderline                             = { underline = true },
--    htmlUnderlineItalic                       = { italic = true, underline = true },
--    htmlItalic                                = { italic = true },
--    mkdCodeDelimiter                          = { bg = c.bg0, fg = c.fg0 },
--    -- MarkDown
--    markdownH1                                = { fg = c.red, bold = true },
--    markdownH2                                = { fg = c.orange, bold = true },
--    markdownH3                                = { fg = c.yellow, bold = true },
--    markdownH4                                = { fg = c.green, bold = true },
--    markdownH5                                = { fg = c.blue, bold = true },
--    markdownH6                                = { fg = c.magenta, bold = true },
--    markdownUrl                               = { fg = c.blue, underline = true },
--    markdownItalic                            = { italic = true },
--    markdownBold                              = { bold = true },
--    markdownItalicDelimiter                   = { fg = c.base1, italic = true },
--    markdownCode                              = { fg = c.green },
--    markdownCodeBlock                         = { fg = c.cyan },
--    markdownCodeDelimiter                     = { fg = c.cyan },
--    markdownBlockquote                        = { fg = c.fg2 },
--    markdownListMarker                        = { fg = c.red },
--    markdownOrderedListMarker                 = { fg = c.red },
--    markdownRule                              = { fg = c.magenta },
--    markdownHeadingRule                       = { fg = c.base1 },
--    markdownUrlDelimiter                      = { fg = c.base1 },
--    markdownLinkDelimiter                     = { fg = c.base1 },
--    markdownLinkTextDelimiter                 = { fg = c.base1 },
--    markdownHeadingDelimiter                  = { fg = c.base1 },
--    markdownLinkText                          = { fg = c.magenta },
--    markdownUrlTitleDelimiter                 = { fg = c.base1 },
--    markdownIdDeclaration                     = { link = "markdownLinkText" },
--    markdownBoldDelimiter                     = { fg = c.base1 },
--    markdownId                                = { fg = c.yellow },
--    ["@punctuation.special.markdown"]         = { fg = c.orange, bold = true },
--    ["@text.literal.markdown_inline"]         = { bg = c.bg0, fg = c.blue },
--    ["@markup.heading.1.markdown"]            = { link = "markdownH1" },
--    ["@markup.heading.2.markdown"]            = { link = "markdownH2" },
--    ["@markup.heading.3.markdown"]            = { link = "markdownH3" },
--    ["@markup.heading.4.markdown"]            = { link = "markdownH4" },
--    ["@markup.heading.5.markdown"]            = { link = "markdownH5" },
--    ["@markup.heading.6.markdown"]            = { link = "markdownH6" },
--    ["@markup.heading.1.marker.markdown"]     = { link = "markdownH1" },
--    ["@markup.heading.2.marker.markdown"]     = { link = "markdownH2" },
--    ["@markup.heading.3.marker.markdown"]     = { link = "markdownH3" },
--    ["@markup.heading.4.marker.markdown"]     = { link = "markdownH4" },
--    ["@markup.heading.5.marker.markdown"]     = { link = "markdownH5" },
--    ["@markup.heading.6.marker.markdown"]     = { link = "markdownH6" },
--    ["@markup.list.markdown"]                 = { link = "markdownListMarker" },
--    ["@markup.quote.markdown"]                = { link = "markdownBlockquote" },
--    ["@markup.strong.markdown_inline"]        = { link = "markdownBold" },
--    ["@markup.italic.markdown_inline"]        = { link = "markdownItalic" },
--    ["@markup.heading.markdown"]              = { link = "markdownBold" },
--    ["@markup.link.label.markdown_inline"]    = { link = "markdownLinkText" },
--    ["@markup.strikethrough.markdown_inline"] = { strikethrough = true },
--
--    -- CSS
--    cssAttrComma                              = { fg = c.fg0 },
--    cssBraces                                 = { fg = c.fg0 },
--    cssTagName                                = { fg = c.magenta, italic = options.enable_italics },
--    cssClassNameDot                           = { fg = c.red },
--    cssClassName                              = { fg = c.red, italic = options.enable_italics },
--    cssFunctionName                           = { fg = c.yellow },
--    cssAttr                                   = { fg = c.orange },
--    cssProp                                   = { fg = c.cyan },
--    cssCommonAttr                             = { fg = c.yellow },
--    cssPseudoClassId                          = { fg = c.blue },
--    cssPseudoClassFn                          = { fg = c.green },
--    cssPseudoClass                            = { fg = c.magenta },
--    cssImportant                              = { fg = c.red, italic = options.enable_italics },
--    cssSelectorOp                             = { fg = c.orange },
--    cssSelectorOp2                            = { fg = c.orange },
--    cssColor                                  = { fg = c.green },
--    cssAttributeSelector                      = { fg = c.cyan },
--    cssUnitDecorators                         = { fg = c.orange },
--    cssValueLength                            = { fg = c.green },
--    cssValueInteger                           = { fg = c.green },
--    cssValueNumber                            = { fg = c.green },
--    cssValueAngle                             = { fg = c.green },
--    cssValueTime                              = { fg = c.green },
--    cssValueFrequency                         = { fg = c.green },
--    cssVendor                                 = { fg = c.base1 },
--    cssNoise                                  = { fg = c.base1 },
--    -- JavaScript
--    javaScriptNull                            = { fg = c.cyan },
--    javaScriptIdentifier                      = { fg = c.orange },
--    javaScriptParens                          = { fg = c.fg0 },
--    javaScriptBraces                          = { fg = c.fg0 },
--    javaScriptGlobal                          = { fg = c.yellow },
--    javaScriptMessage                         = { fg = c.yellow },
--    javaScriptFunction                        = { fg = c.red, italic = options.enable_italics },
--    javaScriptOperator                        = { fg = c.orange },
--    javaScriptMember                          = { fg = c.cyan },
--    -- Python
--    pythonBuiltin                             = { fg = c.yellow },
--    pythonExceptions                          = { fg = c.yellow },
--    pythonDecoratorName                       = { fg = c.blue },
--    -- Lua
--    luaFunc                                   = { fg = c.green, style = options.styles.bold },
--    luaFunction                               = { fg = c.cyan },
--    luaTable                                  = { fg = c.fg0 },
--    luaIn                                     = { fg = c.red, italic = options.enable_italics },
--    -- Go
--    goDirective                               = { fg = c.magenta, italic = options.enable_italics },
--    goConstants                               = { fg = c.cyan },
--    goDeclType                                = { fg = c.orange, italic = options.enable_italics },
--    -- Rust
--    rustStructure                             = { fg = c.orange },
--    rustIdentifier                            = { fg = c.magenta },
--    rustModPath                               = { fg = c.orange },
--    rustModPathSep                            = { fg = c.fg0 },
--    rustSelf                                  = { fg = c.blue },
--    rustSuper                                 = { fg = c.blue },
--    rustDeriveTrait                           = { fg = c.magenta, italic = options.enable_italics },
--    rustEnumVariant                           = { fg = c.magenta },
--    rustMacroVariable                         = { fg = c.blue },
--    rustAssert                                = { fg = c.cyan },
--    rustPanic                                 = { fg = c.cyan },
--    rustPubScopeCrate                         = { fg = c.magenta, italic = options.enable_italics },
--    -- PHP
--    phpVarSelector                            = { fg = c.blue },
--    phpDefine                                 = { fg = c.orange, italic = options.enable_italics },
--    phpStructure                              = { fg = c.red, italic = options.enable_italics },
--    phpSpecialFunction                        = { fg = c.green, bold = true },
--    phpInterpSimpleCurly                      = { fg = c.yellow },
--    phpComparison                             = { fg = c.orange },
--    phpMethodsVar                             = { fg = c.cyan },
--    phpMemberSelector                         = { fg = c.green },
--    -- Java
--    javaClassDecl                             = { fg = c.red, italic = options.enable_italics },
--    javaMethodDecl                            = { fg = c.red, italic = options.enable_italics },
--    javaVarArg                                = { fg = c.green },
--    javaAnnotation                            = { fg = c.blue },
--    javaUserLabel                             = { fg = c.magenta },
--    javaContant                               = { fg = c.violet },
--    javaTypedef                               = { fg = c.cyan },
--    javaParen                                 = { fg = c.fg0 },
--    javaParen1                                = { fg = c.fg0 },
--    javaParen2                                = { fg = c.fg0 },
--    javaParen3                                = { fg = c.fg0 },
--    javaParen4                                = { fg = c.fg0 },
--    javaParen5                                = { fg = c.fg0 },
--    -- Ruby
--    rubyKeywordAsMethod                       = { fg = c.green, bold = true },
--    rubyInterpolation                         = { fg = c.yellow },
--    rubyInterpolationDelimiter                = { fg = c.yellow },
--    rubyStringDelimiter                       = { fg = c.green },
--    rubyBlockParameterList                    = { fg = c.blue },
--    rubyDefine                                = { fg = c.red, italic = options.enable_italics },
--    rubyModuleName                            = { fg = c.magenta },
--    rubyAccess                                = { fg = c.orange },
--    rubyAttribute                             = { fg = c.yellow },
--    rubyMacro                                 = { fg = c.red, italic = options.enable_italics },
--    -- sh/zsh
--    shRange                                   = { fg = c.fg0 },
--    shTestOpr                                 = { fg = c.orange },
--    shOption                                  = { fg = c.cyan },
--    bashStatement                             = { fg = c.orange },
--    shOperator                                = { fg = c.orange },
--    shQuote                                   = { fg = c.green },
--    shSet                                     = { fg = c.orange },
--    shSetList                                 = { fg = c.blue },
--    shSnglCase                                = { fg = c.orange },
--    shVariable                                = { fg = c.blue },
--    shVarAssign                               = { fg = c.orange },
--    shCmdSubRegion                            = { fg = c.green },
--    shCommandSub                              = { fg = c.orange },
--    shFunctionOne                             = { fg = c.green, bold = true },
--    shFunctionKey                             = { fg = c.red, italic = options.enable_italics },
--    -- ZSH
--    zshOptStart                               = { fg = c.magenta, italic = options.enable_italics },
--    zshOption                                 = { fg = c.blue },
--    zshSubst                                  = { fg = c.yellow },
--    zshFunction                               = { fg = c.green, bold = true },
--    zshDeref                                  = { fg = c.blue },
--    zshTypes                                  = { fg = c.orange },
--    zshVariableDef                            = { fg = c.blue },
--    --  vim
--    vimLet                                    = { fg = c.orange },
--    vimFunction                               = { fg = c.green, bold = true },
--    vimIsCommand                              = { fg = c.fg0 },
--    vimUserFunc                               = { fg = c.green, bold = true },
--    vimFuncName                               = { fg = c.green, bold = true },
--    vimMap                                    = { fg = c.magenta, italic = options.enable_italics },
--    vimNotation                               = { fg = c.cyan },
--    vimMapLhs                                 = { fg = c.green },
--    vimMapRhs                                 = { fg = c.green },
--    vimSetEqual                               = { fg = c.yellow },
--    vimOption                                 = { fg = c.cyan },
--    vimUserAttrbKey                           = { fg = c.yellow },
--    vimUserAttrb                              = { fg = c.green },
--    vimAutoCmdSfxList                         = { fg = c.cyan },
--    vimSynType                                = { fg = c.orange },
--    vimHiBang                                 = { fg = c.orange },
--    vimSet                                    = { fg = c.yellow },
--    vimSetSep                                 = { fg = c.base1 },
--    vimContinue                               = { fg = c.base1 },
--    --Make
--    makeIdent                                 = { fg = c.cyan },
--    makeSpecTarget                            = { fg = c.yellow },
--    makeTarget                                = { fg = c.blue },
--    makeCommands                              = { fg = c.orange },
--    -- Cmake
--    cmakeCommand                              = { fg = c.orange },
--    cmakeKWconfigure_package_config_file      = { fg = c.yellow },
--    cmakeKWwrite_basic_package_version_file   = { fg = c.yellow },
--    cmakeKWExternalProject                    = { fg = c.cyan },
--    cmakeKWadd_compile_definitions            = { fg = c.cyan },
--    cmakeKWadd_compile_options                = { fg = c.cyan },
--    cmakeKWadd_custom_command                 = { fg = c.cyan },
--    cmakeKWadd_custom_target                  = { fg = c.cyan },
--    cmakeKWadd_definitions                    = { fg = c.cyan },
--    cmakeKWadd_dependencies                   = { fg = c.cyan },
--    cmakeKWadd_executable                     = { fg = c.cyan },
--    cmakeKWadd_library                        = { fg = c.cyan },
--    cmakeKWadd_link_options                   = { fg = c.cyan },
--    cmakeKWadd_subdirectory                   = { fg = c.cyan },
--    cmakeKWadd_test                           = { fg = c.cyan },
--    cmakeKWbuild_command                      = { fg = c.cyan },
--    cmakeKWcmake_host_system_information      = { fg = c.cyan },
--    cmakeKWcmake_minimum_required             = { fg = c.cyan },
--    cmakeKWcmake_parse_arguments              = { fg = c.cyan },
--    cmakeKWcmake_policy                       = { fg = c.cyan },
--    cmakeKWconfigure_file                     = { fg = c.cyan },
--    cmakeKWcreate_test_sourcelist             = { fg = c.cyan },
--    cmakeKWctest_build                        = { fg = c.cyan },
--    cmakeKWctest_configure                    = { fg = c.cyan },
--    cmakeKWctest_coverage                     = { fg = c.cyan },
--    cmakeKWctest_memcheck                     = { fg = c.cyan },
--    cmakeKWctest_run_script                   = { fg = c.cyan },
--    cmakeKWctest_start                        = { fg = c.cyan },
--    cmakeKWctest_submit                       = { fg = c.cyan },
--    cmakeKWctest_test                         = { fg = c.cyan },
--    cmakeKWctest_update                       = { fg = c.cyan },
--    cmakeKWctest_upload                       = { fg = c.cyan },
--    cmakeKWdefine_property                    = { fg = c.cyan },
--    cmakeKWdoxygen_add_docs                   = { fg = c.cyan },
--    cmakeKWenable_language                    = { fg = c.cyan },
--    cmakeKWenable_testing                     = { fg = c.cyan },
--    cmakeKWexec_program                       = { fg = c.cyan },
--    cmakeKWexecute_process                    = { fg = c.cyan },
--    cmakeKWexport                             = { fg = c.cyan },
--    cmakeKWexport_library_dependencies        = { fg = c.cyan },
--    cmakeKWfile                               = { fg = c.cyan },
--    cmakeKWfind_file                          = { fg = c.cyan },
--    cmakeKWfind_library                       = { fg = c.cyan },
--    cmakeKWfind_package                       = { fg = c.cyan },
--    cmakeKWfind_path                          = { fg = c.cyan },
--    cmakeKWfind_program                       = { fg = c.cyan },
--    cmakeKWfltk_wrap_ui                       = { fg = c.cyan },
--    cmakeKWforeach                            = { fg = c.cyan },
--    cmakeKWfunction                           = { fg = c.cyan },
--    cmakeKWget_cmake_property                 = { fg = c.cyan },
--    cmakeKWget_directory_property             = { fg = c.cyan },
--    cmakeKWget_filename_component             = { fg = c.cyan },
--    cmakeKWget_property                       = { fg = c.cyan },
--    cmakeKWget_source_file_property           = { fg = c.cyan },
--    cmakeKWget_target_property                = { fg = c.cyan },
--    cmakeKWget_test_property                  = { fg = c.cyan },
--    cmakeKWif                                 = { fg = c.cyan },
--    cmakeKWinclude                            = { fg = c.cyan },
--    cmakeKWinclude_directories                = { fg = c.cyan },
--    cmakeKWinclude_external_msproject         = { fg = c.cyan },
--    cmakeKWinclude_guard                      = { fg = c.cyan },
--    cmakeKWinstall                            = { fg = c.cyan },
--    cmakeKWinstall_files                      = { fg = c.cyan },
--    cmakeKWinstall_programs                   = { fg = c.cyan },
--    cmakeKWinstall_targets                    = { fg = c.cyan },
--    cmakeKWlink_directories                   = { fg = c.cyan },
--    cmakeKWlist                               = { fg = c.cyan },
--    cmakeKWload_cache                         = { fg = c.cyan },
--    cmakeKWload_command                       = { fg = c.cyan },
--    cmakeKWmacro                              = { fg = c.cyan },
--    cmakeKWmark_as_advanced                   = { fg = c.cyan },
--    cmakeKWmath                               = { fg = c.cyan },
--    cmakeKWmessage                            = { fg = c.cyan },
--    cmakeKWoption                             = { fg = c.cyan },
--    cmakeKWproject                            = { fg = c.cyan },
--    cmakeKWqt_wrap_cpp                        = { fg = c.cyan },
--    cmakeKWqt_wrap_ui                         = { fg = c.cyan },
--    cmakeKWremove                             = { fg = c.cyan },
--    cmakeKWseparate_arguments                 = { fg = c.cyan },
--    cmakeKWset                                = { fg = c.cyan },
--    cmakeKWset_directory_properties           = { fg = c.cyan },
--    cmakeKWset_property                       = { fg = c.cyan },
--    cmakeKWset_source_files_properties        = { fg = c.cyan },
--    cmakeKWset_target_properties              = { fg = c.cyan },
--    cmakeKWset_tests_properties               = { fg = c.cyan },
--    cmakeKWsource_group                       = { fg = c.cyan },
--    cmakeKWstring                             = { fg = c.cyan },
--    cmakeKWsubdirs                            = { fg = c.cyan },
--    cmakeKWtarget_compile_definitions         = { fg = c.cyan },
--    cmakeKWtarget_compile_features            = { fg = c.cyan },
--    cmakeKWtarget_compile_options             = { fg = c.cyan },
--    cmakeKWtarget_include_directories         = { fg = c.cyan },
--    cmakeKWtarget_link_directories            = { fg = c.cyan },
--    cmakeKWtarget_link_libraries              = { fg = c.cyan },
--    cmakeKWtarget_link_options                = { fg = c.cyan },
--    cmakeKWtarget_precompile_headers          = { fg = c.cyan },
--    cmakeKWtarget_sources                     = { fg = c.cyan },
--    cmakeKWtry_compile                        = { fg = c.cyan },
--    cmakeKWtry_run                            = { fg = c.cyan },
--    cmakeKWunset                              = { fg = c.cyan },
--    cmakeKWuse_mangled_mesa                   = { fg = c.cyan },
--    cmakeKWvariable_requires                  = { fg = c.cyan },
--    cmakeKWvariable_watch                     = { fg = c.cyan },
--    cmakeKWwrite_file                         = { fg = c.cyan },
--    -- JSON
--    jsonKeyword                               = { fg = c.orange },
--    jsonQuote                                 = { fg = c.base1 },
--    jsonBraces                                = { fg = c.fg0 },
--    -- Yaml
--    yamlKey                                   = { fg = c.orange },
--    yamlConstant                              = { fg = c.magenta },
--    -- toml
--    tomlKey                                   = { fg = c.orange },
--    tomlBoolean                               = { fg = c.cyan },
--    tomlTableArray                            = { link = "tomlTable" },
  }

  theme.defer = {}

  if options.hide_inactive_statusline then
    local inactive = { underline = true, bg = c.none, fg = c.bg, sp = c.border }

    -- StatusLineNC
    theme.highlights.StatusLineNC = inactive

    -- LuaLine
    for _, section in ipairs({ "a", "b", "c" }) do
      theme.defer["lualine_" .. section .. "_inactive"] = inactive
    end
    -- mini.statusline
    theme.highlights.MiniStatuslineInactive = inactive
  end

  options.on_highlights(theme.highlights, theme.colors)

  return theme
end

return M
