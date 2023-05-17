local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.telescope'

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
        { 'TelescopeNormal',                 none,                  none,                 none, none, 'Normal' },
        { 'TelescopePreviewNormal',          none,                  none,                 none, none, 'Normal' },
        { 'TelescopePromptNormal',           none,                  none,                 none, none, 'Normal' },
        { 'TelescopeResultsNormal',          none,                  none,                 none, none, 'Normal' },
        --
        { 'TelescopeSelection',              none,                  none,                 none, none, 'TelescopeBorder' },
        { 'TelescopeSelectionCaret',         none,                  none,                 none, none, 'TelescopeBorder' },
        { 'TelescopeMultiSelection',         palette.red.normal,    none,                 none, none },
        { 'TelescopeMultiIcon',              palette.red.normal,    none,                 none, none },
        --
        { 'TelescopeBorder',                 palette.yellow.light,  none,                 none, none },
        { 'TelescopePromptBorder',           none,                  none,                 none, none, 'TelescopeBorder' },
        { 'TelescopeResultsBorder',          none,                  none,                 none, none, 'TelescopeBorder' },
        { 'TelescopePreviewBorder',          none,                  none,                 none, none, 'TelescopeBorder' },
        --
        { 'TelescopeTitle',                  none,                  none,                 none, none, 'TelescopeBorder' },
        { 'TelescopePromptTitle',            none,                  none,                 none, none, 'TelescopeBorder' },
        { 'TelescopeResultsTitle',           none,                  none,                 none, none, 'TelescopeBorder' },
        { 'TelescopePreviewTitle',           none,                  none,                 none, none, 'TelescopeBorder' },
        { 'TelescopePromptPrefix',           none,                  none,                 none, none, 'TelescopeBorder' },
        { 'TelescopePromptCounter',          palette.yellow.light,  none,                 none, none },
        { 'TelescopeMatching',               palette.bg.normal,     palette.yellow.light, none, none },
        --
        { 'TelescopePreviewLine',            none,                  none,                 none, none },
        { 'TelescopePreviewMatch',           none,                  none,                 none, none, 'TelescopeMatching' },
        { 'TelescopePreviewPipe',            none,                  none,                 none, none },
        { 'TelescopePreviewCharDev',         none,                  none,                 none, none },
        { 'TelescopePreviewDirectory',       none,                  none,                 none, none },
        { 'TelescopePreviewBlock',           none,                  none,                 none, none },
        { 'TelescopePreviewLink',            none,                  none,                 none, none },
        { 'TelescopePreviewSocket',          none,                  none,                 none, none },
        { 'TelescopePreviewRead',            none,                  none,                 none, none },
        { 'TelescopePreviewWrite',           none,                  none,                 none, none },
        { 'TelescopePreviewExecute',         none,                  none,                 none, none },
        { 'TelescopePreviewHyphen',          none,                  none,                 none, none },
        { 'TelescopePreviewSticky',          none,                  none,                 none, none },
        { 'TelescopePreviewSize',            none,                  none,                 none, none },
        { 'TelescopePreviewUser',            none,                  none,                 none, none },
        { 'TelescopePreviewGroup',           none,                  none,                 none, none },
        { 'TelescopePreviewDate',            none,                  none,                 none, none },
        { 'TelescopePreviewMessage',         none,                  none,                 none, none },
        { 'TelescopePreviewMessageFillchar', none,                  none,                 none, none },
        --
        { 'TelescopeResultsClass',           none,                  none,                 none, none },
        { 'TelescopeResultsConstant',        none,                  none,                 none, none },
        { 'TelescopeResultsField',           none,                  none,                 none, none },
        { 'TelescopeResultsFunction',        none,                  none,                 none, none },
        { 'TelescopeResultsMethod',          none,                  none,                 none, none },
        { 'TelescopeResultsOperator',        none,                  none,                 none, none },
        { 'TelescopeResultsStruct',          none,                  none,                 none, none },
        { 'TelescopeResultsVariable',        none,                  none,                 none, none },
        { 'TelescopeResultsLineNr',          none,                  none,                 none, none },
        { 'TelescopeResultsIdentifier',      none,                  none,                 none, none },
        { 'TelescopeResultsNumber',          none,                  none,                 none, none },
        { 'TelescopeResultsComment',         none,                  none,                 none, none },
        { 'TelescopeResultsSpecialComment',  none,                  none,                 none, none },
        --
        { 'TelescopeResultsDiffAdd',         palette.green.normal,  none,                 none, none },
        { 'TelescopeResultsDiffDelete',      palette.red.normal,    none,                 none, none },
        { 'TelescopeResultsDiffChange',      palette.yellow.normal, none,                 none, none },
        { 'TelescopeResultsDiffUntracked',   palette.blue.normal,   none,                 none, none },
    }
end
