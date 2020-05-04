module ListTypes where 
import Grammar

type TypeEnvironment = [ (String,Type) ]

preEvalTypesLoop :: [Exp] -> TypeEnvironment -> TypeEnvironment
preEvalTypesLoop [] tenv = tenv
preEvalTypesLoop (x:xs) tenv = preEvalTypesLoop xs newEnv
              where newEnv = snd typeOfResult
                    typeOfResult = typeOf tenv x


evalTypesLoop :: [Exp] -> TypeEnvironment -> [Type]
evalTypesLoop [] tenv = []
evalTypesLoop (x:xs) tenv = receivedType : evalTypesLoop xs newEnv
              where newEnv = snd typeOfResult
                    receivedType = fst typeOfResult
                    typeOfResult = typeOf tenv x

getBinding :: String -> TypeEnvironment -> Type
getBinding x [] = error "Variable binding not found in type environment"
getBinding x ((y,t):tenv) | x == y  = t
                        | otherwise = getBinding x tenv

contains :: String -> TypeEnvironment -> Bool
contains x [] = False
contains x ((y,t):tenv) | x == y  = True
                        | otherwise = contains x tenv

addBinding :: String -> Type -> TypeEnvironment -> TypeEnvironment
addBinding x t tenv = (x,t):tenv

typeOf :: TypeEnvironment -> Exp -> (Type, TypeEnvironment)

typeOf tenv (TmInt _)  = (Integer, tenv)

typeOf tenv (TTrue) = (Boolean, tenv)

typeOf tenv (TFalse) = (Boolean, tenv)

typeOf tenv (Negate x) = (Integer, tenv)

typeOf tenv (ListVar n) = (List, tenv)

typeOf tenv (Variable t x e1) = u
        where u = if t == actualType then (t, newEnv) else error ("Type " ++ show t ++ " doesn't match " ++ show actualType ++ " value")
              actualType = fst (typeOf newEnv e1)
              newEnv = addBinding x t tenv

typeOf tenv (UpdateVar x e1) = u
        where u = if expectedType == actualType then (actualType, tenv) else error ("Type " ++ show expectedType ++ " doesn't match " ++ show actualType ++ " value")
              expectedType = getBinding x tenv
              actualType = fst (typeOf tenv e1)

typeOf tenv (VarName x) = u
        where u = if (contains x tenv) == True then (getBinding x tenv, tenv) else error ("Value has not been instantiated before!")

typeOf tenv (Plus e1 e2) = u
        where u = if (e1type == Integer) && (e2type == Integer) then (Integer, tenv) else error ("Either one of the values does not return Integer")
              e1type = fst (typeOf tenv e1)
              e2type = fst (typeOf tenv e1)

typeOf tenv (Minus e1 e2) = u
        where u = if (e1type == Integer) && (e2type == Integer) then (Integer, tenv) else error ("Either one of the values does not return Integer")
              e1type = fst (typeOf tenv e1)
              e2type = fst (typeOf tenv e1)

typeOf tenv (Times e1 e2) = u
        where u = if (e1type == Integer) && (e2type == Integer) then (Integer, tenv) else error ("Either one of the values does not return Integer")
              e1type = fst (typeOf tenv e1)
              e2type = fst (typeOf tenv e1)

typeOf tenv (Expo e1 e2) = u
        where u = if (e1type == Integer) && (e2type == Integer) then (Integer, tenv) else error ("Either one of the values does not return Integer")
              e1type = fst (typeOf tenv e1)
              e2type = fst (typeOf tenv e1)

typeOf tenv (GTGram e1 e2) = u
        where u = if (e1type == Integer) && (e2type == Integer) then (Boolean, tenv) else error ("Either one of the values does not return Integer")
              e1type = fst (typeOf tenv e1)
              e2type = fst (typeOf tenv e1)

typeOf tenv (LTGram e1 e2) = u
        where u = if (e1type == Integer) && (e2type == Integer) then (Boolean, tenv) else error ("Either one of the values does not return Integer")
              e1type = fst (typeOf tenv e1)
              e2type = fst (typeOf tenv e1)

typeOf tenv (LTEquals e1 e2) = u
        where u = if (e1type == Integer) && (e2type == Integer) then (Boolean, tenv) else error ("Either one of the values does not return Integer")
              e1type = fst (typeOf tenv e1)
              e2type = fst (typeOf tenv e1)

typeOf tenv (GTEquals e1 e2) = u
        where u = if (e1type == Integer) && (e2type == Integer) then (Boolean, tenv) else error ("Either one of the values does not return Integer")
              e1type = fst (typeOf tenv e1)
              e2type = fst (typeOf tenv e1)

typeOf tenv (Equals e1 e2) = u
        where u = if (e1type == Integer) && (e2type == Integer) then (Boolean, tenv) else error ("Either one of the values does not return Integer")
              e1type = fst (typeOf tenv e1)
              e2type = fst (typeOf tenv e1)

typeOf tenv (NotEquals e1 e2) = u
        where u = if (e1type == Integer) && (e2type == Integer) then (Boolean, tenv) else error ("Either one of the values does not return Integer")
              e1type = fst (typeOf tenv e1)
              e2type = fst (typeOf tenv e1)

typeOf tenv (Pop x) = u
        where u = if actualType == List then (Integer, tenv) else error ("Type list not specified")
              actualType = getBinding x tenv

typeOf tenv (Push x e) = u
        where u = if (variableType == List) && (expressionType == Integer) then (List, tenv) else error ("You might not be pushing Integer in List. Variable Type: " ++ show variableType ++ ". Expression Type" ++ show expressionType)
              variableType = getBinding x tenv
              expressionType = fst (typeOf tenv e)

typeOf tenv (Modulo e1 e2) = u
        where u = if (e1type == Integer) && (e2type == Integer) then (Integer, tenv) else error ("Either one of the values does not return Integer")
              e1type = fst (typeOf tenv e1)
              e2type = fst (typeOf tenv e2)

typeOf tenv (Div e1 e2) = u
        where u = if (e1type == Integer) && (e2type == Integer) then (Integer, tenv) else error ("Either one of the values does not return Integer")
              e1type = fst (typeOf tenv e1)
              e2type = fst (typeOf tenv e2)

typeOf tenv (Length x) = u
        where u = if actualType == List then (Integer, tenv) else error ("Type list not specified")
              actualType = getBinding x tenv

typeOf tenv (Sum x) = u
        where u = if actualType == List then (Integer, tenv) else error ("Type list not specified")
              actualType = getBinding x tenv

typeOf tenv (Reverse x) = u
        where u = if actualType == List then (List, tenv) else error ("Type list not specified")
              actualType = getBinding x tenv          

typeOf tenv (If c e1 e2) = u 
        where u = if condititionType == Boolean then (Boolean, newEnv2) else error ("Condition does not return a boolean value")
              condititionType = fst (typeOf tenv c)
              newEnv2 = preEvalTypesLoop e1 tenv
              newEnv1 = preEvalTypesLoop e1 tenv

typeOf tenv (JustIf c e1) = u 
        where u = if condititionType == Boolean then (Boolean, newEnv) else error ("Condition does not return a boolean value")
              condititionType = fst (typeOf tenv c)
              newEnv = preEvalTypesLoop e1 tenv

typeOf tenv (WhileLoop c e1) = u 
        where u = if condititionType == Boolean then (Boolean, newEnv) else error ("Condition does not return a boolean value")
              condititionType = fst (typeOf tenv c)
              newEnv = preEvalTypesLoop e1 tenv

typeOf tenv (Take x e) = u
        where u = if (variableType == List) && (expressionType == Integer) then (List, tenv) else error ("Either you havent specified list type or expression is not Integer: " ++ show variableType ++ ". Expression Type" ++ show expressionType)
              variableType = getBinding x tenv
              expressionType = fst (typeOf tenv e)

typeOf tenv (Drop x e) = u
        where u = if (variableType == List) && (expressionType == Integer) then (List, tenv) else error ("Either you havent specified list type or expression is not Integer: " ++ show variableType ++ ". Expression Type" ++ show expressionType)
              variableType = getBinding x tenv
              expressionType = fst (typeOf tenv e)

typeOf tenv (Get x e) = u
        where u = if (variableType == List) && (expressionType == Integer) then (Integer, tenv) else error ("Either you havent specified list type or expression is not Integer: " ++ show variableType ++ ". Expression Type" ++ show expressionType)
              variableType = getBinding x tenv
              expressionType = fst (typeOf tenv e)

typeOf tenv _ = error "Type Error"

unparseType :: Type -> String
unparseType Boolean = "Boolean"
unparseType Integer = "Integer"
unparseType List = "List"