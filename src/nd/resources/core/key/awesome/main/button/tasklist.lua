local tab_lib    = require 'nd.lib.core.tab'
local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local merge      = tab_lib.merge

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.key.awesome.main.button.tasklist'

return function(config)
    local api = config.api
    local mod = config.mod

    nd_assert(is_tab(api), nd_err, 'fn(): api must be of type table')
    nd_assert(is_tab(mod), nd_err, 'fn(): mod must be of type table')

    local awful = api.awful

    nd_assert(awful, nd_err, 'fn(): api.awful must be of type value')

    local button = awful.button

    return merge {
        button({}, 1, function(c)
            if c == client.focus then
                c.minimized = true
            else
                c.minimized = false

                c:emit_signal 'request::activate'
            end
        end),
    }
end
