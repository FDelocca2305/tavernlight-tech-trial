function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))

    --check if the query was correct
    if resultId == false then
        print("Error in database query")
        return
    end

    -- iterates over the list of names and print them
    while db.next(resultId) do
        local guildName = db.getString(resultId, "name")
        print(guildName)
    end

    -- closes the query
    db.free(resultId)
end