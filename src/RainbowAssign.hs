module RainbowAssign where

import System.Random
import Data.List
import Data.Int
import qualified Data.Map as Map
-- modules needed for hashString
import Data.Bits
import Data.Char        ( ord )

-- types for clarity
type Hash = Int32
type Passwd = String

-- constant value 
pwLength, nLetters, width, height :: Int
filename :: FilePath
pwLength = 8            -- length of each password
nLetters = 5            -- number of letters to use in passwords: 5 -> a-e
width = 40              -- length of each chain in the table
height = 1000           -- number of "rows" in the table
filename = "table.txt"  -- filename to store the table

-- hashString function from GHC's Data.HashTable (adapted from file libraries/base/Data/HashTable.hs in GHC source)
hashString :: String -> Int32
hashString = foldl' f golden
   where f m c = fromIntegral (ord c) * magic + hashInt32 m
         magic = -559038737
         hashInt32 :: Int32 -> Int32
         hashInt32 x = mulHi x golden + x
         golden :: Int32
         golden = 1013904242 -- = round ((sqrt 5 - 1) * 2^32) :: Int32
         mulHi :: Int32 -> Int32 -> Int32
         mulHi a b = fromIntegral (r `shiftR` 32)
           where r :: Int64
                 r = fromIntegral a * fromIntegral b

-- the password hashing function
pwHash :: Passwd -> Hash
pwHash = hashString

-- return a list of n values from a..b (inclusive)
randomList :: (Random t) => (t, t) -> Int -> IO [t]
randomList (a,b) n =  do
    seed <- newStdGen
    let randomListGen (a0,b0) n0 = take n0 . unfoldr (Just . (randomR (a0,b0)))
    let rs = randomListGen (a,b) n seed
    return rs

-- return count random passwords, each of length len, chosen from the first nLetters
-- lowercase letters
randomPasswords :: Int -> Int -> Int -> IO [[Char]]
randomPasswords nLetters len count = do
  let lastLetter = (iterate succ 'a')!!(nLetters-1)
  chars <- randomList ('a',lastLetter) (len*count)
  return [take len $ drop (i*len) chars | i <- [0..count-1]]

-- return the (n+1)-th lowercase letter
toLetter :: Int -> Char
toLetter n = toEnum (97 + n)

-- build a rainbow table using your rainbowTable function, with random passwords of
-- length len chosen from the from the first nLett lowercase letters, with "height" 
-- chains of "width" w.
type RainbowFunction = Int -> [Passwd] -> Map.Map Hash Passwd
buildTable :: RainbowFunction -> Int -> Int -> Int -> Int -> IO (Map.Map Hash Passwd)
buildTable rainbowTable nLett len w h = do
  pws <- randomPasswords nLett len h
  return $ rainbowTable w pws

-- write the given rainbow table to the given filename.
writeTable :: Map.Map Hash Passwd -> FilePath -> IO ()
writeTable table filename = writeFile filename tableStr
  where tableStr = show $ Map.toList table

-- read a rainbow table from the given filename.
readTable :: FilePath -> IO (Map.Map Hash Passwd)
readTable fn = do 
  tableStr <- readFile fn
  let tableData = read tableStr
  return (Map.fromList tableData)


-- my code
convertNLetter :: Hash -> [Int]
convertNLetter h = fromIntegral (h `mod` fromIntegral nLetters) : convertNLetter (h `div` 5)

pwReduce:: Hash -> Passwd
pwReduce h =  map toLetter (reverse convertList)
  where convertList = take pwLength (convertNLetter h)

chain :: Int -> Passwd -> Hash
chain 0 w = pwHash w
chain h w = chain (h - 1) (pwReduce (pwHash w))

rainbowTable :: Int -> [Passwd] -> Map.Map Hash Passwd
rainbowTable _ [] = Map.empty
rainbowTable h (w:ws) = Map.insert (chain h w) w (rainbowTable h ws)