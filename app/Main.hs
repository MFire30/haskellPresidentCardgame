module Main where

import Cards
import CardManipulation
import Players
import PlayerManipulation
import Menu
import Stack
import DataModels

-- Data for testing
p1 = createPlayer "P1" []
p2 = createPlayer "P2" []
p3 = createPlayer "P3" []
p4 = createPlayer "P4" []
p5 = createPlayer "P5" []

playerQueue = createQueue [p1, p2, p3, p4, p5]

main = putStrLn "Game Started"
