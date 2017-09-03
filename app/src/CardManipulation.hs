module CardManipulation (
  getMaxCard,
  getMaxCardTwo,
  getACard,
  parseCard
) where

import Cards
import Data.List

-- Creates a card based on user input
parseCard :: String -> GameCard
parseCard cardText = let
  strLen = length cardText
  splitTuple = case strLen of
    2 -> splitAt 1 cardText
    3 -> splitAt 2 cardText
    _ -> splitAt 0 "ERROR"
  newCard = createCard splitTuple
  in newCard

-- Get the index for the higher card on the deck
getMaxCardIndex :: Deck -> Int
getMaxCardIndex deck = head (elemIndices (maximum deck) deck)

-- Removes the card and puts on a tuple the rest
-- Input: Deck
-- Output: Tuple (MaxCard, DeckWithOutMaxCard)
getMaxCard :: Deck -> (GameCard, Deck)
getMaxCard deck = let
  index = getMaxCardIndex deck
  maxCard = deck !! index
  splitDeck = splitAt index deck
  remainingDeck = fst splitDeck ++ (drop 1 (snd splitDeck))
  result = (maxCard, remainingDeck)
  in result

-- Same ideia as getMaxCard, but taking 2 cards
getMaxCardTwo :: Deck -> (Deck, Deck)
getMaxCardTwo deck = let
  firstRun = getMaxCard deck
  secondRun = getMaxCard (snd firstRun)
  -- Does not run with ++ and no list "[]"
  result = (fst firstRun : fst secondRun : [], snd secondRun)
  in result

-- This function gets the first card in the deck and retuns a tuple
-- Tuple: (Card, DeckWithoutTheCard)
getACard :: Deck -> (GameCard, Deck)
getACard deck = let
 firstOne = head deck
 result = (firstOne, drop 1 deck)
 in result
