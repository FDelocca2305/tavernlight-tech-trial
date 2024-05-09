void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId) {

    Player* player = g_game.getPlayerByName(recipient);

    //using smart pointer to prevent memory leaks
    std::unique_ptr<Player> newPlayer;

    if (!player) {
        //if player not exists create a new player
        newPlayer.reset(new Player(nullptr));

        if (!IOLoginData::loadPlayerByName(newPlayer.get(), recipient)) {
            return;
        }

        //assign the newPlayer created to the existing player if not found
        player = newPlayer.get();
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }

}