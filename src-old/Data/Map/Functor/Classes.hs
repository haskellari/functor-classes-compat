{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.Map.Functor.Classes () where

import Data.Functor.Classes
import Data.Map             (Map)

instance Eq k => Eq1 (Map k) where eq1 = (==)
instance Ord k => Ord1 (Map k) where compare1 = compare
instance Show k => Show1 (Map k) where showsPrec1 = showsPrec
instance (Ord k, Read k) => Read1 (Map k) where readsPrec1 = readsPrec
