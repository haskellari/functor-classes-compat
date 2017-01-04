{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.IntMap.Functor.Classes () where

import Data.Functor.Classes
import Data.IntMap          (IntMap)

instance Eq1 IntMap where eq1 = (==)
instance Ord1 IntMap where compare1 = compare
instance Show1 IntMap where showsPrec1 = showsPrec
instance Read1 IntMap where readsPrec1 = readsPrec
