require("erick.core.keymaps")
require("erick.core.options")
require("erick.core.others")

local home = os.getenv("HOME")
vim.opt.rtp:append(home .. "/web/personal/tools")
package.path = package.path .. ";" .. home .. "/web/personal/tools/?.lua"
require("tools").setup()
