{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.Vector.Functor.Classes () where

import Data.Functor.Classes
import Data.Vector          (Vector, fromList, length, toList)

instance Eq1 Vector where
    liftEq eq m n =
        Data.Vector.length m == Data.Vector.length n && liftEq eq (toList m) (toList n)

instance Ord1 Vector where
    liftCompare cmp m n =
        liftCompare cmp (toList m) (toList n)

instance Show1 Vector where
    liftShowsPrec _sp sl _d m = sl (toList m)

instance Read1 Vector where
    liftReadsPrec _rp rl _d s =
        [ (fromList l, s') | (l, s') <- rl s ]
