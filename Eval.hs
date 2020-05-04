module Eval where
import Grammar

data Frame = HPlus Exp Environment | PlusH Exp 
            | HTimes Exp Environment | TimesH Exp
            | HMinus Exp Environment | MinusH Exp
            | HIf Block Block Environment 
            | HVariable Type String
            | HLT Exp Environment | LTH Exp
            | HGT Exp Environment | GTH Exp
            | HLTEquals Exp Environment | LTEqualsH Exp
            | HGTEquals Exp Environment | GTEqualsH Exp
            | HWhileLoop Exp ExpList
            | HUpdateVar String
            | HPush String
            | HModulo Exp Environment | ModuloH Exp
            | HAnd Exp Environment | AndH Exp
            | HEquals Exp Environment | EqualsH Exp
            | HJustIf Block Environment
              deriving (Show,Eq)

type Kontinuation = [ Frame ]
type State = (Exp,Environment,Kontinuation)

-- Checks for terminated expressions
isValue :: Exp -> Bool
isValue (TmInt _) = True
isValue TTrue = True
isValue TFalse = True
isValue (ListVar _) = True
isValue _ = False

-- TODO:
 -- add some functions to lists like get, reverse


-- Look up a value in an environment and unpack it (has value already been defined)
--getValueBinding :: String -> Environment -> Bool
---getValueBinding x [] = False
--getValueBinding x ((y,e):env) | x == y  = True
                             -- | otherwise = getValueBinding x env

--getValueBinding :: String -> Environment -> (Expr,Environment)
getValueBinding x [] = error "Variable binding not found"
getValueBinding x ((y,e):env) | x == y  = e
                              | otherwise = getValueBinding x env                             

updateEnv :: Environment -> String -> Exp -> Environment
updateEnv [] varName varValue = [(varName, varValue)]
updateEnv ((varNameInEnv,varValueInEnv):env) varName varValue 
                        | varName == varNameInEnv = ((varNameInEnv,varValue):env)
                        | otherwise = (varNameInEnv,varValueInEnv): updateEnv env varName varValue

eval1 :: State -> State

-- Rule for terminated evaluations
eval1 (v,env,[]) | isValue v = (v,env,[])

-- Evaluation rules for plus operator
eval1 ((Plus e1 e2),env,k) = (e1',env,(HPlus e2' env):k)
            where e1' = if (isValueVar e1) then getValueBinding (unparse e1) env else e1
                  e2' = if (isValueVar e2) then getValueBinding (unparse e2) env else e2
eval1 ((TmInt n),env1,(HPlus e env2):k) = (e,env2,(PlusH (TmInt n)) : k)
eval1 ((TmInt m),env,(PlusH (TmInt n)):k) = (TmInt (n + m),env,k)

-- Evaluation rules for times operator
eval1 ((Times e1 e2),env,k) = (e1',env,(HTimes e2' env):k)
            where e1' = if (isValueVar e1) then getValueBinding (unparse e1) env else e1
                  e2' = if (isValueVar e2) then getValueBinding (unparse e2) env else e2
eval1 ((TmInt n),env1,(HTimes e env2):k) = (e,env2,(TimesH (TmInt n)) : k)
eval1 ((TmInt m),env,(TimesH (TmInt n)):k) = (TmInt (n * m),env,k)

-- Evaluation rules for minus operator
eval1 ((Minus e1 e2),env,k) = (e1',env,(HMinus e2' env):k)
            where e1' = if (isValueVar e1) then getValueBinding (unparse e1) env else e1
                  e2' = if (isValueVar e2) then getValueBinding (unparse e2) env else e2
eval1 ((TmInt n),env1,(HMinus e env2):k) = (e,env2,(MinusH (TmInt n)) : k)
eval1 ((TmInt m),env,(MinusH (TmInt n)):k) = (TmInt (n - m),env,k)

-- Evaluation rules for if-then-else
eval1 ((If e1 eBlock1 eBlock2),env,k) = (e1,env,(HIf eBlock1 eBlock2 env):k)
eval1 (TTrue,env1,(HIf eBlock1 eBlock2 env2):k) = (TTrue,env',k')
                        where (e', env', k') = mainLoop (eBlock1, env2)
eval1 (TFalse,env1,(HIf eBlock1 eBlock2 env2):k) = (TTrue,env',k')
                        where (e', env', k') = mainLoop (eBlock2, env2)

-- Evaluation rules for just if statement
eval1 ((JustIf e1 eBlock),env,k) = (e1,env,(HJustIf eBlock env):k)
eval1 (TTrue,env1,(HJustIf eBlock env2):k) = (TTrue,env',k')
                        where (e', env', k') = mainLoop (eBlock, env2)
eval1 (TFalse,env,(HJustIf eBlock env2):k) = (TTrue,env,k)

-- Evaluation rules for LT operator
eval1 ((LTGram e1 e2),env,k) = (e1',env,(HLT e2' env):k)
            where e1' = if (isValueVar e1) then getValueBinding (unparse e1) env else e1
                  e2' = if (isValueVar e2) then getValueBinding (unparse e2) env else e2
eval1 ((TmInt n),env1,(HLT e env2):k) = (e,env2,(LTH (TmInt n)) : k)
eval1 ((TmInt m),env,(LTH (TmInt n)):k) | n < m = (TTrue,env,k)
                                             | otherwise = (TFalse,env,k)

-- Evaluation rules for GT operator
eval1 ((GTGram e1 e2),env,k) = (e1',env,(HGT e2' env):k)
            where e1' = if (isValueVar e1) then getValueBinding (unparse e1) env else e1
                  e2' = if (isValueVar e2) then getValueBinding (unparse e2) env else e2
eval1 ((TmInt n),env1,(HGT e env2):k) = (e,env2,(GTH (TmInt n)) : k)
eval1 ((TmInt m),env,(GTH (TmInt n)):k) | n > m = (TTrue,env,k)
                                            | otherwise = (TFalse,env,k)

-- Evaluation rules for LTEquals operator
eval1 ((LTEquals e1 e2),env,k) = (e1',env,(HLTEquals e2' env):k)
            where e1' = if (isValueVar e1) then getValueBinding (unparse e1) env else e1
                  e2' = if (isValueVar e2) then getValueBinding (unparse e2) env else e2
eval1 ((TmInt n),env1,(HLTEquals e env2):k) = (e,env2,(LTEqualsH (TmInt n)) : k)
eval1 ((TmInt m),env,(LTEqualsH (TmInt n)):k) | n <= m = (TTrue,env,k)
                                            | otherwise = (TFalse,env,k)


-- Evaluation rules for GTEquals operator
eval1 ((GTEquals e1 e2),env,k) = (e1',env,(HGTEquals e2' env):k)
            where e1' = if (isValueVar e1) then getValueBinding (unparse e1) env else e1
                  e2' = if (isValueVar e2) then getValueBinding (unparse e2) env else e2
eval1 ((TmInt n),env1,(HGTEquals e env2):k) = (e,env2,(GTEqualsH (TmInt n)) : k)
eval1 ((TmInt m),env,(GTEqualsH (TmInt n)):k) | n >= m = (TTrue,env,k)
                                            | otherwise = (TFalse,env,k)

-- Evaluation rules for Equals operator
eval1 ((Equals e1 e2),env,k) = (e1',env,(HEquals e2' env):k)
            where e1' = if (isValueVar e1) then getValueBinding (unparse e1) env else e1
                  e2' = if (isValueVar e2) then getValueBinding (unparse e2) env else e2
eval1 ((TmInt n),env1,(HEquals e env2):k) = (e,env2,(EqualsH (TmInt n)) : k)
eval1 ((TmInt m),env,(EqualsH (TmInt n)):k) | n == m = (TTrue,env,k)
                                            | otherwise = (TFalse,env,k)

--Evaluation rulos for && operation
--eval1 ((And e1 e2),env,k) = (e1,env,(HAnd e2 env):k)
--eval1 ((TTrue) ,env1,(HAnd e2' env2):k) = (TTrue,env2,(AndH (TTrue)) : k)
--eval1 ((TFalse) ,env1,(HAnd e2' env2):k) = (TFalse,env2,(AndH (TFalse)) : k)

--eval1 ((TTrue) ,env,(AndH (TTrue)):k) = (TTrue, env, k)
--eval1 ((TTrue) ,env,(AndH (TFalse)):k) = (TFalse, env, k)

--eval1 ((TFalse) ,env,(AndH (TTrue)):k) = (TFalse, env, k)
--eval1 ((TFalse) ,env,(AndH (TFalse)):k) = (TFalse, env, k)

-- Evaluation rules for sum operation
eval1((Sum varName), env, k) = ((TmInt total), env, k)
      where total = sumList (unparseList my_list)
            my_list = getList (getValueBinding varName env) 

-- Evaluation rules for length operation
eval1 ((Length varName),env, k) = (mytestvar, env, k)
                  where mytestvar = (TmInt (length my_list))
                        my_list = getList (getValueBinding varName env) 

--Evaluation rules for modulo operation
eval1 ((Modulo e1 e2),env,k) = (e1',env,(HModulo e2' env):k)
            where e1' = if (isValueVar e1) then getValueBinding (unparse e1) env else e1
                  e2' = if (isValueVar e2) then getValueBinding (unparse e2) env else e2
eval1 ((TmInt n),env1,(HModulo e env2):k) = (e,env2,(ModuloH (TmInt n)) : k)
eval1 ((TmInt m),env,(ModuloH (TmInt n)):k) = (TmInt (n `mod` m),env,k)


--Evaluation rules for while loop
eval1 ((WhileLoop e eblock), env, k) = (e, env, (HWhileLoop e eblock):k)
eval1 ((TTrue), env, (HWhileLoop e eblock):k) = eval1 ((WhileLoop e eblock), env', k)
                                    where (e', env', k') = mainLoop (eblock, env)
eval1 ((TFalse), env, (HWhileLoop e eblock):k) = (TFalse, env, k)

--Evaluation rules for pop operation on a list
eval1 ((Pop varName),env, k) = (mytestvar, env2, k)
                  where env2 = updateEnv env varName (ListVar updatedList)
                        updatedList = drop 1 my_list
                        mytestvar = head my_list
                        my_list = getList (getValueBinding varName env) 
                  
--Evaluation rules for push operation on a list
eval1 ((Push varName e), env, k) = (e', env, (HPush varName):k)
            where e' = if (isValueVar e) then getValueBinding (unparse e) env else e
eval1 ((TmInt n), env, (HPush varName):k) = ((ListVar my_new_list), env2, k)
                  where env2 = updateEnv env varName (ListVar my_new_list)
                        my_new_list = (TmInt n) : my_list
                        my_list = getList (getValueBinding varName env)

--Evalation rules for revers operation on a list
eval1 ((Reverse varName), env, k) = ((ListVar updatedList), env2, k)
                       where env2 = updateEnv env varName (ListVar updatedList)
                             updatedList = reverse my_list
                             my_list = getList (getValueBinding varName env) 
                  
-- Evaluation rules for updating a varible binding -- NEED TO CLEAN UP AND ADD OTHER TYPES TO VARIALBES
eval1 ((UpdateVar varName e), env, k) = (e, env, (HUpdateVar varName):k)
eval1 ((TmInt n), env, (HUpdateVar varName):k) = ((TmInt n), newEnv, k)
      where newEnv = updateEnv env varName (TmInt n)
eval1 ((ListVar ns), env, (HUpdateVar varName):k) = ((ListVar ns), newEnv, k)
      where newEnv = updateEnv env varName (ListVar ns)

--Evaluation rules for creating a variable -- NEED TO CLEAN UP
eval1 ((Variable varType varName varValue), env, k) = (varValue, env, (HVariable varType varName):k)
eval1 ((TmInt n), env, (HVariable varType varName):k) = (TmInt n, (varName, (TmInt n)) : env, k)
eval1 ((TTrue), env, (HVariable varType varName):k) = (TTrue, (varName, TTrue) : env, k)
eval1 ((TFalse), env, (HVariable varType varName):k) = (TFalse, (varName, TFalse) : env, k)
eval1 ((ListVar xs), env, (HVariable varType varName):k) = (TTrue, (varName, (ListVar evaluatedList)) : env, k)
                        where evaluatedList = checkForNegate xs
eval1 ((Negate (TmInt n)), env, (HVariable varType varName):k) = (TmInt (0-n), (varName, (TmInt (0-n))) : env, k)


eval1 ((Negate (TmInt n)), env, k) = (TmInt (0-n), env, k)

-- Rule for runtime errors
eval1 (e,env,k) = error "Evaluation Error"

-- Function to iterate the small step reduction to termination
--evalLoop :: Exp -> Exp
evalLoop (e, env) = evalLoop' (e,env,[])
  where evalLoop' (e,env,k) = if (e' == e) && (isValue e') && (null k) then (e', env', k') else evalLoop' (e',env',k')
                      where (e',env',k') = eval1 (e,env,k) 

mainLoop ((e:es), env) = if (es == []) then evalLoop (e, env) else mainLoop (es, env')
            where (e', env', k) = evalLoop (e, env)


--checkForNegate:: Exp -> Exp
checkForNegate [] = []
checkForNegate (x:xs) = patNegate x : checkForNegate xs

patNegate (TmInt n) = TmInt n
patNegate (Negate (TmInt n)) = TmInt (0-n)

-- Function to unparse underlying values from the AST term
--unparse :: Exp -> String 
unparse (TmInt n) = show n
unparse (VarName n) = n
unparse _ = "Unknown"

getList (ListVar n) = n

isValueVar (VarName n) = True
isValueVar _ = False

unparseList [] = []
unparseList (x:xs) = takeInt x : unparseList xs


takeInt (TmInt n) = n

-- Functions that creates a sum of a list
sumList [] = 0
sumList (x:xs) = x + sumList xs