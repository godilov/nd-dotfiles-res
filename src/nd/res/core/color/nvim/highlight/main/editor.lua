local tab_lib    = require 'nd.lib.core.tab'
local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local concat     = tab_lib.concat
local clone_with = tab_lib.clone_with

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.editor'

--
-- Group = { hl, fg, bg, sp, gui, link }
--

return function(config)
    local palette = config.palette
    local accent  = config.accent

    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type table')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type table')

    local none = 'NONE'

    return {
        { 'Normal',       palette.fg.normal,     none,              none, none },
        { 'NormalNC',     palette.fg.normal,     none,              none, none },
        { 'StatusLine',   palette.fg.normal,     palette.bg.normal, none, none },
        { 'StatusLineNC', palette.bg.normal,     palette.bg.normal, none, none },
        --
        { 'Cursor',       none,                  none,              none, none },
        { 'CursorLine',   palette.bg.normal,     palette.fg.normal, none, none },
        { 'CursorColumn', palette.bg.normal,     palette.fg.normal, none, none },
        { 'TermCursor',   palette.bg.normal,     palette.fg.normal, none, none },
        { 'TermCursorNC', palette.bg.normal,     palette.fg.normal, none, none },
        --
        { 'Error',        palette.red.normal,    none,              none, none },
        { 'ErrorMsg',     palette.red.normal,    none,              none, none },
        { 'WarningMsg',   palette.yellow.normal, none,              none, none },
        { 'MoreMsg',      palette.green.normal,  none,              none, none },
        { 'ModeMsg',      palette.white.light,   none,              none, none },
        --
        concat { { 'DiagnosticError' }, accent.diag.error },
        concat { { 'DiagnosticWarn' }, accent.diag.warn },
        concat { { 'DiagnosticInfo' }, accent.diag.info },
        concat { { 'DiagnosticHint' }, accent.diag.hint },
        --
        concat { { 'DiagnosticVirtualTextError' }, accent.diag.error },
        concat { { 'DiagnosticVirtualTextWarn' }, accent.diag.warn },
        concat { { 'DiagnosticVirtualTextInfo' }, accent.diag.info },
        concat { { 'DiagnosticVirtualTextHint' }, accent.diag.hint },
        --
        clone_with(concat { { 'DiagnosticUnderlineError' }, accent.diag.error }, { [5] = 'underline' }),
        clone_with(concat { { 'DiagnosticUnderlineWarn' }, accent.diag.warn }, { [5] = 'underline' }),
        clone_with(concat { { 'DiagnosticUnderlineInfo' }, accent.diag.info }, { [5] = 'underline' }),
        clone_with(concat { { 'DiagnosticUnderlineHint' }, accent.diag.hint }, { [5] = 'underline' }),
        --
        concat { { 'DiagnosticFloatingError' }, accent.diag.error },
        concat { { 'DiagnosticFloatingWarn' }, accent.diag.warn },
        concat { { 'DiagnosticFloatingInfo' }, accent.diag.info },
        concat { { 'DiagnosticFloatingHint' }, accent.diag.hint },
        --
        concat { { 'DiagnosticSignError' }, accent.diag.error },
        concat { { 'DiagnosticSignWarn' }, accent.diag.warn },
        concat { { 'DiagnosticSignInfo' }, accent.diag.info },
        concat { { 'DiagnosticSignHint' }, accent.diag.hint },
        --
        { 'WinSeparator', palette.bg.normal,     palette.bg.normal,     none, none },
        { 'EndOfBuffer',  palette.yellow.light,  none,                  none, none },
        { 'SignColumn',   none,                  none,                  none, none },
        --
        { 'LineNr',       palette.yellow.light,  none,                  none, none },
        { 'LineNrAbove',  palette.yellow.light,  none,                  none, none },
        { 'LineNrBelow',  palette.yellow.light,  none,                  none, none },
        --
        { 'MatchParen',   palette.bg.normal,     palette.yellow.light,  none, 'reverse' },
        { 'Substitute',   palette.bg.normal,     palette.yellow.normal, none, none },
        { 'IncSearch',    palette.bg.normal,     palette.yellow.light,  none, none },
        { 'Search',       palette.bg.normal,     palette.yellow.normal, none, none },
        { 'Visual',       palette.bg.normal,     palette.yellow.light,  none, none },
        --
        { 'Title',        palette.red.normal,    none,                  none, 'bold' },
        { 'Pmenu',        palette.fg.normal,     palette.bg.normal,     none, none },
        { 'PmenuSel',     palette.bg.normal,     palette.yellow.light,  none, none },
        { 'PmenuSbar',    none,                  palette.bg.normal,     none, none },
        { 'PmenuThumb',   none,                  palette.yellow.light,  none, none },
        --
        { 'Directory',    palette.fg.normal,     none,                  none, none },
        { 'DiffAdd',      palette.green.normal,  none,                  none, none },
        { 'DiffChange',   palette.yellow.normal, none,                  none, none },
        { 'DiffDelete',   palette.red.normal,    none,                  none, none },
        { 'DiffText',     palette.fg.normal,     none,                  none, none },
    }
end
