local tab_lib    = require 'nd.lib.core.tab'
local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local flat       = tab_lib.flat

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.blankline'

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
        flat { 'IndentBlanklineChar', accent.comment },
        flat { 'IndentBlanklineSpaceChar', accent.comment },
        flat { 'IndentBlanklineSpaceCharBlankLine', accent.comment },
        --
        { 'IndentBlanklineContextChar',      palette.yellow.light, none, none, none },
        { 'IndentBlanklineContextStart',     palette.yellow.light, none, none, none },
        { 'IndentBlanklineContextSpaceChar', palette.yellow.light, none, none, none },
    }
end
