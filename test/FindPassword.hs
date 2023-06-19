module FindPassword (testFindPassword) where

import Test.HUnit
import Rainbow (findPassword, rainbowTable, Hash)

testFindPassword :: Test
testFindPassword =
  "findPassword tests" ~:
  [ 
    "Valid password" ~:
      [ "Valid input 1" ~: do
          let table = rainbowTable width ["acdgcddh","fcfeggeh","ebfeecbe"]
          findPassword table width (19040862 :: Hash) @?= Just "adbdcdba"
      , "Valid input 2" ~: do
          let table = rainbowTable width ["acdgcddh","fcfeggeh","ebfeecbe"]
          findPassword table width (967401793 :: Hash) @?= Just "cbaebebe"
      , "Valid input 3" ~: do
          let table = rainbowTable width ["acdgcddh","fcfeggeh","ebfeecbe"]
          findPassword table width (1832318221 :: Hash) @?= Just "ebfeecbe"
      , "Valid input 4" ~: do
          let table = rainbowTable width["aabeadab","aacbcced","abdcdead","abeebdac","acbeaece","baaceacb","baaeceac","bbccceeb","beadeeeb","bebabebe","beccdece","cacdabbd","cdaaadca","cedaaaee","daeaadcc","dbbaecee","dbdaeded","ddaacbda","ddaddaac","ddbbccad","ddddaedb","decdbdbd","deedaedb","eaccaedb","ebbabede","edabeade","edddcecd","edeacbca","edeeebdb","eeadbeed"]
          findPassword table width (-2055206335 :: Hash) @?= Just "dabbbcbe"
      , "Valid input 5" ~: do
          let table = rainbowTable width ["aabeadab","aacbcced","abdcdead","abeebdac","acbeaece","baaceacb","baaeceac","bbccceeb","beadeeeb","bebabebe","beccdece","cacdabbd","cdaaadca","cedaaaee","daeaadcc","dbbaecee","dbdaeded","ddaacbda","ddaddaac","ddbbccad","ddddaedb","decdbdbd","deedaedb","eaccaedb","ebbabede","edabeade","edddcecd","edeacbca","edeeebdb","eeadbeed"]
          findPassword table width (-1412968889 :: Hash) @?= Just "baadbade"
      ]
    , "Invalid password" ~:
      [ "Invalid input 1" ~: do
          let table = rainbowTable width ["acdgcddh","fcfeggeh","ebfeecbe"]
          findPassword table width (592655920 :: Hash) @?= Nothing
      , "Invalid input 2" ~: do
          let table = rainbowTable width ["acdgcddh","fcfeggeh","ebfeecbe"]
          findPassword table width (0 :: Hash) @?= Nothing
      ]
      -- more test for different constatns
      -- "More test cases" ~:
      -- [ "Invalid input 3" ~: do
      --     let table = rainbowTable width ["aljdm","dlkhg","madnh","fcdfo","lndof"]
      --     findPassword table width (-1185182264 :: Hash) @?= Nothing
      -- , "Valid input 6" ~: do
      --     let table = rainbowTable width ["aljdm","dlkhg","madnh","fcdfo","lndof"]
      --     findPassword table width (261038628 :: Hash) @?= Just "qinmg"
      -- , "Valid input 7" ~: do
      --     let table = rainbowTable width ["aljdm","dlkhg","madnh","fcdfo","lndof"]
      --     findPassword table width (60687648 :: Hash) @?= Just "hhoid"
      -- , "Invalid input 4" ~: do
      --     let table = rainbowTable width ["aljdm","dlkhg","madnh","fcdfo","lndof"]
      --     findPassword table width (60687649 :: Hash) @?= Nothing
      -- ]
  ]
  where
    width = 40
    -- width = 60 -- differnet constant

