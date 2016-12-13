{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.HashMap.Functor.Classes () where

import Data.Functor.Classes
import Data.Hashable        (Hashable)
import Data.HashMap.Strict  (HashMap, fromList, size, toList)

instance Eq2 HashMap where
    liftEq2 eqk eqv m n =
        size m == size n && liftEq (liftEq2 eqk eqv) (toList m) (toList n)

instance Eq k => Eq1 (HashMap k) where
    liftEq = liftEq2 (==)

instance Ord2 HashMap where
    liftCompare2 cmpk cmpv m n =
        liftCompare (liftCompare2 cmpk cmpv) (toList m) (toList n)

instance Ord k => Ord1 (HashMap k) where
    liftCompare = liftCompare2 compare

instance Show2 HashMap where
    liftShowsPrec2 spk slk spv slv d m =
        showsUnaryWith (liftShowsPrec sp sl) "fromList" d (toList m)
      where
        sp = liftShowsPrec2 spk slk spv slv
        sl = liftShowList2 spk slk spv slv

instance Show k => Show1 (HashMap k) where
    liftShowsPrec = liftShowsPrec2 showsPrec showList

instance (Eq k, Hashable k, Read k) => Read1 (HashMap k) where
    liftReadsPrec rp rl = readsData $
        readsUnaryWith (liftReadsPrec rp' rl') "fromList" fromList
      where
        rp' = liftReadsPrec rp rl
        rl' = liftReadList rp rl
