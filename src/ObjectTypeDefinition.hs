module ObjectTypeDefinition (ObjectTypeDefinition(..), objectTypeDefinition) where

import FieldDefinition (FieldDefinition, fieldDefinition)
import qualified Lexer as L
import Text.ParserCombinators.Parsec

data ObjectTypeDefinition = ObjectTypeDefinition
  { name :: String,
    fields :: [FieldDefinition]
  }
  deriving (Show, Eq)

objectTypeDefinition :: Parser ObjectTypeDefinition
objectTypeDefinition = do
  L.reserved L.reservedNameType
  name <- L.identifier
  fields <- L.braces (many1 fieldDefinition)
  return
    ObjectTypeDefinition
      { name = name,
        fields = fields
      }
