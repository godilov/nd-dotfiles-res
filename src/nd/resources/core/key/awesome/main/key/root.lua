local tab_lib    = require 'nd.lib.core.tab'
local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local merge      = tab_lib.merge

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.key.awesome.main.key.root'

return function(mod)
    nd_assert(is_tab(mod), nd_err, 'fn(): mod must be of type table')

    return function(api)
        nd_assert(is_tab(api), nd_err, 'fn(): api must be of type table')

        local awful   = api.awful
        local menubar = api.menubar
        local naughty = api.naughty

        nd_assert(awful, nd_err, 'fn(): api.awful must be of type value')
        nd_assert(menubar, nd_err, 'fn(): api.menubar must be of type value')
        nd_assert(naughty, nd_err, 'fn(): api.naughty must be of type value')

        local key = awful.key

        return merge {
            key({ mod.super }, 'F9', awesome.restart, {}),
            key({ mod.super }, 'F12', awesome.quit, {}),

            key({}, 'Print', function()
                local path = '~/Pictures/Screenshots/' .. os.date '%Y-%m-%d_%H-%M-%S.png'

                awful.spawn.with_shell('shotgun -s ' .. path)

                naughty.notify {
                    text = 'Screenshot: ' .. path,
                }
            end, {}),

            key({ mod.super }, '[', function() awful.spawn 'light -A 5' end, {}),
            key({ mod.super }, ']', function() awful.spawn 'light -U 5' end, {}),
            key({ mod.super }, 'h', function() awful.client.focus.byidx(-1) end, {}),
            key({ mod.super }, 'l', function() awful.client.focus.byidx(1) end, {}),
            key({ mod.super }, 'j', function() awful.screen.focus_relative(-1) end, {}),
            key({ mod.super }, 'k', function() awful.screen.focus_relative(1) end, {}),
            key({ mod.super, mod.shift }, 'h', function() awful.client.swap.byidx(-1) end, {}),
            key({ mod.super, mod.shift }, 'l', function() awful.client.swap.byidx(1) end, {}),
            -- key({ mod.super, mod.shift }, 'j', {}, {}), -- Defined by client
            -- key({ mod.super, mod.shift }, 'k', {}, {}), -- Defined by client

            key({ mod.super, mod.ctrl }, 'h', function()
            end, {}),
            key({ mod.super, mod.ctrl }, 'l', function()
            end, {}),
            key({ mod.super, mod.ctrl }, 'j', function()
            end, {}),
            key({ mod.super, mod.ctrl }, 'k', function()
            end, {}),

            -- key({ mod.super }, 'n', {}, {}), -- Defined by client
            -- key({ mod.super }, 'm', {}, {}), -- Defined by client
            key({ mod.super }, ',', function()
                local c = awful.client.restore()

                if c then
                    c:emit_signal 'request::activate'
                end
            end, {}),
            key({ mod.super, mod.alt }, 'h', awful.tag.viewprev, {}),
            key({ mod.super, mod.alt }, 'l', awful.tag.viewnext, {}),
            -- key({ mod.super, mod.alt }, 'j', {}, {}), -- Defined by client
            -- key({ mod.super, mod.alt }, 'k', {}, {}), -- Defined by client

            key({ mod.super, mod.crtl }, 'q', function() client.focus:kill() end),
            key({ mod.super }, mod.enter, function() awful.spawn 'alacritty' end, {}),
            key({ mod.super }, mod.space, function() menubar.show() end, {}),
        }
    end
end
