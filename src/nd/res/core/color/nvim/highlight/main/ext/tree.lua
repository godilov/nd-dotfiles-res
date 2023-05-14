local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.tree'

return function(config)
    local palette = config.palette
    local accent  = config.accent

    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type table')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type table')

    return {
        -- nvim-tree-highlight

        -- NvimTreeNormal       = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeVertSplit    = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeIndentMarker = { fg = nil, bg = nil, sp = nil, link = nil },

        -- NvimTreeRootFolder       = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeFolderName       = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeFolderIcon       = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeOpenedFolderName = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeEmptyFolderName  = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeSymlink          = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeSpecialFile      = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeImageFile        = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeOpenedFile       = { fg = nil, bg = nil, sp = nil, link = nil },

        -- NvimTreeGitDeleted = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeGitDirty   = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeGitMerge   = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeGitNew     = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeGitRenamed = { fg = nil, bg = nil, sp = nil, link = nil },
        -- NvimTreeGitStaged  = { fg = nil, bg = nil, sp = nil, link = nil },
    }
end
