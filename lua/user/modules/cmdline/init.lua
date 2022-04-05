local cmdline = {}

-- it would be cool to have telescope also follow the cursor so that you don't have to jump up and down all the time.
-- depending on what quadrant you are in telescope will open its window so that you type where your eyes wer so that
-- things become super smooth from an ergonomic perspective.

cmdline.packages = {
  ["fine-cmdline.nvim"] = {"VonHeikemen/fine-cmdline.nvim"}, -- :h fine-cmdline
  -- git@github.com:VonHeikemen/searchbox.nvim.git
}

-- cmdline.configs = {}
-- cmdline.configs["fine-cmdline.nvim"] = function() end

-- cmdline.binds = {}
-- leader > colon > float cmdline.

return cmdline
