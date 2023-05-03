local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.nvim.highlight.main.ext.treesitter'

return function(palette, accent)
    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type value')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type value')

    return {
        -- github: CONTRIBUTE.md


        -- Misc


        ['@comment']               = accent.comment,
        ['@debug']                 = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },
        ['@error']                 = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },
        ['@punctuation']           = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        ['@punctuation.delimiter'] = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        ['@punctuation.bracket']   = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        ['@punctuation.special']   = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },


        -- Constants


        ['@constant']          = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil, underline = true },
        ['@constant.builtin']  = { fg = palette.cyan.light, bg = nil, sp = nil, link = nil },
        ['@constant.macro']    = { fg = palette.cyan.light, bg = nil, sp = nil, link = nil },
        ['@string']            = { fg = palette.green.normal, bg = nil, sp = nil, link = nil },
        ['@string.regex']      = { fg = palette.blue.light, bg = nil, sp = nil, link = nil },
        ['@string.escape']     = { fg = palette.blue.light, bg = nil, sp = nil, link = nil },
        ['@string.special']    = { fg = palette.blue.light, bg = nil, sp = nil, link = nil },
        ['@character']         = { fg = palette.green.normal, bg = nil, sp = nil, link = nil },
        ['@character.special'] = { fg = palette.green.normal, bg = nil, sp = nil, link = nil },
        ['@number']            = { fg = palette.green.normal, bg = nil, sp = nil, link = nil },
        ['@boolean']           = { fg = palette.green.normal, bg = nil, sp = nil, link = nil },
        ['@float']             = { fg = palette.green.normal, bg = nil, sp = nil, link = nil },


        -- Functions


        ['@function']         = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },
        ['@function.call']    = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },
        ['@function.builtin'] = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },
        ['@function.macro']   = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },
        ['@parameter']        = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil },
        ['@method']           = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },
        ['@method.call']      = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },
        ['@field']            = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },
        ['@property']         = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },
        ['@constructor']      = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },


        -- Keywords


        ['@conditional']      = { fg = palette.blue.light, bg = nil, sp = nil, link = nil },
        ['@repeat']           = { fg = palette.blue.light, bg = nil, sp = nil, link = nil },
        ['@label']            = { fg = palette.blue.light, bg = nil, sp = nil, link = nil },
        ['@keyword']          = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        ['@keyword.function'] = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        ['@keyword.operator'] = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        ['@keyword.return']   = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        ['@operator']         = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil },
        ['@exception']        = { fg = palette.blue.light, bg = nil, sp = nil, link = nil },
        ['@preproc']          = { fg = palette.red.light, bg = nil, sp = nil, link = nil },
        ['@include']          = { fg = palette.red.light, bg = nil, sp = nil, link = nil },
        ['@define']           = { fg = palette.red.light, bg = nil, sp = nil, link = nil },
        ['@macro']            = { fg = palette.red.light, bg = nil, sp = nil, link = nil },
        ['@type']             = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },
        ['@type.builtin']     = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },
        ['@type.definition']  = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },
        ['@type.qualifier']   = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },
        ['@storageclass']     = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        ['@namespace']        = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        ['@symbol']           = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        ['@attribute']        = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },


        -- Variables


        ['@variable']         = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil },
        ['@variable.builtin'] = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil },



        -- Text


        ['@text']                 = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil },
        ['@text.strong']          = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil, bold = true },
        ['@text.emphasis']        = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil, italic = true },
        ['@text.underline']       = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil, underline = true },
        ['@text.strike']          = { fg = palette.fg.normal, bg = nil, sp = nil, link = nil, strikethrough = true },
        ['@text.title']           = { fg = palette.red.normal, bg = nil, sp = nil, link = nil, bold = true },
        ['@text.literal']         = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },
        ['@text.uri']             = { fg = palette.blue.normal, bg = nil, sp = nil, link = nil, underline = true },
        ['@text.math']            = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },
        ['@text.environment']     = { fg = palette.cyan.normal, bg = nil, sp = nil, link = nil },
        ['@text.environmentName'] = { fg = palette.cyan.normal, bg = nil, sp = nil, link = nil },
        ['@text.reference']       = { fg = palette.blue.normal, bg = nil, sp = nil, link = nil },
        ['@text.note']            = { fg = palette.green.normal, bg = nil, sp = nil, link = nil, reverse = true },
        ['@text.warning']         = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil, reverse = true },
        ['@text.danger']          = { fg = palette.red.normal, bg = nil, sp = nil, link = nil, reverse = true },
        ['@todo']                 = { fg = palette.blue.normal, bg = nil, sp = nil, link = nil, reverse = true },


        -- Tags


        ['@tag']           = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },
        ['@tag.attribute'] = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },
        ['@tag.delimiter'] = { fg = palette.yellow.normal, bg = nil, sp = nil, link = nil },


        -- Lsp


        ['@lsp.type.comment']       = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.variable']      = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.property']      = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.parameter']     = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.function']      = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.macro']         = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.enum']          = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.enumMember']    = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.type']          = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.typeParameter'] = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.struct']        = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.class']         = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.method']        = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.namespace']     = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.interface']     = { fg = nil, bg = nil, sp = nil, link = nil },
        ['@lsp.type.decorator']     = { fg = nil, bg = nil, sp = nil, link = nil },
    }
end
