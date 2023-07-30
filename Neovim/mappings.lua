---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { "$a", "insert at end of line", opts = { nowait = true } },
    ["gj"] = { "<C-d>zz", "Jump half page down and center cursor", opts = { nowait = true } },
    ["gk"] = { "<C-u>zz", "Jump half page up and center cursor", opts = { nowait = true } },
    ["<C-/>"] = { "<leader>/", "Comment block", opts = { nowait = true } },
  },
}

-- more keybinds!

return M
