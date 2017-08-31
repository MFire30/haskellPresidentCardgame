module Players (
  createPlayer
) where

import Cards

-- Defining the possible player positions
-- Nedeed Enum, Eq and Ord for comparisons and ordenation
data PlayerPosition = SuperScum | Scum | Person | VicePresident | President
  deriving(Enum, Eq, Ord, Show)

-- Definition of a user: Has a 'name' and a bunch of 'cards'
data Player = Player {name :: String, userDeck :: Deck, position :: PlayerPosition}
  deriving(Eq, Show)

createPlayer :: String -> Deck -> Player
createPlayer nam dec = Player {name = nam, userDeck = dec, position = Person}
