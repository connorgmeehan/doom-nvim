local audio = {}

audio.settings = {}

audio.packages = {
  ["scnvim"] = {
    "davidgranstrom/scnvim",
    run = ":call scnvim#install()",
    config = require("molleweide.configs.scnvim"),
  },
}

audio.binds = {}

return audio
