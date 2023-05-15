local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.tree'

--
-- Group = { fg, bg, sp, gui, link }
--

return function(config)
    local palette = config.palette
    local accent  = config.accent

    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type table')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type table')

    return {
        -- nvim-tree-highlight

        -- NvimTreeNormal       = { nil, nil, nil, nil },
        -- NvimTreeVertSplit    = { nil, nil, nil, nil },
        -- NvimTreeIndentMarker = { nil, nil, nil, nil },

        -- NvimTreeRootFolder       = { nil, nil, nil, nil },
        -- NvimTreeFolderName       = { nil, nil, nil, nil },
        -- NvimTreeFolderIcon       = { nil, nil, nil, nil },
        -- NvimTreeOpenedFolderName = { nil, nil, nil, nil },
        -- NvimTreeEmptyFolderName  = { nil, nil, nil, nil },
        -- NvimTreeSymlink          = { nil, nil, nil, nil },
        -- NvimTreeSpecialFile      = { nil, nil, nil, nil },
        -- NvimTreeImageFile        = { nil, nil, nil, nil },
        -- NvimTreeOpenedFile       = { nil, nil, nil, nil },

        -- NvimTreeGitDeleted = { nil, nil, nil, nil },
        -- NvimTreeGitDirty   = { nil, nil, nil, nil },
        -- NvimTreeGitMerge   = { nil, nil, nil, nil },
        -- NvimTreeGitNew     = { nil, nil, nil, nil },
        -- NvimTreeGitRenamed = { nil, nil, nil, nil },
        -- NvimTreeGitStaged  = { nil, nil, nil, nil },
    }
end
