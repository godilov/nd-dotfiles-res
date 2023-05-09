local tab_lib    = require 'nd.lib.core.tab'
local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local merge      = tab_lib.merge

local is_str     = type_lib.is_str
local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.key.nvim.main.lsp_buf'

local format     = string.format

return function(leader, opts)
    nd_assert(is_tab(leader), nd_err, 'fn(): leader must be of type table')
    nd_assert(is_str(leader.lsp), nd_err, 'fn(): leader.lsp must be of type string')
    nd_assert(is_tab(opts) or not opts, nd_err, 'fn(): opts must be of type table or nil')

    local concat = '%s%s'
    local lsp    = leader.lsp

    return function(api, bufnr)
        nd_assert(is_tab(api), nd_err, 'fn().fn(): api must be of type table')
        nd_assert(api.nvim, nd_err, 'fn().fn(): api.nvim must be of type value')

        local buf      = api.nvim.lsp.buf
        local inspect  = api.nvim.inspect
        local opts_buf = merge {
            { buffer = bufnr },
            opts,
        }


        local on_wl = function() print(inspect(buf.list_workspace_folders())) end
        local on_f  = function() buf.format { async = true } end

        return {
            { 'n', '<C-Space>',               buf.hover,                   opts_buf },
            { 'n', '<M-Space>',               buf.signature_help,          opts_buf },
            { 'n', format(concat, lsp, 'wa'), buf.add_workspace_folder,    opts_buf },
            { 'n', format(concat, lsp, 'wr'), buf.remove_workspace_folder, opts_buf },
            { 'n', format(concat, lsp, 'wl'), on_wl,                       opts_buf },
            { 'n', format(concat, lsp, 'r'),  buf.rename,                  opts_buf },
            { 'n', format(concat, lsp, 'a'),  buf.code_action,             opts_buf },
            { 'n', format(concat, lsp, 'f'),  on_f,                        opts_buf },
        }
    end
end
