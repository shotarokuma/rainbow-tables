module PwReduce (testPwReduce) where
import Test.HUnit
import RainbowAssign (pwReduce)
import Data.Int

type Hash = Int32

testPwReduce :: Test
testPwReduce =
  "pwReduce tests" ~:
  [ 
    pwReduce 1726491528 @?= "eacbcbad",
    pwReduce (-1726491528::Hash) @?= "aecdcdec"
  ]

