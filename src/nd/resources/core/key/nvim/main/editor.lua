local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_str     = type_lib.is_str
local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.key.nvim.main.editor'

local format     = string.format

return function(leader, opts)
    nd_assert(is_tab(leader), nd_err, 'fn(): leader must be of type table')
    nd_assert(is_str(leader.files), nd_err, 'fn(): leader.files must be of type string')
    nd_assert(is_tab(opts) or not opts, nd_err, 'fn(): opts must be of type table or nil')

    local concat = '%s%s'
    local files  = leader.files

    return function(_)
        return {
            { '',  '<up>',                     '<nop>',                         opts },
            { '',  '<down>',                   '<nop>',                         opts },
            { '',  '<left>',                   '<nop>',                         opts },
            { '',  '<right>',                  '<nop>',                         opts },
            { 'n', '<F21>',                    '<CMD>NdApplyConfig<CR>',        opts },
            { 'n', '<F22>',                    '<CMD>NdApplyFile<CR>',          opts },
            { 'n', format(concat, files, 'd'), '<CMD>NvimTreeToggle<CR>',       opts },
            { 'n', format(concat, files, 'f'), '<CMD>Telescope find_files<CR>', opts },
            { 'n', format(concat, files, 'g'), '<CMD>Telescope git_files<CR>',  opts },
            { 'n', format(concat, files, 'h'), '<CMD>Telescope help_tags<CR>',  opts },
            { 'n', format(concat, files, ';'), '<CMD>Telescope live_grep<CR>',  opts },
            { 'n', '<C-h>',                    '<C-w>h',                        opts },
            { 'n', '<C-j>',                    '<C-w>j',                        opts },
            { 'n', '<C-k>',                    '<C-w>k',                        opts },
            { 'n', '<C-l>',                    '<C-w>l',                        opts },
            { 'n', '<S-h>',                    '<C-w>H',                        opts },
            { 'n', '<S-j>',                    '<C-w>J',                        opts },
            { 'n', '<S-k>',                    '<C-w>K',                        opts },
            { 'n', '<S-l>',                    '<C-w>L',                        opts },
            { 'n', '<C-S-h>',                  '<C-w>4<',                       opts },
            { 'n', '<C-S-j>',                  '<C-w>4-',                       opts },
            { 'n', '<C-S-k>',                  '<C-w>4+',                       opts },
            { 'n', '<C-S-l>',                  '<C-w>4>',                       opts },
            { 'n', '<M-h>',                    '<CMD>:tabprevious<CR>',         opts },
            { 'n', '<M-j>',                    '<CMD>:tabclose<CR>',            opts },
            { 'n', '<M-k>',                    '<CMD>:tabnew<CR>',              opts },
            { 'n', '<M-l>',                    '<CMD>:tabnext<CR>',             opts },
        }
    end
end
