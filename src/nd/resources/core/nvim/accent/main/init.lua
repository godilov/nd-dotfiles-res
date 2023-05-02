local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.nvim.accent.main'

return function(palette)
    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type table')

    local diag = {
        error = {},
        warn  = {},
        info  = {},
        hint  = {},
    }

    local note = {
        error = {},
        warn  = {},
        info  = {},
        todo  = {},
    }

    return {
        comment = {},

        syntax = {
            types          = {},
            fields         = {},
            functions      = {},
            namespaces     = {},
            identifiers    = {},
            consts_builtin = {},
            consts_esc     = {},
            consts         = {},
            preproc        = {},
            keywords       = {},
            keywords_cond  = {},
            operators      = {},
            delimiters     = {},
        },

        diag = diag,
        note = note,
    }
end
