local tab_lib    = require 'nd.lib.core.tab'
local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local clone_with = tab_lib.clone_with

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.editor'

--
-- Group = { fg, bg, sp, gui, link }
--

return function(config)
    local palette = config.palette
    local accent  = config.accent

    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type table')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type table')

    return {
        Normal       = { palette.fg.normal, nil, nil, nil },
        NormalNC     = { palette.fg.normal, nil, nil, nil },
        StatusLine   = { palette.fg.normal, palette.bg.normal, nil, nil },
        StatusLineNC = { palette.bg.normal, palette.bg.normal, nil, nil },

        Cursor       = { nil, nil, nil, nil },
        CursorLine   = { palette.bg.normal, palette.fg.normal, nil, nil },
        CursorColumn = { palette.bg.normal, palette.fg.normal, nil, nil },
        TermCursor   = { palette.bg.normal, palette.fg.normal, nil, nil },
        TermCursorNC = { palette.bg.normal, palette.fg.normal, nil, nil },

        Error        = { palette.red.normal, nil, nil, nil },
        ErrorMsg     = { palette.red.normal, nil, nil, nil },
        WarningMsg   = { palette.yellow.normal, nil, nil, nil },
        MoreMsg      = { palette.green.normal, nil, nil, nil },
        ModeMsg      = { palette.white.light, nil, nil, nil },


        DiagnosticError            = accent.diag.error,
        DiagnosticWarn             = accent.diag.warn,
        DiagnosticInfo             = accent.diag.info,
        DiagnosticHint             = accent.diag.hint,

        DiagnosticVirtualTextError = accent.diag.error,
        DiagnosticVirtualTextWarn  = accent.diag.warn,
        DiagnosticVirtualTextInfo  = accent.diag.info,
        DiagnosticVirtualTextHint  = accent.diag.hint,

        DiagnosticUnderlineError   = clone_with(accent.diag.error, { [4] = 'underline' }),
        DiagnosticUnderlineWarn    = clone_with(accent.diag.warn, { [4] = 'underline' }),
        DiagnosticUnderlineInfo    = clone_with(accent.diag.info, { [4] = 'underline' }),
        DiagnosticUnderlineHint    = clone_with(accent.diag.hint, { [4] = 'underline' }),

        DiagnosticFloatingError    = accent.diag.error,
        DiagnosticFloatingWarn     = accent.diag.warn,
        DiagnosticFloatingInfo     = accent.diag.info,
        DiagnosticFloatingHint     = accent.diag.hint,

        DiagnosticSignError        = accent.diag.error,
        DiagnosticSignWarn         = accent.diag.warn,
        DiagnosticSignInfo         = accent.diag.info,
        DiagnosticSignHint         = accent.diag.hint,


        WinSeparator = { palette.black.light, nil, nil, nil },
        VertSplit    = { palette.black.light, nil, nil, nil },

        SignColumn   = { nil, nil, nil, nil },
        EndOfBuffer  = { palette.yellow.light, nil, nil, nil },

        LineNr       = { palette.yellow.light, nil, nil, nil },
        LineNrAbove  = { palette.yellow.light, nil, nil, nil },
        LineNrBelow  = { palette.yellow.light, nil, nil, nil },

        MatchParen   = { palette.bg.normal, palette.yellow.light, nil, 'reverse' },
        Substitute   = { palette.bg.normal, palette.yellow.normal, nil, nil },
        IncSearch    = { palette.bg.normal, palette.yellow.light, nil, nil },
        Search       = { palette.bg.normal, palette.yellow.normal, nil, nil },
        Visual       = { palette.bg.normal, palette.yellow.light, nil, nil },

        Title        = { palette.red.normal, nil, nil, 'bold' },
        Pmenu        = { palette.fg.normal, palette.bg.normal, nil, nil },
        PmenuSel     = { palette.bg.normal, palette.yellow.light, nil, nil },
        PmenuSbar    = { nil, palette.bg.normal, nil, nil },
        PmenuThumb   = { nil, palette.yellow.light, nil, nil },

        Directory    = { palette.fg.normal, nil, nil, nil },
        DiffAdd      = { palette.green.normal, nil, nil, nil },
        DiffChange   = { palette.yellow.normal, nil, nil, nil },
        DiffDelete   = { palette.red.normal, nil, nil, nil },
        DiffText     = { palette.fg.normal, nil, nil, nil },
    }
end
