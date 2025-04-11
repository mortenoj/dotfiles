-- Global settings
require("settings")

-- Key mappings
--
-- Needs to be loaded before plugins because Lazy.nvim recommends at least
-- binding the leader keys before initializing lazy
require("keymaps")

-- Initialize Lazy.nvim (plugins)
require("config.lazy")
