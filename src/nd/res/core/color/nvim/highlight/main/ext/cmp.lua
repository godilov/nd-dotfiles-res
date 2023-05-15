local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.cmp'

--
-- Group = { fg, bg, sp, gui, link }
--

return function(config)
    local palette = config.palette
    local accent  = config.accent

    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type table')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type table')

    return {
        -- cmp-highlight
        -- prefix: Cmp

        CmpDocumentation       = { palette.red.normal, nil, nil, nil },
        CmpDocumentationBorder = { palette.red.normal, nil, nil, nil },

        -- CmpItemAbbr           = { nil, nil, nil, nil },
        -- CmpItemAbbrDeprecated = { nil, nil, nil, nil },
        -- CmpItemAbbrMatch      = { nil, nil, nil, nil },
        -- CmpItemAbbrMatchFuzzy = { nil, nil, nil, nil },

        -- CmpItemKindDefault = { nil, nil, nil, nil },
        -- CmpItemMenu        = { nil, nil, nil, nil },

        -- CmpItemKindKeyword = { nil, nil, nil, nil },

        -- CmpItemKindVariable  = { nil, nil, nil, nil },
        -- CmpItemKindConstant  = { nil, nil, nil, nil },
        -- CmpItemKindReference = { nil, nil, nil, nil },
        -- CmpItemKindValue     = { nil, nil, nil, nil },

        -- CmpItemKindFunction    = { nil, nil, nil, nil },
        -- CmpItemKindMethod      = { nil, nil, nil, nil },
        -- CmpItemKindConstructor = { nil, nil, nil, nil },

        -- CmpItemKindInterface = { nil, nil, nil, nil },
        -- CmpItemKindEvent     = { nil, nil, nil, nil },
        -- CmpItemKindEnum      = { nil, nil, nil, nil },
        -- CmpItemKindUnit      = { nil, nil, nil, nil },

        -- CmpItemKindClass  = { nil, nil, nil, nil },
        -- CmpItemKindStruct = { nil, nil, nil, nil },

        -- CmpItemKindModule = { nil, nil, nil, nil },

        -- CmpItemKindProperty      = { nil, nil, nil, nil },
        -- CmpItemKindField         = { nil, nil, nil, nil },
        -- CmpItemKindTypeParameter = { nil, nil, nil, nil },
        -- CmpItemKindEnumMember    = { nil, nil, nil, nil },
        -- CmpItemKindOperator      = { nil, nil, nil, nil },
        -- CmpItemKindSnippet       = { nil, nil, nil, nil },
    }
end
