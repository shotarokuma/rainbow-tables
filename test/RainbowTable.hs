module RainbowTable (testRainbowTable) where
import Test.HUnit
import RainbowAssign (rainbowTable)
import qualified Data.Map as Map
 
testRainbowTable :: Test
testRainbowTable = 
  "rainbowTable tests" ~:
  [ 
    rainbowTable 0 ["abcdeabc"] @?=  Map.fromList [(1726491528,"abcdeabc")],
    rainbowTable 1 ["abcdeabc"] @?=  Map.fromList [(1477708406,"abcdeabc")],
    rainbowTable 40 ["abcdeabc"] @?=  Map.fromList [(-1993856529,"abcdeabc")],
    rainbowTable 40 ["abcdeabc", "aabbccdd", "eeeeeeee"] @?=  Map.fromList [(-1993856529,"abcdeabc"),(1781092264,"aabbccdd"),(2135711886,"eeeeeeee")],
    rainbowTable 2 ["dccdecee","cdeccaed","acbcaeec","eeeeaebd","ccdccbeb"] @?= Map.fromList [(-1862546954,"ccdccbeb"),(-716915723,"cdeccaed"),(1305042273,"acbcaeec"),(1629794057,"eeeeaebd"),(1802158710,"dccdecee")]
  ]
