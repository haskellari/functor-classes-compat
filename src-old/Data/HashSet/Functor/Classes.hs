{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.HashSet.Functor.Classes () where

import Data.Functor.Classes
import Data.HashSet         (HashSet)

instance Show1 HashSet where showsPrec1 = showsPrec
