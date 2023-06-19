import PwReduce (testPwReduce)
import RainbowTable (testRainbowTable)
import FindPassword (testFindPassword)
import Test.HUnit

main :: IO ()

main = do
  _ <- runTestTT (test [testPwReduce])
  _ <- runTestTT (test [testRainbowTable])
  _ <- runTestTT (test [testFindPassword])
  return ()