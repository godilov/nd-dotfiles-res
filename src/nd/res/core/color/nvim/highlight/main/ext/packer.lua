local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.packer'

return function(config)
    local palette = config.palette
    local accent  = config.accent

    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type table')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type table')

    return {
        IndentBlanklineChar               = { fg = palette.black.light, bg = nil, sp = nil, link = nil },
        IndentBlanklineSpaceChar          = { fg = palette.black.light, bg = nil, sp = nil, link = nil },
        IndentBlanklineSpaceCharBlankLine = { fg = palette.black.light, bg = nil, sp = nil, link = nil },
        IndentBlanklineContextChar        = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        IndentBlanklineContextStart       = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
        IndentBlanklineContextSpaceChar   = { fg = palette.yellow.light, bg = nil, sp = nil, link = nil },
    }
end
