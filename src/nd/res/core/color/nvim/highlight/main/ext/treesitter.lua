local tab_lib    = require 'nd.lib.core.tab'
local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local concat     = tab_lib.concat

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.treesitter'

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
        -- Misc

        concat { { '@comment' }, accent.comment },
        { '@debug',                  palette.red.normal,    none, none, none },
        { '@error',                  palette.red.normal,    none, none, none },
        { '@punctuation',            palette.yellow.light,  none, none, none },
        { '@punctuation.delimiter',  palette.yellow.light,  none, none, none },
        { '@punctuation.bracket',    palette.yellow.light,  none, none, none },
        { '@punctuation.special',    palette.yellow.light,  none, none, none },

        -- Constants

        { '@constant',               palette.fg.normal,     none, none, 'underline' },
        { '@constant.builtin',       palette.cyan.light,    none, none, none },
        { '@constant.macro',         palette.cyan.light,    none, none, none },
        { '@string',                 palette.green.normal,  none, none, none },
        { '@string.regex',           palette.blue.light,    none, none, none },
        { '@string.escape',          palette.blue.light,    none, none, none },
        { '@string.special',         palette.blue.light,    none, none, none },
        { '@character',              palette.green.normal,  none, none, none },
        { '@character.special',      palette.green.normal,  none, none, none },
        { '@number',                 palette.green.normal,  none, none, none },
        { '@boolean',                palette.green.normal,  none, none, none },
        { '@float',                  palette.green.normal,  none, none, none },

        -- Functions

        { '@function',               palette.red.normal,    none, none, none },
        { '@function.call',          palette.red.normal,    none, none, none },
        { '@function.builtin',       palette.red.normal,    none, none, none },
        { '@function.macro',         palette.red.normal,    none, none, none },
        { '@parameter',              palette.fg.normal,     none, none, none },
        { '@method',                 palette.red.normal,    none, none, none },
        { '@method.call',            palette.red.normal,    none, none, none },
        { '@field',                  palette.yellow.normal, none, none, none },
        { '@property',               palette.yellow.normal, none, none, none },
        { '@constructor',            palette.yellow.light,  none, none, none },

        -- Keywords

        { '@conditional',            palette.blue.light,    none, none, none },
        { '@repeat',                 palette.blue.light,    none, none, none },
        { '@label',                  palette.blue.light,    none, none, none },
        { '@keyword',                palette.yellow.light,  none, none, none },
        { '@keyword.function',       palette.yellow.light,  none, none, none },
        { '@keyword.operator',       palette.yellow.light,  none, none, none },
        { '@keyword.return',         palette.yellow.light,  none, none, none },
        { '@operator',               palette.fg.normal,     none, none, none },
        { '@exception',              palette.blue.light,    none, none, none },
        { '@preproc',                palette.red.light,     none, none, none },
        { '@include',                palette.red.light,     none, none, none },
        { '@define',                 palette.red.light,     none, none, none },
        { '@macro',                  palette.red.light,     none, none, none },
        { '@type',                   palette.yellow.normal, none, none, none },
        { '@type.builtin',           palette.yellow.normal, none, none, none },
        { '@type.definition',        palette.yellow.normal, none, none, none },
        { '@type.qualifier',         palette.yellow.normal, none, none, none },
        { '@storageclass',           palette.yellow.light,  none, none, none },
        { '@namespace',              palette.yellow.light,  none, none, none },
        { '@symbol',                 palette.yellow.light,  none, none, none },
        { '@attribute',              palette.yellow.light,  none, none, none },

        -- Variables

        { '@variable',               palette.fg.normal,     none, none, none },
        { '@variable.builtin',       palette.fg.normal,     none, none, none },

        -- Text

        { '@text',                   palette.fg.normal,     none, none, none },
        { '@text.strong',            palette.fg.normal,     none, none, 'bold' },
        { '@text.emphasis',          palette.fg.normal,     none, none, 'italic' },
        { '@text.underline',         palette.fg.normal,     none, none, 'underline' },
        { '@text.strike',            palette.fg.normal,     none, none, 'strikethrough' },
        { '@text.title',             palette.red.normal,    none, none, 'bold' },
        { '@text.literal',           palette.red.normal,    none, none, none },
        { '@text.uri',               palette.blue.normal,   none, none, 'underline' },
        { '@text.math',              palette.yellow.normal, none, none, none },
        { '@text.environment',       palette.cyan.normal,   none, none, none },
        { '@text.environmentName',   palette.cyan.normal,   none, none, none },
        { '@text.reference',         palette.blue.normal,   none, none, none },
        { '@text.note',              palette.green.normal,  none, none, 'reverse' },
        { '@text.warning',           palette.yellow.normal, none, none, 'reverse' },
        { '@text.danger',            palette.red.normal,    none, none, 'reverse' },
        { '@todo',                   palette.blue.normal,   none, none, 'reverse' },

        -- Tags

        { '@tag',                    palette.yellow.normal, none, none, none },
        { '@tag.attribute',          palette.red.normal,    none, none, none },
        { '@tag.delimiter',          palette.yellow.normal, none, none, none },

        -- Lsp

        { '@lsp.type.comment',       none,                  none, none, none },
        { '@lsp.type.variable',      none,                  none, none, none },
        { '@lsp.type.property',      none,                  none, none, none },
        { '@lsp.type.parameter',     none,                  none, none, none },
        { '@lsp.type.function',      none,                  none, none, none },
        { '@lsp.type.macro',         none,                  none, none, none },
        { '@lsp.type.enum',          none,                  none, none, none },
        { '@lsp.type.enumMember',    none,                  none, none, none },
        { '@lsp.type.type',          none,                  none, none, none },
        { '@lsp.type.typeParameter', none,                  none, none, none },
        { '@lsp.type.struct',        none,                  none, none, none },
        { '@lsp.type.class',         none,                  none, none, none },
        { '@lsp.type.method',        none,                  none, none, none },
        { '@lsp.type.namespace',     none,                  none, none, none },
        { '@lsp.type.interface',     none,                  none, none, none },
        { '@lsp.type.decorator',     none,                  none, none, none },
    }
end
