local str_lib    = require 'nd.lib.core.str'
local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local concat2s   = str_lib.concat2s

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.key.awesome.main.key.root'

local date       = os.date

return function(config)
    local api = config.api
    local mod = config.mod.key

    nd_assert(is_tab(api), nd_err, 'fn(): api must be of type table')
    nd_assert(is_tab(mod), nd_err, 'fn(): mod.key must be of type table')

    local awful   = api.awful
    local naughty = api.naughty
    local menubar = api.menubar
    local client  = api.client

    nd_assert(awful, nd_err, 'fn(): api.awful must be of type value')
    nd_assert(naughty, nd_err, 'fn(): api.naughty must be of type value')
    nd_assert(menubar, nd_err, 'fn(): api.menubar must be of type value')
    nd_assert(client, nd_err, 'fn(): api.client must be of type value')

    return {
        { { mod.super }, 'F9',  awesome.restart, {} },
        { { mod.super }, 'F12', awesome.quit,    {} },

        { {}, 'Print', function()
            local path = concat2s('~/Pictures/Screenshots/', date '%Y-%m-%d_%H-%M-%S.png')

            awful.spawn.with_shell(concat2s('shotgun -s ', path))

            naughty.notify {
                text = concat2s('Screenshot: ', path),
            }
        end, {}, },
        { { mod.super },            '=', function() awful.spawn 'pactl set-sink-volume @DEFAULT_SINK@ +10%' end, {} },
        { { mod.super },            '-', function() awful.spawn 'pactl set-sink-volume @DEFAULT_SINK@ -10%' end, {} },
        { { mod.super },            '[', function() awful.spawn 'light -A 5' end,                                {} },
        { { mod.super },            ']', function() awful.spawn 'light -U 5' end,                                {} },
        { { mod.super },            'h', function() awful.client.focus.byidx(-1) end,                            {} },
        { { mod.super },            'l', function() awful.client.focus.byidx(1) end,                             {} },
        { { mod.super },            'j', function() awful.screen.focus_relative(-1) end,                         {} },
        { { mod.super },            'k', function() awful.screen.focus_relative(1) end,                          {} },
        { { mod.super, mod.shift }, 'h', function() awful.client.swap.byidx(-1) end,                             {} },
        { { mod.super, mod.shift }, 'l', function() awful.client.swap.byidx(1) end,                              {} },
        -- { { mod.super, mod.shift }, 'j', {}, {}}, -- Defined by client
        -- { { mod.super, mod.shift }, 'k', {}, {}}, -- Defined by client

        { { mod.super, mod.ctrl }, 'h', function()
        end, {}, },
        { { mod.super, mod.ctrl }, 'l', function()
        end, {}, },
        { { mod.super, mod.ctrl }, 'j', function()
        end, {}, },
        { { mod.super, mod.ctrl }, 'k', function()
        end, {}, },

        -- { { mod.super }, 'n', {}, {}}, -- Defined by client
        -- { { mod.super }, 'm', {}, {}}, -- Defined by client
        { { mod.super }, ',', function()
            local c = awful.client.restore()

            if c then
                c:emit_signal 'request::activate'
            end
        end, {}, },
        { { mod.super, mod.alt }, 'h', awful.tag.viewprev, {} },
        { { mod.super, mod.alt }, 'l', awful.tag.viewnext, {} },
        -- { { mod.super, mod.alt }, 'j', {}, {}}, -- Defined by client
        -- { { mod.super, mod.alt }, 'k', {}, {}}, -- Defined by client

        { { mod.super, mod.crtl }, 'q', function()
            if client.focus then
                client.focus:kill()
            end
        end, {}, },
        { { mod.super }, mod.enter, function() awful.spawn 'alacritty' end, {} },
        { { mod.super }, mod.space, function() menubar.show() end,          {} },
    }
end
