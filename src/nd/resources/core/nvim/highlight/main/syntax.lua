local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.nvim.highlight.main.ext.syntax'

return function(palette, accent)
    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type value')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type value')

    return {
        Error          = { fg = palette.red.normal, bg = nil, sp = nil, link = nil, reverse = true },

        Comment        = accent.comment,
        Constant       = { fg = palette.green.normal, bg = nil, sp = nil, link = nil },
        String         = { fg = palette.green.normal, bg = nil, sp = nil, link = nil },
        Character      = { fg = palette.green.normal, bg = nil, sp = nil, link = nil },
        Number         = { fg = palette.green.normal, bg = nil, sp = nil, link = nil },
        Float          = { fg = palette.green.normal, bg = nil, sp = nil, link = nil },
        Boolean        = { fg = palette.green.normal, bg = nil, sp = nil, link = nil },

        Identifier     = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil },
        Function       = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },

        Statement      = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        Conditional    = { fg = palette.blue.light, bg = nil, sp = nil, link = nil },
        Repeat         = { fg = palette.blue.light, bg = nil, sp = nil, link = nil },
        Label          = { fg = palette.blue.light, bg = nil, sp = nil, link = nil },
        Operator       = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil },
        Keyword        = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        Exception      = { fg = palette.blue.light, bg = nil, sp = nil, link = nil },

        PreProc        = { fg = palette.red.light, bg = nil, sp = nil, link = nil },
        PreCondit      = { fg = palette.red.light, bg = nil, sp = nil, link = nil },
        Include        = { fg = palette.red.light, bg = nil, sp = nil, link = nil },
        Define         = { fg = palette.red.light, bg = nil, sp = nil, link = nil },
        Macro          = { fg = palette.red.light, bg = nil, sp = nil, link = nil },

        Type           = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },
        StorageClass   = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },
        Structure      = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },
        Typedef        = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },

        Tag            = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil, bold = true },
        Special        = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        SpecialChar    = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        SpecialComment = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        Delimiter      = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil, bold = true },
        Debug          = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },

        Todo           = { fg = palette.blue.normal, bg = nil, sp = nil, link = nil, reverse = true },
        Bold           = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil, bold = true },
        Italic         = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil, italic = true },
        Underlined     = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil, underline = true },
    }
end
