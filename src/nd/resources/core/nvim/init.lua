local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local theme_fn   = require 'nd.resources.core.shared.theme'

local is_val     = type_lib.is_val
local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.nvim'

return function(config)
    nd_assert(is_tab(config), nd_err, 'fn(): config must be of type table')

    local palette_cfg   = config.palette or config.theme
    local accent_cfg    = config.accent or config.theme
    local highlight_cfg = config.highlight or config.theme

    nd_assert(is_val(palette_cfg), nd_err, 'fn(): palette must be of type value')
    nd_assert(is_val(accent_cfg), nd_err, 'fn(): accent must be of type value')
    nd_assert(is_val(highlight_cfg), nd_err, 'fn(): highlight must be of type value')

    local palette   = theme_fn('nd.resources.core.shared.palette', palette_cfg)
    local accent    = theme_fn('nd.resources.core.nvim.accent', accent_cfg, palette)
    local highlight = theme_fn('nd.resources.core.nvim.highlight', highlight_cfg, palette, accent)

    return {
        palette   = palette,
        accent    = accent,
        highlight = highlight,
    }
end
