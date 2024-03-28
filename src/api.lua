-- tips/src/api.lua
-- register and callbacks
--[[
    tips: Send tips to newcomers
    Copyright (C) 2024  1F616EMO

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
]]

local _int = tips.internal
local logger = _int.logger:sublogger("api")

tips.registered_tips = {}
function tips.register_tips(id, tips_string)
    tips.registered_tips[id] = tips_string
end

function tips.send_tips(name, id)
    if minetest.get_player_by_name(name) and tips.registered_tips[id] then
        minetest.chat_send_player(name, minetest.colorize("blue", S("[tips] @1", tips.registered_tips[id])))
    end
end

function tips.unlock_tips_no_send(name, id)
    if not tips.data[name] then
        tips.data[name] = {}
    end
    tips.data[name][id] = true
    logger:action("Unlocked tip " .. id .. " for " .. name)
end

function tips.unlock_tips(name, id)
    if not tips.data[name] then
        tips.data[name] = {}
    end

    if not tips.data[name][id] then
        tips.send_tips(name, id)
        tips.data[name][id] = true
        logger:action("Sent and unlocked tip " .. id .. " for " .. name)
    end
end
