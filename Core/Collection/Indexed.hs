-- |
-- Module      : Core.Vector.Indexed
-- License     : BSD-style
-- Maintainer  : Vincent Hanquez <vincent@snarc.org>
-- Stability   : experimental
-- Portability : portable
--
{-# LANGUAGE DefaultSignatures #-}
{-# LANGUAGE FlexibleInstances #-}
module Core.Collection.Indexed
    ( IndexedCollection(..)
    ) where

import           Core.Internal.Base
import           Core.Collection.Element
import qualified Data.List

-- | Collection of elements that can indexed by int
class IndexedCollection c where
    (!) :: c -> Int -> Maybe (Element c)
    findIndex :: (Element c -> Bool) -> c -> Maybe Int

instance IndexedCollection [a] where
    (!) l n
        | n < 0     = Nothing
        | otherwise = case Data.List.drop n l of
                        []  -> Nothing
                        x:_ -> Just x
    findIndex = Data.List.findIndex
