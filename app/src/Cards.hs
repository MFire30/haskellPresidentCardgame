module Cards (
  getNewDeck,
  createCard,
  GameCard,
  Deck
)
where

import Data.List

-- This enum represents the possible card values
-- Uses deriving() for printing, comparison and ordenation
data CardValues = Two | Three | Four | Five | Six | Seven
                  | Eight | Nine | Ten | J | Q | K | A
                  deriving (Read, Enum, Eq, Ord, Show)

-- This enum represents the possible card suits
data CardSuits = Club | Diamond | Heart | Spade
  deriving (Read, Show, Enum, Eq, Ord)

-- This data definition creates a card with two params.
-- It takes a CardValues "value" and a CardSuits "suits"
data GameCard = GameCard {value :: CardValues, suit :: CardSuits}
  deriving(Read, Eq)

-- Defining the deck of GameCards
type Deck = [GameCard]

-- Now, it's needed a way to tell if a card is greater or smaller than other
-- Example: instance (Class <- Ord) (Type <- GameCard) where
instance Ord GameCard where
  compare firstCard secondCard = compare (value firstCard)
                                    (value secondCard)

instance Show GameCard where
  show (GameCard value suit) = showValue value ++ showSuit suit

-- Just a "parser" function to make data more simple
showValue :: CardValues -> String
showValue value = case value of
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

-- Just a "parser" function to make data more simple
showSuit :: CardSuits -> String
showSuit suit = case suit of
  Club -> "C"
  Diamond -> "D"
  Heart -> "H"
  Spade -> "S"

-- This function converts a string to a possible card value
stringToValue :: String -> CardValues
stringToValue s = case s of
  "2" -> Two
  "3" -> Three
  "4" -> Four
  "5" -> Five
  "6" -> Six
  "7" -> Seven
  "8" -> Eight
  "9" -> Nine
  "10" -> Ten
  "J" -> J
  "Q" -> Q
  "K" -> K
  "A" -> A

-- This function converts a string to a suit
stringToSuit :: String -> CardSuits
stringToSuit s = case s of
  "C" -> Club
  "D" -> Diamond
  "H" -> Heart
  "S" -> Spade

-- Creates a new CardSuits
createCard :: (String, String) -> GameCard
createCard tuple = GameCard {value = stringToValue (fst tuple),
  suit = stringToSuit (snd tuple)}

-- Creating the deck itself
getNewDeck :: Deck
getNewDeck = [GameCard val s | val <- [Two .. A], s <- [Club .. Spade]]
