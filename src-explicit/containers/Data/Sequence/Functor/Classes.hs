{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.Sequence.Functor.Classes () where

import Data.Functor.Classes
import Data.Foldable             (toList)
import Data.Sequence             (Seq, length)

instance Eq1 Seq where
    liftEq eq m n =
        Data.Sequence.length m == Data.Sequence.length n &&
        liftEq eq (toList m) (toList n)

instance Ord1 Seq where
    liftCompare cmp m n =
        liftCompare cmp (toList m) (toList n)

instance Show1 Seq where
    liftShowsPrec sp sl d m =
        showsUnaryWith (liftShowsPrec sp sl) "fromList" d (toList m)
