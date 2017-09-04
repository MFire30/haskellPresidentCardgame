module Players (
  createPlayer,
  getPlayerDeck,
  getPlayerName,
  getPlayerPos,
  givePlayerPos,
  createPos,
  Player,
  PlayerPosition
) where

import Cards

-- Defining the possible player positions
-- Nedeed Enum, Eq and Ord for comparisons and ordenation
data PlayerPosition = ScumMaster | Scum | Person | VicePresident | President
  deriving(Enum, Eq, Ord, Show)

-- Definition of a user: Has a 'name' and a bunch of 'cards'
data Player = Player {name :: String, userDeck :: Deck, position :: PlayerPosition}
  deriving(Eq, Show)

createPlayer :: String -> Deck -> Player
createPlayer nam dec = Player {name = nam, userDeck = dec, position = Person}

givePlayerPos :: Player -> PlayerPosition -> Player
givePlayerPos player pos = Player {name = name player, userDeck = userDeck player,
  position = pos}

-- This function is a gambiarra
-- Parses a PlayerPosition
createPos :: String -> PlayerPosition
createPos s = case s of
  "SM" -> ScumMaster
  "SC" -> Scum
  "PR" -> Person
  "VP" -> VicePresident
  "P" -> President

-- Get methods
getPlayerDeck :: Player -> Deck
getPlayerDeck player = userDeck player

getPlayerName :: Player -> String
getPlayerName player = name player

getPlayerPos :: Player -> PlayerPosition
getPlayerPos player = position player
