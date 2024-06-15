ESX = nil
TriggerEvent(Base.ServerEvent, function(obj)
    ESX = obj
end)
local ResourceName = GetCurrentResourceName()

ESX.RegisterServerCallback(ResourceName..':GetCloset', function(src, cb)
    local xPlayer = ESX.GetPlayerFromId(src)
    local data = Queries.getCloset(xPlayer)
    cb(data)
 end)