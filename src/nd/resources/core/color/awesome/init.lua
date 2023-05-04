local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local theme_fn   = require 'nd.resources.core.color.shared.theme'

local is_nil     = type_lib.is_nil
local is_val     = type_lib.is_val
local is_str     = type_lib.is_str
local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.color.awesome'

return function(config)
    nd_assert(is_tab(config), nd_err, 'fn(): config must be of type table')
    nd_assert(is_nil(config.theme) or is_str(config.theme), nd_err, 'fn(): theme must be of type nil or string')

    local palette_cfg = config.palette or config.theme
    local accent_cfg  = config.accent or config.theme

    nd_assert(is_val(palette_cfg), nd_err, 'fn(): palette must be of type value')
    nd_assert(is_val(accent_cfg), nd_err, 'fn(): accent must be of type value')

    local palette = theme_fn('nd.resources.core.color.shared.palette', palette_cfg)
    local accent  = theme_fn('nd.resources.core.color.awesome.accent', accent_cfg, palette)

    return {
        palette = palette,
        accent  = accent,
    }
end
