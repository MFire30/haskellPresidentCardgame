module MainGame (

) where

import Cards
import Players
import PlayerManipulation
import CardManipulation
import DataModels

playerTurn :: Player -> String -> Player
playerTurn player card = getCardFromPlayer (parseCard card) player

{- singleTurn :: Queue Player -> Stack Deck -> Queue Player
singleTurn queue deck = let
  pop = queuePop queue
  nextPlayer = fst pop
  in queue
-}

printPossible :: Deck -> Stack Deck -> IO ()
printPossible playerDeck gameStack = let
  popDeck = stackPop gameStack
  deckTop = head (fst popDeck)
  possibleCards  = getElegibleCards deckTop playerDeck
  in putStrLn (show possibleCards)
