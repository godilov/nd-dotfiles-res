local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.key.awesome.main.key.client'

return function(config)
    local api = config.api
    local mod = config.mod

    nd_assert(is_tab(api), nd_err, 'fn(): api must be of type table')
    nd_assert(is_tab(mod), nd_err, 'fn(): mod must be of type table')

    local awful   = api.awful
    local menubar = api.menubar
    local naughty = api.naughty
    local client  = api.client

    nd_assert(awful, nd_err, 'fn(): api.awful must be of type value')
    nd_assert(menubar, nd_err, 'fn(): api.menubar must be of type value')
    nd_assert(naughty, nd_err, 'fn(): api.naughty must be of type value')
    nd_assert(client, nd_err, 'fn(): api.client must be of type value')

    local key = awful.key

    local move = function(i)
        return function(c)
            local screen = awful.screen.focused()
            local tags = screen.tags

            local tag_index = screen.selected_tags[#screen.selected_tags].index
            local tag_index_new = (tag_index + i + #tags - 1) % #tags + 1

            c:move_to_tag(tags[tag_index_new])

            awful.tag.viewidx(i)
        end
    end

    return {
        key({ mod.super, mod.shift }, 'j', function(c) c:move_to_screen(client.focus.screen.index - 1) end, {}),
        key({ mod.super, mod.shift }, 'k', function(c) c:move_to_screen(client.focus.screen.index + 1) end, {}),
        key({ mod.super, mod.alt }, 'j', move(-1), {}),
        key({ mod.super, mod.alt }, 'k', move(1), {}),
        key({ mod.super }, 'n', function(c)
            c.maximized = not c.maximized
            c:raise()
        end, {}),
        key({ mod.super }, 'm', function(c)
            c.minimized = not c.minimized
            c:lower()
        end, {}),
    }
end
