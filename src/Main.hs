module Main where

import Generator (generate)
import Parser ()
import qualified Parser as P
import System.Directory (getCurrentDirectory)
import System.Environment (getArgs)
import System.FilePath ((</>))
import System.Posix.Internals (newFilePath)

main :: IO ()
main = do
  (fileName : _) <- getArgs
  dir <- getCurrentDirectory
  let filePath = dir </> fileName
  generate filePath
