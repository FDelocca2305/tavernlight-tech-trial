function removeMemberFromPlayerPartyByName(playerId, membernameToRemove)
    --added local to player
    local player = Player(playerId)

    --check if player is no nil
    if not player then
        print("player not found")
        return
    end

    local party = player:getParty()

    --check if party is not nil
    if not party then
        print("player doesn't have a party")
        return
    end

    --I create the member here and not in the if
    local memberToRemove = Player(membernameToRemove)

    --check if member exists
    if not memberToRemove then
        print("member not found")
        return
    end
    
    --remove the player creation from the if
    --I'm guessing the getMembers method returns Id:membername as pair
    for k,v in pairs(party:getMembers()) do
        if v == membernameToRemove then
            party:removeMember(memberToRemove)
            --I exit the loop once the member is removed
            break
        end
    end

end