{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.HashSet.Functor.Classes () where

import Data.Functor.Classes
import Data.HashSet         (HashSet, toList)

instance Show1 HashSet where
    liftShowsPrec sp sl d m =
        showsUnaryWith (liftShowsPrec sp sl) "fromList" d (toList m)
