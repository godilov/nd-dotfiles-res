local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.color.nvim.highlight.main.ext.cmp'

return function(palette, accent)
    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type table')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type table')

    return {
        -- cmp-highlight
        -- prefix: Cmp

        CmpDocumentation       = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },
        CmpDocumentationBorder = { fg = palette.red.normal, bg = nil, sp = nil, link = nil },

        -- CmpItemAbbr           = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemAbbrDeprecated = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemAbbrMatch      = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemAbbrMatchFuzzy = { fg = nil, bg = nil, sp = nil, link = nil },

        -- CmpItemKindDefault = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemMenu        = { fg = nil, bg = nil, sp = nil, link = nil },

        -- CmpItemKindKeyword = { fg = nil, bg = nil, sp = nil, link = nil },

        -- CmpItemKindVariable  = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemKindConstant  = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemKindReference = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemKindValue     = { fg = nil, bg = nil, sp = nil, link = nil },

        -- CmpItemKindFunction    = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemKindMethod      = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemKindConstructor = { fg = nil, bg = nil, sp = nil, link = nil },

        -- CmpItemKindInterface = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemKindEvent     = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemKindEnum      = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemKindUnit      = { fg = nil, bg = nil, sp = nil, link = nil },

        -- CmpItemKindClass  = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemKindStruct = { fg = nil, bg = nil, sp = nil, link = nil },

        -- CmpItemKindModule = { fg = nil, bg = nil, sp = nil, link = nil },

        -- CmpItemKindProperty      = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemKindField         = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemKindTypeParameter = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemKindEnumMember    = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemKindOperator      = { fg = nil, bg = nil, sp = nil, link = nil },
        -- CmpItemKindSnippet       = { fg = nil, bg = nil, sp = nil, link = nil },
    }
end
