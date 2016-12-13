{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.IntMap.Functor.Classes () where

import Data.Functor.Classes
import Data.IntMap          (IntMap, fromList, size, toList)

instance Eq1 IntMap where
    liftEq eq m n =
        size m == size n && liftEq (liftEq eq) (toList m) (toList n)

instance Ord1 IntMap where
    liftCompare cmp m n =
        liftCompare (liftCompare cmp) (toList m) (toList n)

instance Show1 IntMap where
    liftShowsPrec sp sl d m =
        showsUnaryWith (liftShowsPrec sp' sl') "fromList" d (toList m)
      where
        sp' = liftShowsPrec sp sl
        sl' = liftShowList sp sl

instance Read1 IntMap where
    liftReadsPrec rp rl = readsData $
        readsUnaryWith (liftReadsPrec rp' rl') "fromList" fromList
      where
        rp' = liftReadsPrec rp rl
        rl' = liftReadList rp rl
