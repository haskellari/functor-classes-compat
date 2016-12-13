{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.Set.Functor.Classes () where

import Data.Functor.Classes
import Data.Set             (Set)

instance Eq1 Set where eq1 = (==)
instance Ord1 Set where compare1 = compare
instance Show1 Set where showsPrec1 = showsPrec
