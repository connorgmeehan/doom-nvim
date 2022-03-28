local lightspeed = {}

-- use({ "ggandor/lightspeed.nvim", config = require("molleweide.configs.lightspeed") })

return function()
  require'lightspeed'.setup {
    ignore_case = false,
    exit_after_idle_msecs = { unlabeled = 1000, labeled = nil },

    --- s/x ---
    jump_to_unique_chars = { safety_timeout = 400 },
    match_only_the_start_of_same_char_seqs = true,
    force_beacons_into_match_width = false,
    -- Display characters in a custom way in the highlighted matches.
    substitute_chars = { ['\r'] = '¬' },
    -- Leaving the appropriate list empty effectively disables "smart" mode,
    -- and forces auto-jump to be on or off.
    -- safe_labels = { . . . },
    -- labels = { . . . },
    -- These keys are captured directly by the plugin at runtime.
    special_keys = {
      next_match_group = '<space>',
      prev_match_group = '<tab>',
    },

    --- f/t ---
    limit_ft_matches = 4,
    repeat_ft_with_target_char = false,
  }
end

    -- -- jump_to_first_match = true,
    -- jump_on_partial_input_safety_timeout = 400,
    -- exit_after_idle_msecs = { labeled = 1500, unlabeled = 1000 },
    -- -- highlight_unique_chars = true,
    -- -- grey_out_search_area = true,
    -- match_only_the_start_of_same_char_seqs = true,
    -- limit_ft_matches = 4,
    -- -- x_mode_prefix_key = '<c-x>',
    -- substitute_chars = { ['\r'] = '¬', [' '] = '_'},
    -- instant_repeat_fwd_key = nil,
    -- instant_repeat_bwd_key = nil,
    -- -- If no values are given, these will be set at runtime,
    -- -- based on `jump_to_first_match`.
    -- labels = nil,
    -- cycle_group_fwd_key = nil,
    -- cycle_group_bwd_key = nil,






--     ligthspeed.nvim
-- The following fields in the opts table has been renamed or removed:

--         highlight_unique_chars
--         grey_out_search_area
--         jump_on_partial_input_safety_timeout

-- highlight_unique_chars
-- Use jump_to_unique_chars instead. See :h lightspeed-config for details.

-- grey_out_search_area
-- This flag has been removed. To turn the 'greywash' feature off, just set all attributes of the corresponding highlight group to 'none': :hi Lightspeed
-- Greywash guifg=none guibg=none ...

-- jump_on_partial_input_safety_timeout
-- Use jump_to_unique_chars instead. See :h lightspeed-config for details.


return lightspeed
