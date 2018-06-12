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



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
	local ped = GetPlayerPed( -1 )
	local vehicle = GetVehiclePedIsIn( ped, false )
	local vehicleClass = GetVehicleClass(vehicle)

	if not IsEntityDead( ped ) then 
		if IsPedSittingInAnyVehicle( ped )  then 
			if vehicleClass == 14 then
				if IsControlPressed(2, 303) then
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
				FreezeEntityPosition(vehicle ,true)
				end 
			end 
		end 
		end
	end 
end )

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(120)
	local ped = GetPlayerPed( -1 )
	local vehicle = GetVehiclePedIsIn( ped, false )
	local vehicleClass = GetVehicleClass(vehicle)
	
	if not IsEntityDead( ped ) then 
		if IsPedSittingInAnyVehicle( ped )  then 
			if vehicleClass == 14 then 
				if IsControlPressed(2, 246) then
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
				SetTimeout(4000, function()
				FreezeEntityPosition(vehicle ,false)
				end)
			end
		end 
		end
	end 
	end
end )