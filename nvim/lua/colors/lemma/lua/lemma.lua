local lush = require("lush")
local hsl = lush.hsl

local black = hsl(32, 0, 10)
local white = hsl(0, 0, 80)

local red = hsl(0, 60, 75)
local red_strong = red.saturate(20).darken(20)
local green = hsl(120, 50, 75)
local green_strong = green.saturate(20).darken(20)
local blue = hsl(220, 55, 75)
local blue_strong = blue.saturate(20).darken(20)

local yellow = red.rotate(60)
local yellow_strong = red_strong.rotate(60)
local purple = blue.rotate(60)
local purple_strong = red_strong.rotate(60)

-- local red = hsl(0, 80, 70)
-- local green = hsl(120, 80, 70)
-- local blue = hsl(240, 80, 70)

---@diagnostic disable: undefined-global
return lush(function()
  return {
    Normal       { bg = black, fg = white },
    CursorLine   { bg = Normal.bg.lighten(10) },
    Visual       { bg = CursorLine.bg.lighten(10) },
    Comment      { bg = Normal.bg, fg = Normal.fg, gui = "italic" },
    LineNr       { bg = Normal.bg, fg = Normal.fg.darken(50) },
    -- NormalFloat  { }, -- Normal text in floating windows.
    -- ColorColumn  { }, -- used for the columns set with 'colorcolumn'
    -- Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor       { }, -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    -- Directory    { }, -- directory names (and other special names in listings)
    DiffAdd      { fg = green_strong }, -- diff mode: Added line |diff.txt|
    -- DiffChange   { }, -- diff mode: Changed line |diff.txt|
    DiffDelete   { fg = red_strong }, -- diff mode: Deleted line |diff.txt|
    -- DiffText     { }, -- diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer  { }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    -- ErrorMsg     { }, -- error messages on the command line
    -- VertSplit    { }, -- the column separating vertically split windows
    Folded       { bg = Normal.bg }, -- line used for closed folds
    -- FoldColumn   { }, -- 'foldcolumn'
    SignColumn   { bg = Normal.bg }, -- column where |signs| are displayed
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    MatchParen   { }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg      { }, -- |more-prompt|
    -- NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- NormalNC     { }, -- normal text in non-current windows
    Pmenu        { }, -- Popup menu: normal item.
    -- PmenuSel     { }, -- Popup menu: selected item.
    -- PmenuSbar    { }, -- Popup menu: scrollbar.
    -- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = Normal.fg }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace| 
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise. 
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare    { fg = Normal.fg }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- StatusLine   { }, -- status line of current window
    -- StatusLineNC { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- tab pages line, not active tab page label
    -- TabLineFill  { }, -- tab pages line, where there are no labels
    -- TabLineSel   { }, -- tab pages line, active tab page label
    -- Title        { }, -- titles for output from ":set all", ":autocmd" etc.
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = red_strong }, -- warning messages
    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu     { }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant       { fg = Normal.fg.darken(40) }, -- (preferred) any constant
    -- String         { }, --   a string constant: "this is a string"
    -- Character      { }, --  a character constant: 'c', '\n'
    -- Number         { }, --   a number constant: 234, 0xff
    -- Boolean        { }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10

    Identifier     { fg = Normal.fg },  -- (preferred) any variable name
    Function       { fg = green }, -- function name (also: methods for classes)

    Statement      { fg = red }, -- (preferred) any statement
    -- Conditional    { }, --  if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    -- Operator       { }, -- "sizeof", "+", "*", etc.
    -- Keyword        { }, --  any other keyword
    -- Exception      { }, --  try, catch, throw

    PreProc        { fg = purple }, -- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    Type           { fg = blue }, -- (preferred) int, long, char, etc.
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

    Special        { fg = yellow }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    Delimiter      { fg = Normal.fg }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold       { gui = "bold" },
    Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    -- Error          { }, -- (preferred) any erroneous construct

    Todo { fg = red_strong, gui = "bold" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client. Some other LSP clients may use
    -- these groups, or use their own. Consult your LSP client's documentation.

    -- LspDiagnosticsError               { }, -- used for "Error" diagnostic virtual text
    -- LspDiagnosticsErrorSign           { }, -- used for "Error" diagnostic signs in sign column
    -- LspDiagnosticsErrorFloating       { }, -- used for "Error" diagnostic messages in the diagnostics float
    -- LspDiagnosticsWarning             { }, -- used for "Warning" diagnostic virtual text
    -- LspDiagnosticsWarningSign         { }, -- used for "Warning" diagnostic signs in sign column
    -- LspDiagnosticsWarningFloating     { }, -- used for "Warning" diagnostic messages in the diagnostics float
    -- LspDiagnosticsInformation         { }, -- used for "Information" diagnostic virtual text
    -- LspDiagnosticsInformationSign     { }, -- used for "Information" signs in sign column
    -- LspDiagnosticsInformationFloating { }, -- used for "Information" diagnostic messages in the diagnostics float
    -- LspDiagnosticsHint                { }, -- used for "Hint" diagnostic virtual text
    -- LspDiagnosticsHintSign            { }, -- used for "Hint" diagnostic signs in sign column
    -- LspDiagnosticsHintFloating        { }, -- used for "Hint" diagnostic messages in the diagnostics float
    -- LspReferenceText                  { }, -- used for highlighting "text" references
    -- LspReferenceRead                  { }, -- used for highlighting "read" references
    -- LspReferenceWrite                 { }, -- used for highlighting "write" references

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSError              { }, -- For syntax/parser errors.
    TSPunctDelimiter     { fg = Constant.fg }, -- For delimiters ie: `.`
    TSPunctBracket       { fg = Constant.fg }, -- For brackets and parens.
    TSPunctSpecial       { fg = Constant.fg }, -- For special punctutation that does not fall in the catagories before.
    TSConstant           { fg = Constant.fg }, -- For constants
    TSConstBuiltin       { fg = Constant.fg }, -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro         { fg = Constant.fg }, -- For constants that are defined by macros: `NULL` in C.
    TSString             { fg = Constant.fg }, -- For strings.
    TSStringRegex        { fg = Constant.fg }, -- For regexes.
    TSStringEscape       { fg = Constant.fg }, -- For escape characters within a string.
    TSCharacter          { fg = Constant.fg }, -- For characters.
    TSNumber             { fg = Constant.fg }, -- For integers.
    TSBoolean            { fg = Constant.fg }, -- For booleans.
    TSFloat              { fg = Constant.fg }, -- For floats.
    TSFunction           { fg = Function.fg }, -- For function (calls and definitions).
    TSFuncBuiltin        { fg = Function.fg }, -- For builtin functions: `table.insert` in Lua.
    TSFuncMacro          { fg = Function.fg }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSParameter          { fg = Normal.fg }, -- For parameters of a function.
    TSParameterReference { fg = Normal.fg }, -- For references to parameters of a function.
    TSMethod             { fg = Function.fg }, -- For method calls and definitions.
    TSField              { fg = Normal.fg }, -- For fields.
    TSProperty           { fg = Normal.fg }, -- Same as `TSField`.
    TSConstructor        { fg = Function.fg }, -- For constructor calls and definitions: `{ }` in Lua, and Java constructors.
    TSConditional        { fg = Statement.fg }, -- For keywords related to conditionnals.
    TSRepeat             { fg = Statement.fg }, -- For keywords related to loops.
    TSLabel              { fg = Statement.fg }, -- For labels: `label:` in C and `:label:` in Lua.
    TSOperator           { fg = Statement.fg }, -- For any operator: `+`, but also `->` and `*` in C.
    TSKeyword            { fg = Statement.fg }, -- For keywords that don't fall in previous categories.
    TSKeywordFunction    { fg = Statement.fg }, -- For keywords used to define a fuction.
    TSException          { fg = Statement.fg }, -- For exception related keywords.
    TSType               { fg = Type.fg }, -- For types.
    TSTypeBuiltin        { fg = Type.fg }, -- For builtin types (you guessed it, right ?).
    TSNamespace          { fg = Normal.fg }, -- For identifiers referring to modules and namespaces.
    TSInclude            { fg = Normal.fg }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSAnnotation         { fg = Normal.fg }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSText               { fg = Normal.fg }, -- For strings considered text in a markup language.
    -- TSStrong             { }, -- For text to be represented with strong.
    -- TSEmphasis           { }, -- For text to be represented with emphasis.
    -- TSUnderline          { }, -- For text to be represented with an underline.
    -- TSTitle              { }, -- Text that is part of a title.
    -- TSLiteral            { }, -- Literal text.
    -- TSURI                { }, -- Any URI like a link or email.
    -- TSVariable           { }, -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { }, -- Variable names that are defined by the languages, like `this` or `self`.
  }
end)
