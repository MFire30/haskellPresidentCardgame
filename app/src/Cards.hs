module Cards (
  getNewDeck,
  getMaxCard,
  getMaxCardTwo,
  GameCard,
  Deck
)
where

import Data.List

-- Uses deriving() for printing, comparison and ordenation
data CardValues = Two | Three | Four | Five | Six | Seven
                  | Eight | Nine | Ten | J | Q | K | A
                  deriving (Read, Enum, Eq, Ord, Show)

-- Just a "parser" function to make data more simple
parserValue :: CardValues -> String
parserValue value = case value of
  Two -> "2"
  Three -> "3"
  Four -> "4"
  Five -> "5"
  Six -> "6"
  Seven -> "7"
  Eight -> "8"
  Nine -> "9"
  Ten -> "10"
  _ -> show value

data CardSuits = Club | Diamond | Heart | Spade
                  deriving (Read, Show, Enum, Eq, Ord)

-- Just a "parser" function to make data more simple
parserSuit :: CardSuits -> String
parserSuit suit = case suit of
  Club -> "C"
  Diamond -> "D"
  Heart -> "H"
  Spade -> "S"

-- This data definition creates a card with two params.
-- It takes a CardValues "value" and a CardSuits "suits"
data GameCard = GameCard {value :: CardValues, suit :: CardSuits}
                  deriving(Read, Eq)

-- Now, it's needed a way to tell if a card is greater or smaller than other
-- Example: instance (Class <- Ord) (Type <- GameCard) where
instance Ord GameCard where
  compare firstCard secondCard = compare (value firstCard, suit firstCard)
                                    (value secondCard, suit secondCard)

instance Show GameCard where
  show (GameCard value suit) = parserValue value ++ parserSuit suit

-- Defining the deck of GameCards
type Deck = [GameCard]

-- Creating the deck itself
getNewDeck :: Deck
getNewDeck = [GameCard val s | val <- [Two .. A], s <- [Club .. Spade]]

-- Defining a better way to show the Deck
printCard :: GameCard -> String
printCard (GameCard {value = a, suit = b}) = show a ++ "_" ++ show b

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

getACard :: Deck -> (GameCard, Deck)
getACard deck = let
 firstOne = head deck
 result = (firstOne, drop 1 deck)
 in result

