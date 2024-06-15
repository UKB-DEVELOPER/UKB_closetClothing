ESX = nil
local PlayerData = {}
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Base.ClientEvent, function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end

    PlayerData = ESX.GetPlayerData()
end)
local ResourceName = GetCurrentResourceName()

Citizen.CreateThread(function()
    while true do
        local sleep = 1000

        local playerCoords = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Closet.list) do
            local distance = #(playerCoords - v.coords)
            if distance < Closet.Marker.distance then
                sleep = 0

                DrawMarker(Closet.Marker.type, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0,
                    Closet.Marker.x, Closet.Marker.y, Closet.Marker.z, Closet.Marker.r, Closet.Marker.g,Closet.Marker.b, Closet.Marker.a, false,
                    true, 2, false, false, false, false)

                if distance < Closet.list[k].radius then
                    Notify.TextUI()
                    if IsControlJustReleased(0, 38) then
                        getCloset()
                        SetNuiFocus(true, true)
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

getCloset = function(cb)
    ESX.TriggerServerCallback(ResourceName .. ":GetCloset", function(result)
        if result then
            SendNUIMessage({
                action = 'openUI',
                closet = result
            })
        end
    end)
end

RegisterNUICallback("clothingUse", function(data)
    local pack = json.decode(data.clothing.skin)
    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerEvent('skinchanger:loadClothes', skin, pack)
        TriggerEvent('esx_skin:setLastSkin', pack)
        TriggerServerEvent('esx_skin:save', pack)
    end)
    Notify.UseChanged('success', data.clothing.name)
end)

RegisterNUICallback('CloseUI', function(data, cb)
    SendNUIMessage({
        action = 'closeUI'
    })
    SetNuiFocus(false, false)
    cb('ok')
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == ResourceName then
        SendNUIMessage({
            action = 'closeUI'
        })
        SetNuiFocus(false, false)
    end
end)