module SelfTest () where

import qualified Data.Map
import qualified Data.Set
import qualified Data.IntMap
import qualified Data.Sequence
import qualified Data.Tree

import Data.Map.Functor.Classes ()
import Data.Set.Functor.Classes ()
import Data.IntMap.Functor.Classes ()
import Data.Sequence.Functor.Classes ()
import Data.Tree.Functor.Classes ()

import Data.Functor.Classes (eq1)

_test1 :: Bool
_test1 = eq1 (Data.Map.singleton 'x' 'y') (Data.Map.singleton 'x' 'y')

_test2 :: Bool
_test2 = eq1 (Data.Set.singleton 'x') (Data.Set.singleton 'x')

_test3 :: Bool
_test3 = eq1 (Data.IntMap.singleton 1 'y') (Data.IntMap.singleton 1 'y')

_test4 :: Bool
_test4 = eq1 (Data.Sequence.singleton 'x') (Data.Sequence.singleton 'x')

_test5 :: Bool
_test5 = eq1 (Data.Tree.Node 'x' []) (Data.Tree.Node 'x' [])
