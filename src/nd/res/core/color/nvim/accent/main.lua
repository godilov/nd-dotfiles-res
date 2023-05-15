local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.accent.main'

--
-- Group = { fg, bg, sp, gui, link }
--

return function(config)
    local palette = config.palette

    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type table')

    local none = 'NONE'

    local diag = {
        error = { none, none, none, none },
        warn  = { none, none, none, none },
        info  = { none, none, none, none },
        hint  = { none, none, none, none },
    }

    local note = {
        error = { none, none, none, none },
        warn  = { none, none, none, none },
        info  = { none, none, none, none },
        todo  = { none, none, none, none },
    }

    return {
        comment = { none, none, none, none },

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
