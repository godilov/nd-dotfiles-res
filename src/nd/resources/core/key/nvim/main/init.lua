local type_lib      = require 'nd.lib.core.type'
local assert_lib    = require 'nd.lib.core.assert'

local is_tab        = type_lib.is_tab

local nd_assert     = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err        = assert_lib.get_err_fn 'nd.resources.core.key.nvim.main'

local lsp_fn        = require 'nd.resources.core.key.nvim.main.lsp'
local lsp_buf_fn    = require 'nd.resources.core.key.nvim.main.lsp_buf'
local editor_fn     = require 'nd.resources.core.key.nvim.main.editor'

local treesitter_fn = require 'nd.resources.core.key.nvim.main.ext.treesitter'
local telescope_fn  = require 'nd.resources.core.key.nvim.main.ext.telescope'
local tree_fn       = require 'nd.resources.core.key.nvim.main.ext.tree'
local cmp_fn        = require 'nd.resources.core.key.nvim.main.ext.cmp'

return function(leader, opts)
    nd_assert(is_tab(leader), nd_err, 'fn(): leader must be of type table')
    nd_assert(is_tab(opts) or not opts, nd_err, 'fn(): opts must be of type table or nil')

    return {
        lsp        = lsp_fn(leader, opts),
        lsp_buf    = lsp_buf_fn(leader, opts),
        editor     = editor_fn(leader, opts),
        treesitter = treesitter_fn(leader, opts),
        telescope  = telescope_fn(leader, opts),
        tree       = tree_fn(leader, opts),
        cmp        = cmp_fn(leader, opts),
    }
end
