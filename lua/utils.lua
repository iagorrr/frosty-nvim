--[[
        Auxiliary functions to set up neovim
--]]

local M = {}

function M.ensure_table(object)
    return type(object) == "table" and object or { object }
end

return M
