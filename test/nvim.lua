local type_lib = require 'nd.lib.core.type'

local nvim_fn  = require 'nd.resources.core.color.nvim'

local is_tab   = type_lib.is_tab


local is_ok           = nil

local get_bench_cases = nil
local get_test_cases  = nil


local opts = {
    sep    = '\n',
    step   = '    ',
    offset = '',
}


is_ok = function(x, _)
    return is_tab(x.palette) and
        is_tab(x.accent) and
        is_tab(x.highlight)
end

get_bench_cases = function()
    return {
        {
            name = 'nvim.fn()',
            opts = opts,
            args = {
                theme = 'main',
            },
            fn = nvim_fn,
        },
    }
end

get_test_cases = function()
    return {
        {
            name = 'nvim.fn()',
            opts = opts,
            args = {
                theme = 'main',
            },
            res = {},
            fn = nvim_fn,
            is_ok = is_ok,
        },
        {
            name = 'nvim.fn()',
            opts = opts,
            args = {
                palette   = 'main',
                accent    = 'main',
                highlight = 'main',
            },
            res = {},
            fn = nvim_fn,
            is_ok = is_ok,
        },
    }
end

return {
    get_bench_cases = get_bench_cases,
    get_test_cases  = get_test_cases,
}
