local format  = string.format
local gsub    = string.gsub

local path    = gsub(gsub(... or '', '%.init', ''), '%.', '/')

local is_init = false


local init = nil
local run  = nil


init = function(root, is_debug)
    if is_init then
        return
    end

    if not root then
        root = '.'
    end

    local entry_root = path ~= '' and format('%s/%s', root, path) or root

    local entry_file = format('%s/src/?.lua', entry_root)
    local entry_init = format('%s/src/?/init.lua', entry_root)

    package.path = format('%s;%s;%s', package.path, entry_file, entry_init)

    ND_RESOURCES_IS_DEBUG = ND_RESOURCES_IS_DEBUG or is_debug

    require 'ext.nd.lib.init'.init(root, is_debug)

    is_init = true
end

run = function()
    init('.', true)

    require 'nd.lib.test' {
        require 'test.awesome',
        require 'test.nvim',
    }
end

return {
    init = init,
    run  = run,
}
