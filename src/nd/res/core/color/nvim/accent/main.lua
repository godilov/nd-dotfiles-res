local tab_lib    = require 'nd.lib.core.tab'
local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'
local color_lib  = require 'nd.lib.core.color'

local clone_with = tab_lib.clone_with

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.accent.main'

local as_hex     = color_lib.rgb.as_hex
local from_hex   = color_lib.rgb.from_hex

--
-- Group = { fg, bg, sp, gui, link }
--

return function(config)
    local palette = config.palette

    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type table')

    local none = 'NONE'

    local diag = {
        error = { palette.red.normal, none, none, none },
        warn  = { palette.yellow.normal, none, none, none },
        info  = { palette.green.normal, none, none, none },
        hint  = { palette.fg.normal, none, none, none },
    }

    local note = {
        error = clone_with(diag.error, { [5] = 'reverse' }),
        warn  = clone_with(diag.warn, { [5] = 'reverse' }),
        info  = clone_with(diag.info, { [5] = 'reverse' }),
        todo  = clone_with(diag.todo, { [5] = 'reverse' }),
    }

    return {
        comment = { as_hex(0.5 * from_hex(palette.fg.normal)), none, none, none },

        syntax = {
            types          = { none, none, none, none },
            fields         = { none, none, none, none },
            functions      = { none, none, none, none },
            namespaces     = { none, none, none, none },
            identifiers    = { none, none, none, none },
            consts_builtin = { none, none, none, none },
            consts_esc     = { none, none, none, none },
            consts         = { none, none, none, none },
            preproc        = { none, none, none, none },
            keywords       = { none, none, none, none },
            keywords_cond  = { none, none, none, none },
            operators      = { none, none, none, none },
            delimiters     = { none, none, none, none },
        },

        diag = diag,
        note = note,
    }
end
