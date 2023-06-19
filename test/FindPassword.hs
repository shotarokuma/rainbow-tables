module FindPassword (testFindPassword) where
import Test.HUnit
import RainbowAssign (findPassword, rainbowTable)


testFindPassword :: Test
testFindPassword =
  "findPassword tests" ~:
  [ 
    "Valid password" ~:
      [ "Valid input 1" ~: do
          let table = rainbowTable 40 ["abcdeabc", "aabbccdd", "eeeeeeee"]
          findPassword table 40 1726491528 @?= Just "abcdeabc"
      , "Valid input 2" ~: do
          let table = rainbowTable 40 ["abcdeabc", "aabbccdd", "eeeeeeee"]
          findPassword table 40 (-206342227) @?= Just "dbddecab"
      ]
    , "Invalid password" ~:
      [ "Invalid input 1" ~: do
          let table = rainbowTable 40 ["abcdeabc", "aabbccdd", "eeeeeeee"]
          findPassword table 40 1726491529 @?= Nothing
      , "Invalid input 2" ~: do
          let table = rainbowTable 40 ["abcdeabc", "aabbccdd", "eeeeeeee"]
          findPassword table 40 0 @?= Nothing
      ]
  ]




