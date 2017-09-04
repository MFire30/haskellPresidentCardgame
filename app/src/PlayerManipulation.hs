module PlayerManipulation(
  createPlayerQueue,
  giveCardsToPlayers,
  calculatePlayerPos,
  calculatePosList,
  getCardFromPlayer
) where

import Cards
import CardManipulation
import Players
import DataModels

createPlayerQueue :: Player -> Queue Player
createPlayerQueue player = createQueue [player]

-- Function checks for a card in player and return a new player without the cardText
getCardFromPlayer :: GameCard -> Player -> Player
getCardFromPlayer card player
  | (isCardInDeck card playerDeck) = let
    cardTuple = getCardFromDeck card playerDeck
    newPlayer = createPlayer playerName (snd cardTuple)
    result = newPlayer
    in result
  | otherwise = player
  where
    playerDeck = getPlayerDeck player
    playerName = getPlayerName player

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

-- This function calculates the player position result in the end of the game
-- Input: Queue Length, Player Index
-- Output: A PlayerPosition
calculatePlayerPos :: Int -> Int -> PlayerPosition
calculatePlayerPos queueLen playerIndex
  | (playerIndex == maxIndx) = createPos "SM"
  | (playerIndex == maxIndx - 1) = createPos "SC"
  | (playerIndex >= 2) && (playerIndex < maxIndx -1) = createPos "PR"
  | (playerIndex == 1) = createPos "VP"
  | (playerIndex == 0) = createPos "P"
  where maxIndx = queueLen - 1

calculatePosList :: Queue Player -> Queue Player
calculatePosList players = let
  itensList = getQueueList players
  listLen = length itensList
  indexes = [0..listLen-1]

  positions = [calculatePlayerPos listLen y | y <- indexes]
  newPlayers = [givePlayerPos (itensList !! y) (positions !! y)| y <- indexes]
  in createQueue newPlayers
