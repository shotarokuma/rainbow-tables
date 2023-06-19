module Rainbow
  ( convertNLetter
  , pwReduce
  , chain
  , rainbowTable
  , gainPassword
  , findPassword
  , Hash
  ) where

import Data.Int
import qualified Data.Map as Map
import Data.Char (ord)
import Data.Maybe (Maybe(..))

import RainbowAssign (pwHash, toLetter)

type Hash = Int32
type Passwd = String

nLetters, pwLength :: Int
nLetters = 5  -- number of letters to use in passwords: 5 -> a-e
pwLength = 8  -- length of each password

convertNLetter :: Hash -> [Int]
convertNLetter hash = fromIntegral (hash `mod` fromIntegral nLetters) : convertNLetter (hash `div` 5)

pwReduce :: Hash -> Passwd
pwReduce hash = map toLetter (reverse convertList)
  where
    convertList = take pwLength (convertNLetter hash)

chain :: Int -> Passwd -> Hash
chain 0 w = pwHash w
chain h w = chain (h - 1) (pwReduce (pwHash w))

rainbowTable :: Int -> [Passwd] -> Map.Map Hash Passwd
rainbowTable _ [] = Map.empty
rainbowTable h (w : ws) = Map.insert (chain h w) w (rainbowTable h ws)

gainPassword :: Passwd -> Int -> Passwd
gainPassword password 0 = password
gainPassword password target = gainPassword (pwReduce (pwHash password)) (target - 1)

findPassword :: Map.Map Hash Passwd -> Int -> Hash -> Maybe Passwd
findPassword table 0 hash = Map.lookup hash table
findPassword table reminder hash =
  case Map.lookup hash table of
    Nothing -> findPassword table (reminder - 1) (pwHash (pwReduce hash))
    Just password -> Just (gainPassword password reminder)
