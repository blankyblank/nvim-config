vim.pack.add({Gh("monkoose/neocodeium")})

local neocodeium = require("neocodeium")
neocodeium.setup()
vim.keymap.set("i", "<A-f>", neocodeium.accept)
