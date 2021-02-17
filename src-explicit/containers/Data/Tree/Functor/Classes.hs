{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.Tree.Functor.Classes () where

import Data.Functor.Classes
import Data.Monoid          (Monoid (..))
import Data.Tree

instance Eq1 Tree where
    liftEq eq (Node a fa) (Node b fb) =
        eq a b && liftEq (liftEq eq) fa fb

instance Ord1 Tree where
    liftCompare cmp (Node a fa) (Node b fb) =
        cmp a b `mappend` liftCompare (liftCompare cmp) fa fb

instance Show1 Tree where
    liftShowsPrec sp sl =
      let go _ (Node a fa) =
            ("Node {rootLabel = " ++) .
            sp 0 a .
            (", subForest = " ++) .
            liftShowsPrec go (liftShowList sp sl) 0 fa .
            ('}':)
      in go
