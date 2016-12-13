{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.Set.Functor.Classes () where

import Data.Functor.Classes
import Data.Set             (Set, size, toList)

instance Eq1 Set where
    liftEq eq m n =
        size m == size n && liftEq eq (toList m) (toList n)

instance Ord1 Set where
    liftCompare cmp m n =
        liftCompare cmp (toList m) (toList n)

instance Show1 Set where
    liftShowsPrec sp sl d m =
        showsUnaryWith (liftShowsPrec sp sl) "fromList" d (toList m)
