import PwReduce (testPwReduce)
import RainbowTable (testRainbowTable)
import Test.HUnit

main :: IO ()

main = do
  _ <- runTestTT (test [testPwReduce])
  _ <- runTestTT (test [testRainbowTable])
  return ()