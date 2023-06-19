module RainbowTable (testRainbowTable) where
import Test.HUnit
import Rainbow (rainbowTable)
import qualified Data.Map as Map
 
testRainbowTable :: Test
testRainbowTable = 
  "rainbowTable tests" ~:
  [ 
    rainbowTable 0 ["abcdeabc"] @?=  Map.fromList [(1726491528,"abcdeabc")],
    rainbowTable 1 ["abcdeabc"] @?=  Map.fromList [(1477708406,"abcdeabc")],
    rainbowTable 40 ["abcdeabc"] @?=  Map.fromList [(-1993856529,"abcdeabc")],
    rainbowTable 40 ["abcdeabc", "aabbccdd", "eeeeeeee"] @?=  Map.fromList [(-1993856529,"abcdeabc"),(1781092264,"aabbccdd"),(2135711886,"eeeeeeee")],
    rainbowTable 2 ["dccdecee","cdeccaed","acbcaeec","eeeeaebd","ccdccbeb"] @?= Map.fromList [(-1862546954,"ccdccbeb"),(-716915723,"cdeccaed"),(1305042273,"acbcaeec"),(1629794057,"eeeeaebd"),(1802158710,"dccdecee")],
    rainbowTable 0 ["acdgcddh","fcfeggeh","ebfeecbe"] @?= Map.fromList[(-397497993,"acdgcddh"),(501873960,"fcfeggeh"),(1832318221,"ebfeecbe")],
    rainbowTable 1 ["acdgcddh","fcfeggeh","ebfeecbe"] @?= Map.fromList[(-743605312,"ebfeecbe"),(-217206443,"fcfeggeh"),(689654816,"acdgcddh")],
    rainbowTable 2 ["acdgcddh","fcfeggeh","ebfeecbe"] @?= Map.fromList[(-2064295851,"fcfeggeh"),(-1060984018,"acdgcddh"),(-417807727,"ebfeecbe")],
    rainbowTable 40 ["acdgcddh","fcfeggeh","ebfeecbe"] @?= Map.fromList[(-1097908233,"acdgcddh"),(967401793,"fcfeggeh"),(1209123232,"ebfeecbe")]
    -- more tests for different constatns
    -- rainbowTable 0 ["cifei","pcmda","dhbgd","lpnei"] @?= Map.fromList [(-1503203201,"lpnei"),(-1487366839,"cifei"),(-640214828,"pcmda"),(2079210298,"dhbgd")],
    -- rainbowTable 1 ["cifei","pcmda","dhbgd","lpnei"] @?= Map.fromList [(-954349282,"cifei"),(-489260427,"dhbgd"),(1393638303,"lpnei"),(1735727550,"pcmda")],
    -- rainbowTable 8 ["cifei","pcmda","dhbgd","lpnei"] @?= Map.fromList [(-1124643307,"lpnei"),(-302912064,"dhbgd"),(343965490,"pcmda"),(1405018158,"cifei")],
    -- rainbowTable 60 ["cifei","pcmda","dhbgd","lpnei"] @?= Map.fromList [(-1280634116,"lpnei"),(-973728692,"pcmda"),(-53714259,"cifei"),(560614378,"dhbgd")]
  ]
