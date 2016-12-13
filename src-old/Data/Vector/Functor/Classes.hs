{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.Vector.Functor.Classes () where

import Data.Functor.Classes
import Data.Vector          (Vector)

instance Eq1 Vector where eq1 = (==)
instance Ord1 Vector where compare1 = compare
instance Show1 Vector where showsPrec1 = showsPrec
instance Read1 Vector where readsPrec1 = readsPrec
