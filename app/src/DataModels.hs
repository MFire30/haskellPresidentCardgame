module DataModels(
  Queue,
  Stack,
  createQueue,
  createStack,
  queuePush,
  stackPush,
  queuePop,
  stackPop,
  queueSize,
  stackSize,
  getQueueList
) where

-- Defining a generic queue data structure
-- Can be a queue of any type
-- This isn't performance focused
data Queue a = Queue [a]
  deriving(Show)

data Stack a = Stack [a]
  deriving(Show)

  -- ------------ Queue Operations --------------------
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

createStack :: [a] -> Stack a
createStack item = Stack item

getQueueList :: Queue a -> [a]
getQueueList (Queue x) = x

-- ------------ Stack Operations --------------------
stackPush :: a -> Stack a -> Stack a
stackPush item (Stack items) = Stack ([item] ++ items)

stackPop :: Stack a -> (a, Stack a)
stackPop (Stack items) = (head items, Stack(tail items))

stackSize :: Stack a -> Int
stackSize (Stack x) = length x
