module Parser (parseQlud) where

import qualified ObjectTypeDefinition
import Text.ParserCombinators.Parsec as Combinator

parseExpr :: Combinator.Parser ObjectTypeDefinition.ObjectTypeDefinition
parseExpr = ObjectTypeDefinition.objectTypeDefinition

parseQlud :: String -> Either ParseError ObjectTypeDefinition.ObjectTypeDefinition
parseQlud = Combinator.parse parseExpr "qlud"
