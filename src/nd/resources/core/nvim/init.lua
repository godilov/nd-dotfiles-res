local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_val     = type_lib.is_val
local is_str     = type_lib.is_str
local is_tab     = type_lib.is_tab
local is_fn      = type_lib.is_fn

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.nvim'

local format     = string.format


local get_theme = nil


get_theme = function(scope, cfg, ...)
    if is_str(cfg) then
        return require(format('%s.%s', scope, cfg))(...)
    elseif is_tab(cfg) then
        return cfg
    elseif is_fn(cfg) then
        return cfg(...)
    else
        nd_assert(false, nd_err, 'get_theme(): val must be of type string, table or function')
    end
end

return function(config)
    nd_assert(is_tab(config), nd_err, 'fn(): config must be of type table')

    local palette_cfg   = config.palette or config.theme
    local accent_cfg    = config.accent or config.theme
    local highlight_cfg = config.highlight or config.theme

    nd_assert(is_val(palette_cfg), nd_err, 'fn(): palette must be of type value')
    nd_assert(is_val(accent_cfg), nd_err, 'fn(): accent must be of type value')
    nd_assert(is_val(highlight_cfg), nd_err, 'fn(): highlight must be of type value')

    local palette   = get_theme('nd.resources.core.shared.palette', palette_cfg)
    local accent    = get_theme('nd.resources.core.nvim.accent', accent_cfg, palette)
    local highlight = get_theme('nd.resources.core.nvim.highlight', highlight_cfg, palette, accent)

    return {
        palette   = palette,
        accent    = accent,
        highlight = highlight,
    }
end
