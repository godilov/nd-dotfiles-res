local tab_lib    = require 'nd.lib.core.tab'
local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local merge      = tab_lib.merge

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.color.nvim.highlight.main.ext.editor'

return function(config)
    local palette = config.palette
    local accent  = config.accent

    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type table')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type table')

    return {
        Normal       = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil },
        NormalNC     = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil },
        StatusLine   = { fg = palette.fg.normal, bg = palette.bg.normal, sp = nil, link = nil },
        StatusLineNC = { fg = palette.bg.normal, bg = palette.bg.normal, sp = nil, link = nil },

        Cursor       = { fg = nil, bg = nil, sp = nil, link = nil },
        CursorLine   = { fg = palette.bg.normal, bg = palette.fg.normal, sp = nil, link = nil },
        CursorColumn = { fg = palette.bg.normal, bg = palette.fg.normal, sp = nil, link = nil },
        TermCursor   = { fg = palette.bg.normal, bg = palette.fg.normal, sp = nil, link = nil },
        TermCursorNC = { fg = palette.bg.normal, bg = palette.fg.normal, sp = nil, link = nil },

        Error        = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },
        ErrorMsg     = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },
        WarningMsg   = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },
        MoreMsg      = { fg = palette.green.normal, bg = nil, sp = nil, link = nil },
        ModeMsg      = { fg = palette.white.light, bg = nil, sp = nil, link = nil },


        DiagnosticError            = accent.diag.error,
        DiagnosticWarn             = accent.diag.warn,
        DiagnosticInfo             = accent.diag.info,
        DiagnosticHint             = accent.diag.hint,

        DiagnosticVirtualTextError = accent.diag.error,
        DiagnosticVirtualTextWarn  = accent.diag.warn,
        DiagnosticVirtualTextInfo  = accent.diag.info,
        DiagnosticVirtualTextHint  = accent.diag.hint,

        DiagnosticUnderlineError   = merge { accent.diag.error, { underline = true } },
        DiagnosticUnderlineWarn    = merge { accent.diag.warn, { underline = true } },
        DiagnosticUnderlineInfo    = merge { accent.diag.info, { underline = true } },
        DiagnosticUnderlineHint    = merge { accent.diag.hint, { underline = true } },

        DiagnosticFloatingError    = accent.diag.error,
        DiagnosticFloatingWarn     = accent.diag.warn,
        DiagnosticFloatingInfo     = accent.diag.info,
        DiagnosticFloatingHint     = accent.diag.hint,

        DiagnosticSignError        = accent.diag.error,
        DiagnosticSignWarn         = accent.diag.warn,
        DiagnosticSignInfo         = accent.diag.info,
        DiagnosticSignHint         = accent.diag.hint,


        WinSeparator = { fg = palette.black.light, bg = nil, sp = nil, link = nil },
        VertSplit    = { fg = palette.black.light, bg = nil, sp = nil, link = nil },

        SignColumn   = { fg = nil, bg = nil, sp = nil, link = nil },
        EndOfBuffer  = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },

        LineNr       = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        LineNrAbove  = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        LineNrBelow  = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },

        MatchParen   = {
            fg = palette.bg.normal,
            bg = palette.yellow.light,
            sp = nil,
            link = nil,
            reverse = true,
        },
        Substitute   = { fg = palette.bg.normal, bg = palette.yellow.normal, sp = nil, link = nil },
        IncSearch    = { fg = palette.bg.normal, bg = palette.yellow.light, sp = nil, link = nil },
        Search       = { fg = palette.bg.normal, bg = palette.yellow.normal, sp = nil, link = nil },
        Visual       = { fg = palette.bg.normal, bg = palette.yellow.light, sp = nil, link = nil },

        Title        = { fg = palette.red.normal, bg = nil, sp = nil, link = nil, bold = true },
        Pmenu        = { fg = palette.fg.normal, bg = palette.bg.normal, sp = nil, link = nil },
        PmenuSel     = { fg = palette.bg.normal, bg = palette.yellow.light, sp = nil, link = nil },
        PmenuSbar    = { fg = nil, bg = palette.bg.normal, sp = nil, link = nil },
        PmenuThumb   = { fg = nil, bg = palette.yellow.light, sp = nil, link = nil },

        Directory    = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil },
        DiffAdd      = { fg = palette.green.normal, bg = nil, sp = nil, link = nil },
        DiffChange   = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },
        DiffDelete   = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },
        DiffText     = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil },
    }
end
