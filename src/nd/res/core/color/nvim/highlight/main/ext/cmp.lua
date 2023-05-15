local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.cmp'

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
        -- cmp-highlight
        -- prefix: Cmp

        { 'CmpDocumentation',       palette.red.normal, none, none, none },
        { 'CmpDocumentationBorder', palette.red.normal, none, none, none },

        -- { 'CmpItemAbbr',              none,                none, none, none },
        -- { 'CmpItemAbbrDeprecated',    none,                none, none, none },
        -- { 'CmpItemAbbrMatch',         none,                none, none, none },
        -- { 'CmpItemAbbrMatchFuzzy',    none,                none, none, none },

        -- { 'CmpItemKindDefault',       none,                none, none, none },
        -- { 'CmpItemMenu',              none,                none, none, none },

        -- { 'CmpItemKindKeyword',       none,                none, none, none },

        -- { 'CmpItemKindVariable',      none,                none, none, none },
        -- { 'CmpItemKindConstant',      none,                none, none, none },
        -- { 'CmpItemKindReference',     none,                none, none, none },
        -- { 'CmpItemKindValue',         none,                none, none, none },

        -- { 'CmpItemKindFunction',      none,                none, none, none },
        -- { 'CmpItemKindMethod',        none,                none, none, none },
        -- { 'CmpItemKindConstructor',   none,                none, none, none },
        -- { 'CmpItemKindInterface',     none,                none, none, none },
        -- { 'CmpItemKindEvent',         none,                none, none, none },
        -- { 'CmpItemKindEnum',          none,                none, none, none },
        -- { 'CmpItemKindUnit',          none,                none, none, none },

        -- { 'CmpItemKindClass',         none,                none, none, none },
        -- { 'CmpItemKindStruct',        none,                none, none, none },

        -- { 'CmpItemKindModule',        none,                none, none, none },

        -- { 'CmpItemKindProperty',      none,                none, none, none },
        -- { 'CmpItemKindField',         none,                none, none, none },
        -- { 'CmpItemKindTypeParameter', none,                none, none, none },
        -- { 'CmpItemKindEnumMember',    none,                none, none, none },
        -- { 'CmpItemKindOperator',      none,                none, none, none },
        -- { 'CmpItemKindSnippet',       none,                none, none, none },
    }
end
