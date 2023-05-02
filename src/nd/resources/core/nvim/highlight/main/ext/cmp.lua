local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.nvim.highlight.main.ext.cmp'

return function(palette, accent)
    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type value')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type value')

    return {
    }
end
