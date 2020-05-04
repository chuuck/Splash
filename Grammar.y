{ 
module Grammar where 
import Tokens 
}

%name parseCalc -- name of the parsing function that Happy will generate
%tokentype { Token } -- type of tokens tha the parse will accept
%error { parseError } -- name of a function it should call in the event of a parse error

-- Now we declare all the possible tokens
-- Symbols on the left are the tokens as they will be reffered to in the of the Grammar
-- to the right of each token enclosed in braces is a Haskell pattern that matches the token
-- $$ symbol is a placeholder that represents the value of this token, meaning that
-- we are assigning a value to that token, for example, int will be 5, var will be ""

%token

    
    '='                 { TokenEq _ }
    '"'                 { TokenQuote _ }
    '.'                 { TokenDot _ }
    '('                 { TokenLParen _ }
    ')'                 { TokenRParen _ }
    '+'                 { TokenPlus _ }
    '-'                 { TokenMinus _ }
    '*'                 { TokenTimes _ }
    '{'                 { TokenLCurlyBrack _ }
    '}'                 { TokenRCurlyBrack _ }
    ']'                 { TokenRSquareBrack _ }
    '['                 { TokenLSquareBrack _ }
    ','                 { TokenComma _ }
    
    '>'                 { TokenGT _ }                   
    '<'                 { TokenLT _ }                  
    '<='                { TokenLTEquals _ }          
    '>='                { TokenGTEquals _ }       
    '=='                { TokenEquals _  }
    '!='                { TokenNotEquals _ }
    '^'                 { TokenExp _ } 


    Boolean             { TokenTypeBoolean _ }
    Integer             { TokenTypeInteger _ }
    Str                 { TokenTypeString _ }
    List                { TokenTypeList _ }
    File                { TokenTypeFile _ }
    if                  { TokenIf _ }
    else                { TokenElse _ }
    true                { TokenTrue _ }
    false               { TokenFalse _ }
    while               { TokenWhile _ }
    push                { TokenPush _ }
    pop                 { TokenPop _ }
    modulo              { TokenModulo _ }
    length              { TokenLength _ }
    sum                 { TokenSum _ }
    reverse             { TokenReverse _ }
    div                 { TokenDiv _ }
    get                 { TokenGet _ }
    take                { TokenTake _ }
    drop                { TokenDrop _ }

    int                 { TokenInt _ $$ } 
    var                 { TokenVar _ $$ } 

%right '='
%nonassoc '>' '<' '<=' '>=' '!=' '=='
%left '+' '-' 
%left '*' 
%right '^'
%left NEG
%nonassoc Boolean Integer Str List File if else true false while push pop modulo length sum reverse
%nonassoc '[' ']' '{' '}' ',' '(' ')' '.' '"'


%% 

-- Production rules for the Grammar

Exps :
        {- empty -} {[]}
      | Exp Exps { $1 : $2} 

ExpList : ExpList ',' Exp { ($1 ++ [$3])}
         | Exp              { [$1] }
         | {- empty -}       { [] }

Exp : Type var '=' Exp                                  { Variable $1 $2 $4 }
    | var '=' Exp                                       { UpdateVar $1 $3}
    | int                                               { TmInt $1 }
    | true                                              { TTrue }
    | false                                             { TFalse }
    | '"' var '"'                                       { Var $2 }
    | var                                               { VarName $1}
    | Exp '+' Exp                                       { Plus $1 $3 }
    | Exp '-' Exp                                       { Minus $1 $3 }
    | Exp '*' Exp                                       { Times $1 $3 }
    | if '(' Exp ')' '{' Block '}' else '{' Block '}'   { If $3 $6 $10 }
    | '[' ExpList ']'                                   { ListVar $2 }
    | Exp '>' Exp                                       { GTGram $1 $3 }
    | Exp '<' Exp                                       { LTGram $1 $3 }
    | Exp '<=' Exp                                      { LTEquals $1 $3 }
    | Exp '>=' Exp                                      { GTEquals $1 $3 }
    | Exp '==' Exp                                      { Equals $1 $3}
    | Exp '!=' Exp                                      { NotEquals $1 $3 } 
    | var '.' pop '('')'                                { Pop $1 }
    | var '.' push '(' Exp ')'                          { Push $1 $5}
    | while '(' Exp ')' '{' Block '}'                   { WhileLoop $3 $6 }
    | Exp modulo Exp                                    { Modulo $1 $3 }
    | Exp div Exp                                       { Div $1 $3 }
    | var '.' length '('')'                             { Length $1 }
    | if '(' Exp ')' '{' Block '}'                      { JustIf $3 $6 }
    | var '.' sum '(' ')'                               { Sum $1 }
    | var '.' reverse '(' ')'                           { Reverse $1 }
    | '-' Exp %prec NEG                                 { Negate $2 }
    | var '.' get '(' Exp ')'                           { Get $1 $5 }
    | var '.' take '(' Exp ')'                          { Take $1 $5 }
    | var '.' drop '(' Exp ')'                          { Drop $1 $5 }
    | Exp '^' Exp                                       { Expo $1 $3}


Type : Integer               { Integer }
    | Str                    { StringT }
    | File                   { File }
    | List                   { List }
    | Boolean                { Boolean }

Block : Block Exp { ($1 ++ [$2])}
         | Exp              { [$1] }
         | {- empty -}       { [] }

{

parseError :: [Token] -> a
parseError _ = error "Parse error" 

data Type = Integer
        | StringT
        | List
        | File
        | Boolean
        deriving (Show,Eq)

type Environment = [ (String,Exp) ]

type ExpList = [Exp]

type Block = [Exp]

data Exp =
        Variable Type String Exp
        | TmInt Int
        | Var String
        | VarName String
        | Plus Exp Exp
        | Minus Exp Exp
        | Times Exp Exp
        | If Exp Block Block
        | TTrue
        | TFalse
        | ListVar ExpList
        | GTGram Exp Exp
        | LTGram Exp Exp
        | LTEquals Exp Exp
        | GTEquals Exp Exp
        | Equals Exp Exp
        | Pop String
        | Push String Exp
        | UpdateVar String Exp
        | WhileLoop Exp Block
        | Modulo Exp Exp
        | Length String
        | NotEquals Exp Exp
        | JustIf Exp Block
        | Sum String
        | Reverse String
        | Negate Exp
        | Div Exp Exp
        | Get String Exp
        | Take String Exp
        | Drop String Exp
        | Expo Exp Exp
    

         deriving (Show,Eq)



} 