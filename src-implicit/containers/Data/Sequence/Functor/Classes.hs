{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.Sequence.Functor.Classes () where

import Data.Functor.Classes
import Data.Sequence             (Seq)

instance Eq1 Seq where eq1 = (==)
instance Ord1 Seq where compare1 = compare
instance Show1 Seq where showsPrec1 = showsPrec
