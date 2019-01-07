{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.Tree.Functor.Classes () where

import Data.Functor.Classes
import Data.Tree            (Tree(..))

instance Eq1 Tree where eq1 = (==)
instance Ord1 Tree where
  compare1 (Node a fa) (Node b fb) =
    compare a b `mappend` liftCompareList compare1 fa fb

liftCompareList :: (a -> a -> Ordering) -> [a] -> [a] -> Ordering
liftCompareList cmp = go
  where go [] [] = EQ
        go [] (_:_) = LT
        go (_:_) [] = GT
        go (a:as) (b:bs) = cmp a b `mappend` go as bs

instance Show1 Tree where showsPrec1 = showsPrec
