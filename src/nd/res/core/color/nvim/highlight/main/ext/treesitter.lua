local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.treesitter'

--
-- Group = { fg, bg, sp, gui, link }
--

return function(config)
    local palette = config.palette
    local accent  = config.accent

    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type table')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type table')

    return {
        -- github: CONTRIBUTE.md


        -- Misc


        ['@comment']               = accent.comment,
        ['@debug']                 = { palette.red.normal, nil, nil, nil },
        ['@error']                 = { palette.red.normal, nil, nil, nil },
        ['@punctuation']           = { palette.yellow.light, nil, nil, nil },
        ['@punctuation.delimiter'] = { palette.yellow.light, nil, nil, nil },
        ['@punctuation.bracket']   = { palette.yellow.light, nil, nil, nil },
        ['@punctuation.special']   = { palette.yellow.light, nil, nil, nil },


        -- Constants


        ['@constant']          = { palette.fg.normal, nil, nil, 'underline' },
        ['@constant.builtin']  = { palette.cyan.light, nil, nil, nil },
        ['@constant.macro']    = { palette.cyan.light, nil, nil, nil },
        ['@string']            = { palette.green.normal, nil, nil, nil },
        ['@string.regex']      = { palette.blue.light, nil, nil, nil },
        ['@string.escape']     = { palette.blue.light, nil, nil, nil },
        ['@string.special']    = { palette.blue.light, nil, nil, nil },
        ['@character']         = { palette.green.normal, nil, nil, nil },
        ['@character.special'] = { palette.green.normal, nil, nil, nil },
        ['@number']            = { palette.green.normal, nil, nil, nil },
        ['@boolean']           = { palette.green.normal, nil, nil, nil },
        ['@float']             = { palette.green.normal, nil, nil, nil },


        -- Functions


        ['@function']         = { palette.red.normal, nil, nil, nil },
        ['@function.call']    = { palette.red.normal, nil, nil, nil },
        ['@function.builtin'] = { palette.red.normal, nil, nil, nil },
        ['@function.macro']   = { palette.red.normal, nil, nil, nil },
        ['@parameter']        = { palette.fg.normal, nil, nil, nil },
        ['@method']           = { palette.red.normal, nil, nil, nil },
        ['@method.call']      = { palette.red.normal, nil, nil, nil },
        ['@field']            = { palette.yellow.normal, nil, nil, nil },
        ['@property']         = { palette.yellow.normal, nil, nil, nil },
        ['@constructor']      = { palette.yellow.light, nil, nil, nil },


        -- Keywords


        ['@conditional']      = { palette.blue.light, nil, nil, nil },
        ['@repeat']           = { palette.blue.light, nil, nil, nil },
        ['@label']            = { palette.blue.light, nil, nil, nil },
        ['@keyword']          = { palette.yellow.light, nil, nil, nil },
        ['@keyword.function'] = { palette.yellow.light, nil, nil, nil },
        ['@keyword.operator'] = { palette.yellow.light, nil, nil, nil },
        ['@keyword.return']   = { palette.yellow.light, nil, nil, nil },
        ['@operator']         = { palette.fg.normal, nil, nil, nil },
        ['@exception']        = { palette.blue.light, nil, nil, nil },
        ['@preproc']          = { palette.red.light, nil, nil, nil },
        ['@include']          = { palette.red.light, nil, nil, nil },
        ['@define']           = { palette.red.light, nil, nil, nil },
        ['@macro']            = { palette.red.light, nil, nil, nil },
        ['@type']             = { palette.yellow.normal, nil, nil, nil },
        ['@type.builtin']     = { palette.yellow.normal, nil, nil, nil },
        ['@type.definition']  = { palette.yellow.normal, nil, nil, nil },
        ['@type.qualifier']   = { palette.yellow.normal, nil, nil, nil },
        ['@storageclass']     = { palette.yellow.light, nil, nil, nil },
        ['@namespace']        = { palette.yellow.light, nil, nil, nil },
        ['@symbol']           = { palette.yellow.light, nil, nil, nil },
        ['@attribute']        = { palette.yellow.light, nil, nil, nil },


        -- Variables


        ['@variable']         = { palette.fg.normal, nil, nil, nil },
        ['@variable.builtin'] = { palette.fg.normal, nil, nil, nil },



        -- Text


        ['@text']                 = { palette.fg.normal, nil, nil, nil },
        ['@text.strong']          = { palette.fg.normal, nil, nil, 'bold' },
        ['@text.emphasis']        = { palette.fg.normal, nil, nil, 'italic' },
        ['@text.underline']       = { palette.fg.normal, nil, nil, 'underline' },
        ['@text.strike']          = { palette.fg.normal, nil, nil, 'strikethrough' },
        ['@text.title']           = { palette.red.normal, nil, nil, 'bold' },
        ['@text.literal']         = { palette.red.normal, nil, nil, nil },
        ['@text.uri']             = { palette.blue.normal, nil, nil, 'underline' },
        ['@text.math']            = { palette.yellow.normal, nil, nil, nil },
        ['@text.environment']     = { palette.cyan.normal, nil, nil, nil },
        ['@text.environmentName'] = { palette.cyan.normal, nil, nil, nil },
        ['@text.reference']       = { palette.blue.normal, nil, nil, nil },
        ['@text.note']            = { palette.green.normal, nil, nil, 'reverse' },
        ['@text.warning']         = { palette.yellow.normal, nil, nil, 'reverse' },
        ['@text.danger']          = { palette.red.normal, nil, nil, 'reverse' },
        ['@todo']                 = { palette.blue.normal, nil, nil, 'reverse' },


        -- Tags


        ['@tag']           = { palette.yellow.normal, nil, nil, nil },
        ['@tag.attribute'] = { palette.red.normal, nil, nil, nil },
        ['@tag.delimiter'] = { palette.yellow.normal, nil, nil, nil },


        -- Lsp


        ['@lsp.type.comment']       = { nil, nil, nil, nil },
        ['@lsp.type.variable']      = { nil, nil, nil, nil },
        ['@lsp.type.property']      = { nil, nil, nil, nil },
        ['@lsp.type.parameter']     = { nil, nil, nil, nil },
        ['@lsp.type.function']      = { nil, nil, nil, nil },
        ['@lsp.type.macro']         = { nil, nil, nil, nil },
        ['@lsp.type.enum']          = { nil, nil, nil, nil },
        ['@lsp.type.enumMember']    = { nil, nil, nil, nil },
        ['@lsp.type.type']          = { nil, nil, nil, nil },
        ['@lsp.type.typeParameter'] = { nil, nil, nil, nil },
        ['@lsp.type.struct']        = { nil, nil, nil, nil },
        ['@lsp.type.class']         = { nil, nil, nil, nil },
        ['@lsp.type.method']        = { nil, nil, nil, nil },
        ['@lsp.type.namespace']     = { nil, nil, nil, nil },
        ['@lsp.type.interface']     = { nil, nil, nil, nil },
        ['@lsp.type.decorator']     = { nil, nil, nil, nil },
    }
end
