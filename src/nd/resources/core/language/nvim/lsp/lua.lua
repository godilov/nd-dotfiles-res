local fn_lib   = require 'nd.lib.core.fn'
local str_lib  = require 'nd.lib.core.str'
local tab_lib  = require 'nd.lib.core.tab'

local ivals    = fn_lib.ivals
local reduce   = fn_lib.reduce

local concat3s = str_lib.concat3s

local concat   = tab_lib.concat

return function(config)
    local cfg         = config or {}

    local root        = cfg.root or ''
    local libs_cfg    = cfg.libs or {}
    local libs_predef = {
        '/usr/share/nvim/runtime/lua',
        '/usr/share/nvim/runtime/lua/lsp',
        '/usr/share/awesome/lib',
    }


    local libs = concat {
        libs_cfg,
        libs_predef,
    }

    return {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = 'space',
                    indent_size = '4',
                    quote_style = 'single',
                    call_arg_parentheses = 'remove',
                    continuation_indent = '4',
                    trailing_table_separator = 'smart',
                    insert_final_newline = 'false',
                    space_around_table_field_list = 'true',
                    space_before_attribute = 'true',
                    space_before_function_open_parenthesis = 'false',
                    space_before_function_call_open_parenthesis = 'fales',
                    space_before_closure_open_parenthesis = 'false',
                    space_before_function_call_single_arg = 'true',
                    space_before_open_square_bracket = 'false',
                    space_inside_function_call_parentheses = 'false',
                    space_inside_function_param_list_parentheses = 'false',
                    space_inside_square_brackets = 'false',
                    space_around_table_append_operator = 'false',
                    ignore_spaces_inside_function_call = 'false',
                    space_before_inline_comment = '1',
                    space_around_math_operator = 'true',
                    space_after_comma = 'true',
                    space_after_comma_in_for_statement = 'true',
                    space_around_concat_operator = 'true',
                    align_call_args = 'false',
                    align_function_params = 'false',
                    align_continuous_assign_statement = 'true',
                    align_continuous_rect_table_field = 'true',
                    align_if_branch = 'true',
                    align_array_table = 'true',
                },
            },
            diagnostics = {
                globals = {
                    'vim',
                    'awesome',
                    'screen',
                    'client',
                    'root',
                },
            },
            workspace = {
                library = reduce(function(t, lib)
                    t[#t + 1] = concat3s(root, '/packer/start/', concat3s(lib[1], '/', lib[2]))

                    return t
                end, {}, ivals(libs)),
                checkThirdParty = false,
            },
        },
    }
end
