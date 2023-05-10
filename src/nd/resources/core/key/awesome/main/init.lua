local type_lib         = require 'nd.lib.core.type'
local assert_lib       = require 'nd.lib.core.assert'

local is_tab           = type_lib.is_tab

local nd_assert        = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err           = assert_lib.get_err_fn 'nd.resources.core.key.awesome.main'

local root_key_fn      = require 'nd.resources.core.key.awesome.main.key.root'
local client_key_fn    = require 'nd.resources.core.key.awesome.main.key.client'

local root_button_fn   = require 'nd.resources.core.key.awesome.main.button.root'
local client_button_fn = require 'nd.resources.core.key.awesome.main.button.client'

return function(mod)
    nd_assert(is_tab(mod), nd_err, 'fn(): mod must be of type table')

    return {
        key = {
            root   = root_key_fn(mod),
            client = client_key_fn(mod),
        },
        button = {
            root   = root_button_fn(mod),
            client = client_button_fn(mod),
        },
    }
end
