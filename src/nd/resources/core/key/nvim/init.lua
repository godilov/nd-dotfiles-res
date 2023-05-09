local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local load_fn    = require 'nd.resources.core.load'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.key.nvim'

return function(config)
    nd_assert(is_tab(config), nd_err, 'fn(): config must be of type table')
    nd_assert(config.scheme, nd_err, 'fn(): scheme must be of type value')

    nd_assert(is_tab(config.leader), nd_err, 'fn(): leader must be of type table')
    nd_assert(is_tab(config.opts) or not config.opts, nd_err, 'fn(): opts must be of type table or nil')

    local scheme = load_fn('nd.resources.core.key.nvim', config.scheme, config.leader, config.opts)

    return {
        scheme = scheme,
    }
end
