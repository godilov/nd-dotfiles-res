local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_val     = type_lib.is_val
local is_str     = type_lib.is_str
local is_tab     = type_lib.is_tab
local is_fn      = type_lib.is_fn

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.nvim'

local format     = string.format


local get_theme_elem = nil


get_theme_elem = function(scope, val, ...)
    if is_str(val) then
        return require(format('%s.%s', scope, val))(...)
    elseif is_tab(val) then
        return val
    elseif is_fn(val) then
        return val(...)
    else
        nd_assert(false, nd_err, 'get_theme_elem(): val must be of type string, table or function')
    end
end

return function(palette, accent, highlight)
    nd_assert(is_val(palette), nd_err, 'fn(): palette must be of type value')
    nd_assert(is_val(accent), nd_err, 'fn(): accent must be of type value')
    nd_assert(is_val(highlight), nd_err, 'fn(): highlight must be of type value')

    local palette_elem   = get_theme_elem('nd.resources.core.shared.palette', palette)
    local accent_elem    = get_theme_elem('nd.resources.core.nvim.accent', accent, palette_elem)
    local highlight_elem = get_theme_elem('nd.resources.core.nvim.highlight', highlight, palette_elem, accent_elem)

    return {
        palette   = palette_elem,
        accent    = accent_elem,
        highlight = highlight_elem,
    }
end
