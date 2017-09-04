module DataModels(
  Queue,
  createQueue,
  queuePush,
  queuePop,
  queueSize
) where

-- Defining a generic queue data structure
-- Can be a queue of any type
-- This isn't performance focused
data Queue a = Queue [a]
  deriving(Show)

createQueue :: [a] -> Queue a
createQueue item = Queue item

queuePush :: a -> Queue a -> Queue a
queuePush item (Queue items) = Queue (items ++ [item])

-- Makes pop operation and returns a tuple
-- Output: (popItem, queueWithoutPopItem)
queuePop :: Queue a -> (a, Queue a)
queuePop (Queue items) = (head items, Queue (tail items))

queueSize :: Queue a -> Int
queueSize (Queue x) = length x
