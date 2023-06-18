import PwReduce (testPwReduce)
import Test.HUnit

main :: IO ()

main = do
  runTestTT (test [testPwReduce])
  return ()
