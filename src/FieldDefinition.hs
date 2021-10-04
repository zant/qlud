module FieldDefinition (FieldDefinition, fieldDefinition) where

import qualified Lexer as L
import Text.ParserCombinators.Parsec

data FieldDefinition = FieldDefinition
  { key :: String,
    value :: String
  }
  deriving (Show, Eq)

fieldDefinition :: Parser FieldDefinition
fieldDefinition = do
  key <- L.identifier <* L.colon
  value <- L.identifier

  return
    FieldDefinition
      { value = value,
        key = key
      }
