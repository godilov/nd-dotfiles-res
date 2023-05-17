local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.packer'

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
        { 'IndentBlanklineChar',               palette.black.light,  none, none, none },
        { 'IndentBlanklineSpaceChar',          palette.black.light,  none, none, none },
        { 'IndentBlanklineSpaceCharBlankLine', palette.black.light,  none, none, none },
        { 'IndentBlanklineContextChar',        palette.yellow.light, none, none, none },
        { 'IndentBlanklineContextStart',       palette.yellow.light, none, none, none },
        { 'IndentBlanklineContextSpaceChar',   palette.yellow.light, none, none, none },
    }
end
