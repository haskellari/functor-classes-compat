{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.HashMap.Functor.Classes () where

import Data.Functor.Classes
import Data.Hashable        (Hashable)
import Data.HashMap.Strict  (HashMap)

instance Eq k => Eq1 (HashMap k) where eq1 = (==)
instance Show k => Show1 (HashMap k) where showsPrec1 = showsPrec
instance (Eq k, Hashable k, Read k) => Read1 (HashMap k) where readsPrec1 = readsPrec
