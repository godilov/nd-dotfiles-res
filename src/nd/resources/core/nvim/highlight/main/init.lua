local tab_lib    = require 'nd.lib.core.tab'
local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local merge      = tab_lib.merge

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.nvim.highlight.main'


local editor_fn     = require 'nd.resources.core.nvim.highlight.main.editor'
local syntax_fn     = require 'nd.resources.core.nvim.highlight.main.syntax'

local packer_fn     = require 'nd.resources.core.nvim.highlight.main.ext.packer'
local blankline_fn  = require 'nd.resources.core.nvim.highlight.main.ext.blankline'
local treesitter_fn = require 'nd.resources.core.nvim.highlight.main.ext.treesitter'
local telescope_fn  = require 'nd.resources.core.nvim.highlight.main.ext.telescope'
local tree_fn       = require 'nd.resources.core.nvim.highlight.main.ext.tree'
local cmp_fn        = require 'nd.resources.core.nvim.highlight.main.ext.cmp'

return function(palette, accent)
    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type value')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type value')

    return merge {
        editor_fn(palette, accent),
        syntax_fn(palette, accent),
        packer_fn(palette, accent),
        blankline_fn(palette, accent),
        treesitter_fn(palette, accent),
        telescope_fn(palette, accent),
        tree_fn(palette, accent),
        cmp_fn(palette, accent),
    }
end
