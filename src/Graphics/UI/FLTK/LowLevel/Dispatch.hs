{-# LANGUAGE GADTs, MultiParamTypeClasses, FunctionalDependencies, FlexibleInstances, UndecidableInstances, FlexibleContexts, OverlappingInstances, ScopedTypeVariables, EmptyDataDecls #-}
module Graphics.UI.FLTK.LowLevel.Dispatch
       (
         FindOp,
         FindObj,
         Match,
         Op,
         Same,
         Different,
         dispatch,
         runOp,
         castTo
       )
where
import Graphics.UI.FLTK.LowLevel.Fl_Types

-- Type level function where `b` is Same
-- if `x` and `y` are equal and `Different`
-- if not.
data Same
data Different
class TypeEqual x y b | x y -> b
instance TypeEqual a a Same
instance Different ~ b => TypeEqual x y b

-- Move down a nested type hierarchy
-- eg. Tail (w (x (y (z ())))) (x (y (z ())))
class Tail aas as | aas -> as
instance Tail (a as) as
instance (r ~ ()) => Tail () r

-- Test whether a given nested type contains
-- a type
-- eg. Contains (w (x (y (z ())))) (y ()) Same
--     Contains (w (x (y (z ())))) (a ()) Different
class Contains' a b match r | a b match -> r
instance (Tail aas as, Contains as b r) => Contains' aas b Different r
instance (r ~ Same) => Contains' a b Same r

class Contains as a r | as a -> r
instance (TypeEqual (a ()) b match, Contains' (a as) b match r) => Contains (a as) b r
instance Contains () b Different

-- Move down the "object" hierarchy
-- eg. Downcast Rectangle Shape
class Downcast aas as | aas -> as
instance Downcast (a fs as) as
instance Downcast Base Base

-- Find an the first "object" with given
-- associated method in the hierarchy.
data Match a
data NoFunction a
class FindOp' a b c r | a b c -> r
instance (Downcast aas as, FindOp as f r) => FindOp' aas f Different r
instance (r ~ (Match a)) => FindOp' a b Same r

class FindOp a b c | a b -> c
instance (Contains fs f match, FindOp' (a fs as) f match r) => FindOp (a fs as) f r
instance FindOp Base f (NoFunction f)

-- Find the first "object" of the given type
-- in the hierarchy.
class FindObj' a b c r | a b c -> r
instance (Downcast aas as, FindObj as o r) => FindObj' aas o Different r
instance (r ~ Same) => FindObj' a b Same r

class FindObj a b c | a b -> c
instance (TypeEqual (a () ()) (o () ()) match, FindObj' (a fs as) (o ofs oos) match r) => FindObj (a fs as) (o ofs oos) r
instance FindObj Base o Different

-- Implementations of methods on various types
-- of objects
class Op op s impl | op s -> impl where
    runOp :: op -> (Ref s) -> impl

-- Arbitrarily cast from one thing to another
-- Probably should add some safety here ...
class CastTo a b r where castTo :: Ref a -> Ref r
instance CastTo a b r where castTo (Ref x) = (Ref x)

-- Given some "object" and a "function" dispatch to the
-- right implementation.
dispatch :: forall a r op impl. (FindOp a op (Match r), Op op r impl) => op -> Ref a -> impl
dispatch _ refA = runOp (undefined :: op) ((castTo refA) :: Ref r)
