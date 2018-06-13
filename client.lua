--[[ 
	AnchorBoat
    Copyright (C) 2018  Thaisen
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.
    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ]]

local anchored = false
Citizen.CreateThread(function()
	while true do

		Wait(0)
		local ped = GetPlayerPed(-1)
		if IsControlJustPressed(1, 182) and not IsPedInAnyVehicle(ped)  then
			local boat  = GetVehiclePedIsIn(ped, true)
			if not anchored then
				SetBoatAnchor(boat, true)
				TriggerEvent("pNotify:SendNotification",{
				text = "Boat anchored!",
				type = "success",
				timeout = (3000),
				layout = "bottomCenter",
				queue = "global",
				animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
				killer = true,
				sounds = {
				sources = {"Anchordown.ogg"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
				volume = 0.1,
				conditions = {"docVisible"}  
				}  
				})
			else
				SetBoatAnchor(boat, false)
				TriggerEvent("pNotify:SendNotification",{
				text = "Boat not anchored anymore",
				type = "success",
				timeout = (3000),
				layout = "bottomCenter",
				queue = "global",
				animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
				killer = true,
				sounds = {
				sources = {"Anchorup.ogg"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
				volume = 0.1,
				conditions = {"docVisible"}  
				}  
				})
			end
			anchored = not anchored
		end
	end
end)
