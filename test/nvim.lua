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
    }
end

get_test_cases = function()
    return {
        {
            name = 'nvim.fn()',
            args = {
                theme = 'main',
            },
            res = {},
            fn = nvim_fn,
            opts = opts,
            is_ok = is_ok,
        },
        {
            name = 'nvim.fn()',
            args = {
                palette   = 'main',
                accent    = 'main',
                highlight = 'main',
            },
            res = {},
            fn = nvim_fn,
            opts = opts,
            is_ok = is_ok,
        },
    }
end

return {
    get_bench_cases = get_bench_cases,
    get_test_cases  = get_test_cases,
}
