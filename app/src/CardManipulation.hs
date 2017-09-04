module CardManipulation (
  getMaxCard,
  getMaxCardTwo,
  getACard,
  parseCard,
  getCardFromDeck,
  getElegibleCards
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

-- This functions looks for a card in a deck and returns its position
getCardIndex :: GameCard -> Deck -> Int
getCardIndex card deck = head (elemIndices card deck)

-- Get the index for the higher card on the deck
getMaxCardIndex :: Deck -> Int
getMaxCardIndex deck = head (elemIndices (maximum deck) deck)

-- This function takes the card input and removes it from a deck
-- Input: card, deck
-- Output: Tuple (Found card, New deck)
getCardFromDeck :: GameCard -> Deck -> (GameCard, Deck)
getCardFromDeck card deck = let
  newList = [item | item <- deck, item /= card]
  foundCard = filter (==card) deck
  in (head foundCard, newList)

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
-- getACard :: Deck -> (GameCard, Deck)
-- getACard deck@(x:xs) = (x, xs)
-- Tuple: (Card, DeckWithoutTheCard)
getACard :: Deck -> (GameCard, Deck)
getACard deck = let
 firstOne = head deck
 result = (firstOne, drop 1 deck)
 in result

getElegibleCards :: GameCard -> Deck -> Deck
getElegibleCards card deck = let
 elegibleCards = filter (>card) deck
 in elegibleCards
