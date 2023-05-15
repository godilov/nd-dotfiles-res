local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.syntax'

--
-- Group = { fg, bg, sp, gui, link }
--

return function(config)
    local palette = config.palette
    local accent  = config.accent

    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type table')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type table')

    return {
        Error          = { palette.red.normal, nil, nil, 'reverse' },

        Comment        = accent.comment,
        Constant       = { palette.green.normal, nil, nil, nil },
        String         = { palette.green.normal, nil, nil, nil },
        Character      = { palette.green.normal, nil, nil, nil },
        Number         = { palette.green.normal, nil, nil, nil },
        Float          = { palette.green.normal, nil, nil, nil },
        Boolean        = { palette.green.normal, nil, nil, nil },

        Identifier     = { palette.fg.normal, nil, nil, nil },
        Function       = { palette.red.normal, nil, nil, nil },

        Statement      = { palette.yellow.light, nil, nil, nil },
        Conditional    = { palette.blue.light, nil, nil, nil },
        Repeat         = { palette.blue.light, nil, nil, nil },
        Label          = { palette.blue.light, nil, nil, nil },
        Operator       = { palette.fg.normal, nil, nil, nil },
        Keyword        = { palette.yellow.light, nil, nil, nil },
        Exception      = { palette.blue.light, nil, nil, nil },

        PreProc        = { palette.red.light, nil, nil, nil },
        PreCondit      = { palette.red.light, nil, nil, nil },
        Include        = { palette.red.light, nil, nil, nil },
        Define         = { palette.red.light, nil, nil, nil },
        Macro          = { palette.red.light, nil, nil, nil },

        Type           = { palette.yellow.normal, nil, nil, nil },
        StorageClass   = { palette.yellow.normal, nil, nil, nil },
        Structure      = { palette.yellow.normal, nil, nil, nil },
        Typedef        = { palette.yellow.normal, nil, nil, nil },

        Tag            = { palette.yellow.light, nil, nil, 'bold' },
        Special        = { palette.yellow.light, nil, nil, nil },
        SpecialChar    = { palette.yellow.light, nil, nil, nil },
        SpecialComment = { palette.yellow.light, nil, nil, nil },
        Delimiter      = { palette.yellow.light, nil, nil, 'bold' },
        Debug          = { palette.red.normal, nil, nil, nil },

        Todo           = { palette.blue.normal, nil, nil, 'reverse' },
        Bold           = { palette.fg.normal, nil, nil, 'bold' },
        Italic         = { palette.fg.normal, nil, nil, 'italic' },
        Underlined     = { palette.fg.normal, nil, nil, 'underline' },
    }
end
