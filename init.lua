-- tips/init.lua
-- Send tips to newcomers
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

tips = {}
tips.internal = {}
tips.internal.logger = logging.logger("tips")
tips.internal.S = core.get_translator("tips")

local MP = core.get_modpath("tips")
for _, name in ipairs({
    "storage",
    "api",
}) do
    dofile(MP .. "/src/" .. name .. ".lua")
end

tips.internal = nil
