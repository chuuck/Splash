{
module Tokens where
}

%wrapper "posn"

$digit = 0-9			  -- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-

  $white+				                  ;
  "--".*				                  ;

  Integer                         { tok (\p s -> TokenTypeInteger p) }
  Str                             { tok (\p s -> TokenTypeString p) }
  List                            { tok (\p s -> TokenTypeList p) }
  File                            { tok (\p s -> TokenTypeFile p) }
  Boolean                         { tok (\p s -> TokenTypeBoolean p) }
  if                              { tok (\p s -> TokenIf p) }
  else                            { tok (\p s -> TokenElse p) }
  true                            { tok (\p s -> TokenTrue p) }           
  false                           { tok (\p s -> TokenFalse p) }
  while                           { tok (\p s -> TokenWhile p) }
  end                             { tok (\p s -> TokenEnd p) }
  pop                             { tok (\p s -> TokenPop p) }
  push                            { tok (\p s -> TokenPush p) }
  modulo                          { tok (\p s -> TokenModulo p) }
  length                          { tok (\p s -> TokenLength p) }
  sum                             { tok (\p s -> TokenSum p) }
  reverse                         { tok (\p s -> TokenReverse p) }
  div                             { tok (\p s -> TokenDiv p) }
  get                             { tok (\p s -> TokenGet p) }
  take                            { tok (\p s -> TokenTake p) }
  drop                            { tok (\p s -> TokenDrop p) }

  [\=]			                      { tok (\p s -> TokenEq p ) }
  [\"]                            { tok (\p s -> TokenQuote p ) }
  [\.]                            { tok (\p s -> TokenDot p ) }
  [\(]                            { tok (\p s -> TokenLParen p ) }
  [\)]                            { tok (\p s -> TokenRParen p ) }
  [\+]                            { tok (\p s -> TokenPlus p ) }
  [\-]                            { tok (\p s -> TokenMinus p ) }
  [\*]                            { tok (\p s -> TokenTimes p ) }
  [\{]                            { tok (\p s -> TokenLCurlyBrack p ) }
  [\}]                            { tok (\p s -> TokenRCurlyBrack p ) }
  [\;]                            { tok (\p s -> TokenSemi p ) }
  \[                              { tok (\p s -> TokenLSquareBrack p ) }
  \]                              { tok (\p s -> TokenRSquareBrack p ) }
  [\,]                            { tok (\p s -> TokenComma p ) }
  [\>]                            { tok (\p s -> TokenGT p ) }
  [\<]                            { tok (\p s -> TokenLT p ) }
  \<=                             { tok (\p s -> TokenLTEquals p ) }
  \>=                             { tok (\p s -> TokenGTEquals p ) }
  \==                             { tok (\p s -> TokenEquals p ) }
  \!=                             { tok (\p s -> TokenNotEquals p ) }
  \^                              { tok (\p s -> TokenExp p ) }


  $digit+				                  { tok (\p s -> TokenInt p (read s)) }
  $alpha [$alpha $digit \_ \']*		{ tok (\p s -> TokenVar p s) }

{
-- Each right-hand side has type :: AlexPosn -> String -> Token

-- Some action helpers:
tok f p s = f p s

-- The token type:
data Token =

  TokenTypeInteger AlexPosn         |
  TokenTypeString AlexPosn          |
  TokenTypeList AlexPosn            |
  TokenTypeFile AlexPosn            |
  TokenEq AlexPosn                  |
  TokenQuote AlexPosn               |
  TokenDot AlexPosn                 |
  TokenIf AlexPosn                  |
  TokenElse AlexPosn                |
  TokenTrue AlexPosn                |
  TokenFalse AlexPosn               |
  TokenSemi AlexPosn                |
  TokenWhile AlexPosn               |
  TokenTypeBoolean AlexPosn         |
  TokenPop AlexPosn                 |
  TokenPush AlexPosn                |
  TokenModulo AlexPosn              |
  TokenLength AlexPosn              |
  TokenNotEquals AlexPosn           |
  TokenSum AlexPosn                 |
  TokenReverse AlexPosn             |  
  TokenDiv AlexPosn                 |   
  TokenGet AlexPosn                 |
  TokenTake AlexPosn                |
  TokenDrop AlexPosn                |
  TokenExp AlexPosn                 |

  TokenLParen AlexPosn              |
  TokenRParen AlexPosn              |
  TokenPlus AlexPosn                |
  TokenMinus AlexPosn               |
  TokenTimes AlexPosn               |
  TokenLCurlyBrack AlexPosn         |
  TokenRCurlyBrack AlexPosn         |
  TokenEnd AlexPosn                 |
  TokenLSquareBrack AlexPosn        |
  TokenRSquareBrack AlexPosn        |
  TokenComma AlexPosn               |
  TokenGT AlexPosn                  |
  TokenLT AlexPosn                  |
  TokenLTEquals AlexPosn            |
  TokenGTEquals AlexPosn            |
  TokenEquals AlexPosn              |


  TokenVar AlexPosn String          |
  TokenInt AlexPosn Int
  deriving (Eq,Show)


--tokenPosn :: Token -> String

}