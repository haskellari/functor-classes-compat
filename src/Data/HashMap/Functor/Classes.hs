{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.HashMap.Functor.Classes () where

import Data.Functor.Classes
import Data.Hashable        (Hashable)
import Data.HashMap.Strict  (HashMap, fromList, size, toList)

import qualified Data.Map                 as M
import           Data.Map.Functor.Classes ()

-- | Unordered-containers don't export internals, so we cannot write correct `Eq2`
-- instance. For the same reason, the context is over-restrictive too.
instance Ord k => Eq1 (HashMap k) where
    liftEq eqv m n =
        size m == size n && equals eqv m n

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

-------------------------------------------------------------------------------
-- unordered-containers don't expose internals, so this is difficult

equals
    :: Ord k
    => (v -> v' -> Bool)
    -> HashMap k v -> HashMap k v'
    -> Bool
equals eqv m n = liftEq eqv (M.fromList $ toList m) (M.fromList $ toList n)
