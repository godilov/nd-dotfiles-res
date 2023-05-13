local type_lib   = require 'nd.lib.core.type'
local assert_lib = require 'nd.lib.core.assert'

local is_tab     = type_lib.is_tab

local nd_assert  = assert_lib.get_fn(ND_RESOURCES_IS_DEBUG)
local nd_err     = assert_lib.get_err_fn 'nd.resources.core.key.nvim.main.ext.telescope'

return function(config)
    local api    = config.api
    local leader = config.leader
    local opts   = config.opts

    nd_assert(is_tab(api), nd_err, 'fn(): api must be of type table')
    nd_assert(api.telescope, nd_err, 'fn(): api.telescope must be of type value')

    nd_assert(is_tab(leader), nd_err, 'fn(): leader must be of type table')
    nd_assert(is_tab(opts) or not opts, nd_err, 'fn(): opts must be of type table or nil')

    return function()
        local telescope = api.telescope

        return {
            i = {
                ['<Up>']       = telescope.move_selection_previous,
                ['<Down>']     = telescope.move_selection_next,
                ['<Left>']     = telescope.toggle_selection + telescope.move_selection_worse,
                ['<Right>']    = telescope.toggle_selection + telescope.move_selection_better,

                ['<Tab>']      = telescope.move_selection_previous,
                ['<S-Tab>']    = telescope.move_selection_next,

                ['<CR>']       = telescope.select_default,
                ['<C-x>']      = telescope.select_horizontal,
                ['<C-v>']      = telescope.select_vertical,
                ['<C-t>']      = telescope.select_tab,

                ['<C-u>']      = telescope.preview_scrolling_up,
                ['<C-d>']      = telescope.preview_scrolling_down,

                ['<C-q>']      = telescope.send_to_qflist + telescope.open_qflist,
                ['<M-q>']      = telescope.send_selected_to_qflist + telescope.open_qflist,

                ['<C-n>']      = false,
                ['<C-p>']      = false,

                ['<PageUp>']   = false,
                ['<PageDown>'] = false,

                ['<C-c>']      = false,

                ['<C-l>']      = false,
                ['<C-/>']      = false,
                ['<C-_>']      = false,
                ['<C-w>']      = false,
            },
            n = {
                ['<Up>']       = telescope.move_selection_previous,
                ['<Down>']     = telescope.move_selection_next,
                ['<Left>']     = telescope.toggle_selection + telescope.move_selection_worse,
                ['<Right>']    = telescope.toggle_selection + telescope.move_selection_better,

                ['<Tab>']      = telescope.move_selection_previous,
                ['<S-Tab>']    = telescope.move_selection_next,
                ['k']          = telescope.move_selection_previous,
                ['j']          = telescope.move_selection_next,

                ['<CR>']       = telescope.select_default,
                ['<C-x>']      = telescope.select_horizontal,
                ['<C-v>']      = telescope.select_vertical,
                ['<C-t>']      = telescope.select_tab,

                ['<C-u>']      = telescope.preview_scrolling_up,
                ['<C-d>']      = telescope.preview_scrolling_down,

                ['q']          = telescope.close,
                ['<Esc>']      = telescope.close,

                ['<C-q>']      = telescope.send_to_qflist + telescope.open_qflist,
                ['<M-q>']      = telescope.send_selected_to_qflist + telescope.open_qflist,

                ['gg']         = telescope.move_to_top,
                ['G']          = telescope.move_to_bottom,

                ['?']          = telescope.which_key,

                ['<PageUp>']   = false,
                ['<PageDown>'] = false,

                ['H']          = false,
                ['M']          = false,
                ['L']          = false,
            },
        }
    end
end
