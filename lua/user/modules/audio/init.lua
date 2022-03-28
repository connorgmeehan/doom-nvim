local audio = {}

-- https://github.com/johnnovak/vim-walter

audio.settings = {}

audio.packages = {
  ["scnvim"] = {
    "davidgranstrom/scnvim",
    run = ":call scnvim#install()",
    config = require("molleweide.configs.scnvim"),
  },
  -- https://github.com/tidalcycles/vim-tidal
  -- https://github.com/madskjeldgaard/reaper-nvim
}

audio.binds = {}

return audio
