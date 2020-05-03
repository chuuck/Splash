--Author: Julian Rathke, 2018 
--Provides an implementation of a type checker for the \Toy language from the lecture notes.
module ListTypes where 
import Grammar

--Data structures as defined in ToyGrammar:
--data Type = Integer | StringT | List | File | Boolean deriving (Show,Eq)

--type Environment = [ (String,Exp) ]

--data Exp = Variable Type String Exp | TmInt Int | Var String | ReadFLine String
--        | Print Exp | VarName String | Plus Exp Exp | Minus Exp Exp | Times Exp Exp
--        | If Exp Block Block | TTrue | TFalse | End | ListVar ExpList | GTGram Exp Exp
--        | LTGram Exp Exp | LTEquals Exp Exp | GTEquals Exp Exp | Equals Exp Exp
--        | Pop String | Push String Exp | UpdateVar String Exp | WhileLoop Exp Block
--        | Modulo Exp Exp | Length String | NotEquals Exp Exp | JustIf Exp Block | Sum String
--        | Reverse String deriving (Show,Eq)

--data Expr = TmInt Int | TmTrue | TmFalse | TmUnit | TmCompare Expr Expr 
--           | TmPair Expr Expr | TmAdd Expr Expr | TmVar String 
--           | TmFst Expr | TmSnd Expr
--           | TmIf Expr Expr Expr | TmLet String ToyType Expr Expr
--           | TmLambda String ToyType Expr | TmApp Expr Expr
--           | Cl ( String ToyType Expr Environment)

type TypeEnvironment = [ (String,Type) ]

getBinding :: String -> TypeEnvironment -> Type
getBinding x [] = error "Variable binding not found"
getBinding x ((y,t):tenv) | x == y  = t
                        | otherwise = getBinding x tenv

addBinding :: String -> Type -> TypeEnvironment -> TypeEnvironment
addBinding x t tenv = (x,t):tenv

typeOf :: TypeEnvironment -> Exp -> Type
-- needs fixing
typeOf tenv (Variable e1 e2 e3) = StringT
typeOf tenv (UpdateVar e1 e2) = StringT
typeOf tenv (If e1 e2 e3) = StringT
--typeOf tenv (If e1 e2 e3) | t2 == t3 = t2
--  where (Boolean,t2,t3) = (typeOf tenv e1, typeOf tenv e2, typeOf tenv e3)


typeOf tenv (TmInt _)  = Integer

typeOf tenv (TTrue) = Boolean

typeOf tenv (TFalse) = Boolean

-- added 

typeOf tenv (Var e2) = StringT

typeOf tenv (ReadFLine e1) = List

typeOf tenv (Print e1) = StringT

typeOf tenv (VarName e1) = StringT

typeOf tenv (Plus e1 e2) = Integer
  where (Integer, Integer) = (typeOf tenv e1, typeOf tenv e2)

typeOf tenv (Minus e1 e2) = Integer
  where (Integer, Integer) = (typeOf tenv e1, typeOf tenv e2)

typeOf tenv (Times e1 e2) = Integer
  where (Integer, Integer) = (typeOf tenv e1, typeOf tenv e2)

typeOf tenv (ListVar e1) = List

typeOf tenv (GTGram e1 e3) = Boolean
  where (Integer, Integer) = (typeOf tenv e1, typeOf tenv e3)

typeOf tenv (LTGram e1 e3) = Boolean
  where (Integer, Integer) = (typeOf tenv e1, typeOf tenv e3)

typeOf tenv (LTEquals e1 e3) = Boolean
  where (Integer, Integer) = (typeOf tenv e1, typeOf tenv e3)

typeOf tenv (GTEquals e1 e3) = Boolean
  where (Integer, Integer) = (typeOf tenv e1, typeOf tenv e3)

typeOf tenv (Equals e1 e3) = Boolean
  where (Integer, Integer) = (typeOf tenv e1, typeOf tenv e3)

typeOf tenv (NotEquals e1 e3) = Boolean
  where (Integer, Integer) = (typeOf tenv e1, typeOf tenv e3)

typeOf tenv (Pop e1) = Integer


-- it doesn't like e1 for some reason
typeOf tenv (Push e1 e2) = List
  where (StringT, Integer) = (typeOf tenv e1, typeOf tenv e2)

--typeOf tenv (WhileLoop e1 e2) = t2
--  where (Boolean, t2) = (typeOf tenv e1, typeOf tenv e2) 

typeOf tenv (Modulo e1 e2) = Integer
  where (Integer, Integer) = (typeOf tenv e1, typeOf tenv e2)

typeOf tenv (Length e1) = Integer

--typeOf tenv (JustIf e1 e2) = t2
--  where (Boolean, t2) = (typeOf tenv e1, typeOf tenv e2)

typeOf tenv (Sum e1) = Integer

typeOf tenv (Reverse e1) = List


typeOf tenv _ = error "Type Error"

-- Function for printing the results of the TypeCheck
unparseType :: Type -> String
unparseType Boolean = "Boolean"
unparseType Integer = "Integer"
unparseType File = "File"
unparseType List = "List"
unparseType StringT = "String"
