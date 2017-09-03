module Stack (
  push
) where

import Control.Monad.State

type Stack = [Int]

-- Pop function on the stack
pop :: State Stack Int
pop = do
 x:xs <- get
 put xs
 return x

 -- Push function on the stack
push :: Int -> State Stack ()
push a = do
 xs <- get
 put (a:xs)
 return ()

pop1 = runState pop [1..5]
push1 = runState (push 1) [2..5]

-- Some examples for stacks:
stackManip :: State Stack (Int)
stackManip = do
 push 3
 a <- pop
 pop

stackManip1 = runState stackManip [5,8,2,1]
stackManip2 = runState stackManip [1,2,3,4]

stackStuff :: State Stack ()
stackStuff = do
   push 3
   push 8

stackStuff1 = runState stackStuff [9,0,2,1,0]
stackStuff2 = runState stackStuff [5,4,3,2,1]

moreStack :: State Stack ()
moreStack = do
 a <- stackManip
 if a == 100
  then stackStuff
  else return ()

moreStack1 = runState moreStack [100,9,0,2,1,0]
moreStack2 = runState moreStack [9,0,2,1,0]

stackyStack :: State Stack ()
stackyStack = do
 stackNow <- get
 if stackNow == [1,2,3]
  then put [8,3,1]
  else put [9,2,1]

stackyStack1 = runState stackyStack [1,2,3]
stackyStack2 = runState stackyStack [10,20,30,40]
