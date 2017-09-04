module PlayerManipulation(
  createPlayerQueue,
  giveCardsToPlayers
) where

import Cards
import CardManipulation
import Players
import DataModels

createPlayerQueue :: Player -> Queue Player
createPlayerQueue player = createQueue [player]

-- Given a queue of players, this function gives a card to a player, recursively
-- Stop condition = Empty deck
-- Output: Queue with updated players
-- OBS: This is definitely not focused on performance!
giveCardsToPlayers :: Queue Player -> Deck -> Queue Player
giveCardsToPlayers players [] = players
giveCardsToPlayers players deck = let
  -- Gets a player and a card -> Tuples
  pop = queuePop players
  cardTuple = getACard deck

  player = fst pop
  playerName = getPlayerName player
  playerDeck = getPlayerDeck player
  playerPos = getPlayerPos player

  newCard = fst cardTuple
  newDeck = newCard : playerDeck
  remainingDeck = snd cardTuple
  newPlayer = createPlayer playerName newDeck

  oldQueue = snd pop
  newQueue = queuePush newPlayer oldQueue
  result = giveCardsToPlayers newQueue remainingDeck
  in result
