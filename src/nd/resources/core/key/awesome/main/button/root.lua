local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.key.awesome.main.button.root'

return function(mod)
    nd_assert(is_tab(mod), nd_err, 'fn(): mod must be of type table')

    return function(api)
        nd_assert(is_tab(api), nd_err, 'fn(): api must be of type table')

        return {}
    end
end
