local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.res.core.color.nvim.highlight.main.ext.tree'

--
-- Group = { hl, fg, bg, sp, gui, link }
--

return function(config)
    local palette = config.palette
    local accent  = config.accent

    nd_assert(is_tab(palette), nd_err, 'fn(): palette must be of type table')
    nd_assert(is_tab(accent), nd_err, 'fn(): accent must be of type table')

    local none = 'NONE'

    return {
        -- nvim-tree-highlight

        { 'NvimTreeNormal',           none, none, none, none },
        { 'NvimTreeVertSplit',        none, none, none, none },
        { 'NvimTreeIndentMarker',     none, none, none, none },
        --
        { 'NvimTreeRootFolder',       none, none, none, none },
        { 'NvimTreeFolderName',       none, none, none, none },
        { 'NvimTreeFolderIcon',       none, none, none, none },
        { 'NvimTreeOpenedFolderName', none, none, none, none },
        { 'NvimTreeEmptyFolderName',  none, none, none, none },
        { 'NvimTreeSymlink',          none, none, none, none },
        { 'NvimTreeSpecialFile',      none, none, none, none },
        { 'NvimTreeImageFile',        none, none, none, none },
        { 'NvimTreeOpenedFile',       none, none, none, none },
        --
        { 'NvimTreeGitDeleted',       none, none, none, none },
        { 'NvimTreeGitDirty',         none, none, none, none },
        { 'NvimTreeGitMerge',         none, none, none, none },
        { 'NvimTreeGitNew',           none, none, none, none },
        { 'NvimTreeGitRenamed',       none, none, none, none },
        { 'NvimTreeGitStaged',        none, none, none, none },
    }
end
