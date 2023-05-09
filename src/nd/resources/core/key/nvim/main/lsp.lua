local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_str     = type_lib.is_str
local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.key.nvim.main.lsp'

local format     = string.format

return function(leader, opts)
    nd_assert(is_tab(leader), nd_err, 'fn(): leader must be of type table')
    nd_assert(is_str(leader.lsp), nd_err, 'fn(): leader.lsp must be of type string')
    nd_assert(is_str(leader.lsp_goto), nd_err, 'fn(): leader.lsp_goto must be of type string')
    nd_assert(is_tab(opts) or not opts, nd_err, 'fn(): opts must be of type table or nil')

    local concat   = '%s%s'
    local lsp      = leader.lsp
    local lsp_goto = leader.lsp_goto

    return function(api)
        nd_assert(is_tab(api), nd_err, 'fn().fn(): api must be of type table')
        nd_assert(api.nvim, nd_err, 'fn().fn(): api.nvim must be of type value')

        local diag = api.nvim.diagnostic

        return {
            { 'n', format(concat, lsp, 'q'),      '<CMD>Telescope diagnostics<CR>',           opts },
            { 'n', format(concat, lsp, 'e'),      diag.open_float,                            opts },
            { 'n', '[d',                          diag.goto_prev,                             opts },
            { 'n', ']d',                          diag.goto_next,                             opts },
            { 'n', format(concat, lsp_goto, 'D'), '<CMD>Telescope lsp_type_definitions<CR>',  opts },
            { 'n', format(concat, lsp_goto, 'd'), '<CMD>Telescope lsp_definitions<CR>',       opts },
            { 'n', format(concat, lsp_goto, 'i'), '<CMD>Telescope lsp_implementations<CR>',   opts },
            { 'n', format(concat, lsp_goto, 'r'), '<CMD>Telescope lsp_references<CR>',        opts },
            { 'n', format(concat, lsp, 'i'),      '<CMD>Telescope lsp_incoming_calls<CR>',    opts },
            { 'n', format(concat, lsp, 'o'),      '<CMD>Telescope lsp_outgoing_calls<CR>',    opts },
            { 'n', format(concat, lsp, 'sd'),     '<CMD>Telescope lsp_document_symbols<CR>',  opts },
            { 'n', format(concat, lsp, 'sw'),     '<CMD>Telescope lsp_workspace_symbols<CR>', opts },
        }
    end
end
