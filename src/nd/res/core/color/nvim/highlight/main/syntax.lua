local tab_lib    = require 'nd.lib.core.tab'
local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local concat     = tab_lib.concat

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.syntax'

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
        { 'Error',          palette.red.normal,    none, none, 'reverse' },

        concat { { 'Comment' }, accent.comment },

        { 'Constant',       palette.green.normal,  none, none, none },
        { 'String',         palette.green.normal,  none, none, none },
        { 'Character',      palette.green.normal,  none, none, none },
        { 'Number',         palette.green.normal,  none, none, none },
        { 'Float',          palette.green.normal,  none, none, none },
        { 'Boolean',        palette.green.normal,  none, none, none },
        --
        { 'Identifier',     palette.fg.normal,     none, none, none },
        { 'Function',       palette.red.normal,    none, none, none },
        --
        { 'Statement',      palette.yellow.light,  none, none, none },
        { 'Conditional',    palette.blue.light,    none, none, none },
        { 'Repeat',         palette.blue.light,    none, none, none },
        { 'Label',          palette.blue.light,    none, none, none },
        { 'Operator',       palette.fg.normal,     none, none, none },
        { 'Keyword',        palette.yellow.light,  none, none, none },
        { 'Exception',      palette.blue.light,    none, none, none },
        --
        { 'PreProc',        palette.red.light,     none, none, none },
        { 'PreCondit',      palette.red.light,     none, none, none },
        { 'Include',        palette.red.light,     none, none, none },
        { 'Define',         palette.red.light,     none, none, none },
        { 'Macro',          palette.red.light,     none, none, none },
        --
        { 'Type',           palette.yellow.normal, none, none, none },
        { 'StorageClass',   palette.yellow.normal, none, none, none },
        { 'Structure',      palette.yellow.normal, none, none, none },
        { 'Typedef',        palette.yellow.normal, none, none, none },
        --
        { 'Tag',            palette.yellow.light,  none, none, 'bold' },
        { 'Special',        palette.yellow.light,  none, none, none },
        { 'SpecialChar',    palette.yellow.light,  none, none, none },
        { 'SpecialComment', palette.yellow.light,  none, none, none },
        { 'Delimiter',      palette.yellow.light,  none, none, 'bold' },
        { 'Debug',          palette.red.normal,    none, none, none },
        --
        { 'Todo',           palette.blue.normal,   none, none, 'reverse' },
        { 'Bold',           palette.fg.normal,     none, none, 'bold' },
        { 'Italic',         palette.fg.normal,     none, none, 'italic' },
        { 'Underlined',     palette.fg.normal,     none, none, 'underline' },
    }
end
