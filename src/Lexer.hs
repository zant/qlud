module Lexer (reservedNameType, braces, reserved, colon, identifier) where

import Data.Char (isSpace)
import Text.Parsec.Language (emptyDef)
import Text.Parsec.String (Parser)
import qualified Text.Parsec.Token as Token
import qualified Text.ParserCombinators.Parsec as Combinator

reservedNameType :: String
reservedNameType = "type"

reservedNames :: [String]
reservedNames =
  [reservedNameType]

qludLanguageDef :: Token.LanguageDef ()
qludLanguageDef = emptyDef {Token.reservedNames = reservedNames}

qludLexer :: Token.TokenParser ()
qludLexer = Token.makeTokenParser qludLanguageDef

braces :: Parser a -> Parser a
braces = Token.braces qludLexer

reserved :: String -> Parser ()
reserved = Token.reserved qludLexer

many1 :: Parser a -> Parser [a]
many1 = Combinator.many1

colon :: Parser String
colon = Token.colon qludLexer

identifier :: Parser String
identifier = Token.identifier qludLexer
