module PwReduce (testPwReduce) where
import Test.HUnit
import Rainbow (pwReduce)
import Data.Int

type Hash = Int32

testPwReduce :: Test
testPwReduce =
  "pwReduce tests" ~:
  [ 
    pwReduce 1726491528 @?= "eacbcbad",
    pwReduce (-1726491528::Hash) @?= "aecdcdec",
    pwReduce (4::Hash) @?= "aaaaaaae",
    pwReduce (1742526836::Hash) @?="ebdcedcb",
    pwReduce (-1726491528::Hash) @?= "aecdcdec",
    pwReduce (-439590745::Hash) @?= "dbaeeaba",
    pwReduce (-1::Hash) @?= "eeeeeeee",
    pwReduce (-8::Hash) @?= "eeeeeedc"
  ]

