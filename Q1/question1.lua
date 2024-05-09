--CONST for the storage
local STORAGE = 1000

local function releaseStorage(player)
    --We can check if player is nil but we are only calling from onLogout here and is already checking if player is not nil  
    player:setStorageValue(STORAGE, -1)

    --It should be like 

    --if player then
    --    player:setStorageValue(STORAGE, -1)
    --end

end

function onLogout(player)

    --Check if player is not nil first
    if not player then
        print("Player not exists")
        return true
    end

    if player:getStorageValue(STORAGE) == 1 then
        addEvent(releaseStorage, 1000, player)
    end

    return true
end