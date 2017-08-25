module Cards (
  getNewDeck
)
where

-- Uses deriving() for printing, comparison and ordenation
data CardValues = Two | Three | Four | Five | Six | Seven
                  | Eight | Nine | Ten | J | Q | K | A
                  deriving (Read, Show, Enum, Eq, Ord)

data CardSuits = Club | Diamond | Heart | Spade
                  deriving (Read, Show, Enum, Eq, Ord)

-- This data definition creates a card with two params.
-- It takes a CardValues "value" and a CardSuits "suits"
data GameCard = GameCard {value :: CardValues, suit :: CardSuits}
                  deriving(Read, Show, Eq)

-- Now, it's needed a way to tell if a card is greater or smaller than other
-- Example: instance (Class <- Ord) (Type <- GameCard) where
instance Ord GameCard where
  compare firstCard secondCard = compare (value firstCard, suit firstCard)
                                    (value secondCard, suit secondCard)

-- Defining the deck of GameCards
type Deck = [GameCard]

-- Creating the deck itself
getNewDeck :: Deck
getNewDeck = [GameCard val s | val <- [Two .. A], s <- [Club .. Spade]]
