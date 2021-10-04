module Generator (generate) where

import Control.Monad
import Data.Text (pack, replace, unpack)
import qualified ObjectTypeDefinition
import Parser (parseQlud)
import System.Directory
  ( createDirectoryIfMissing,
    doesFileExist,
    getCurrentDirectory,
  )
import System.FilePath (dropFileName, (</>))

generate :: FilePath -> IO ()
generate path = do
  input <- readFile path
  dir <- getCurrentDirectory
  entityTemplate <- readFile $ dir </> "src/templates/Entity"

  case parseQlud input of
    Left err -> print $ "Error" ++ show err
    Right val -> do
      let entity = ObjectTypeDefinition.name val
      let res = replace (pack "{{entity}}") (pack entity) $ pack entityTemplate
      let path = dir </> "gen/" ++ entity ++ ".ts"
      writeFileForce path $ unpack res

writeFileForce :: FilePath -> String -> IO ()
writeFileForce path contents = do
  fileExist <- doesFileExist path
  unless fileExist $ createDirectoryIfMissing True $ dropFileName path
  writeFile path contents
