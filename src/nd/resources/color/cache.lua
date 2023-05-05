local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'
local cache_lib  = require 'nd.lib.cache'

local awesome_fn = require 'nd.resources.core.color.awesome'
local nvim_fn    = require 'nd.resources.core.color.nvim'

local is_nil     = type_lib.is_nil
local is_str     = type_lib.is_str
local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.color.cache'

local set        = cache_lib.set
local get        = cache_lib.get

local format     = string.format

local concat     = table.concat


local get_filename    = nil
local get_theme       = nil
local get_theme_cache = nil
local get_awesome     = nil
local get_nvim        = nil


get_filename = function(strs)
    return format('%s%s', concat(strs, '-'), '.lua')
end

get_theme = function(fn, config, filename)
    local theme = fn(config)

    set(filename, theme)

    return theme
end

get_theme_cache = function(fn, config, filename, is_forced)
    if is_forced then
        return get_theme(fn, config, filename)
    else
        local theme_cache = get(filename)

        return is_tab(theme_cache) and theme_cache or
            get_theme(fn, config, filename)
    end
end

get_awesome = function(config)
    nd_assert(is_tab(config), nd_err, 'get_nvim(): config must be of type table')

    local is_forced = config.is_forced or false
    local palette   = config.palette
    local accent    = config.accent
    local theme_n   = config.theme
    local palette_n = is_str(palette) and palette or config.palette_name or theme_n
    local accent_n  = is_str(accent) and accent or config.accent_name or theme_n

    nd_assert(is_nil(theme_n) or is_str(theme_n), nd_err, 'get_awesome(): theme must be of type nil or string')

    nd_assert(is_str(palette_n), nd_err, 'get_awesome(): palette or palette_name or theme must be of type string')
    nd_assert(is_str(accent_n), nd_err, 'get_awesome(): accent or accent_name or theme must be of type string')

    local filename = get_filename { 'awesome', palette_n, accent_n }

    return get_theme_cache(awesome_fn, {
        theme   = theme_n,
        palette = palette,
        accent  = accent,
    }, filename, is_forced)
end

get_nvim = function(config)
    nd_assert(is_tab(config), nd_err, 'get_nvim(): config must be of type table')

    local is_forced   = config.is_forced or false
    local palette     = config.palette
    local accent      = config.accent
    local highlight   = config.highlight
    local theme_n     = config.theme
    local palette_n   = is_str(palette) and palette or config.palette_name or theme_n
    local accent_n    = is_str(accent) and accent or config.accent_name or theme_n
    local highlight_n = is_str(highlight) and highlight or config.highlight_name or theme_n

    nd_assert(is_nil(theme_n) or is_str(theme_n), nd_err, 'get_nvim(): theme must be of type nil or string')

    nd_assert(is_str(palette_n), nd_err, 'get_nvim(): palette or palette_name or theme must be of type string')
    nd_assert(is_str(accent_n), nd_err, 'get_nvim(): accent or accent_name or theme must be of type string')
    nd_assert(is_str(highlight_n), nd_err, 'get_nvim(): highlight or highlight_name or theme must be of type string')

    local filename = get_filename { 'nvim', palette_n, accent_n, highlight_n }

    return get_theme_cache(nvim_fn, {
        theme     = theme_n,
        palette   = palette,
        accent    = accent,
        highlight = highlight,
    }, filename, is_forced)
end


return {
    get_awesome = get_awesome,
    get_nvim    = get_nvim,
}