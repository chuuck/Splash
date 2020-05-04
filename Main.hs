    import System.Environment
    import System.IO
    import Data.Char
    import Tokens
    import Grammar
    import Control.Exception
    import Eval
    import Data.List (intercalate)
    import ListTypes

    main :: IO()
    main = catch main' noParse


    main' = do
        (fileName : _) <- getArgs
        input <- getContents
        let input_list = readLists input
        let listOfLists = [head (parseCalc (alexScanTokens (show row))) | row <- input_list]
        let to_env_list = zip (genName (length listOfLists) "mylist") listOfLists
        code <- readFile fileName

        let my_tokens = alexScanTokens code
        --putStrLn ("Tokens: " ++ show my_tokens)
        let parsed = parseCalc my_tokens
        --putStrLn ("Parser: " ++ show parsed)


------------------------------------
        --putStrLn ("Type Checking: ") -- ++ show parsed)

        let input_type = [ Variable List name (actualList) | (name, actualList) <- to_env_list]
        let pre_type_env = preEvalTypesLoop input_type []
        let typedResult = evalTypesLoop parsed pre_type_env
        let unparsedTypeList = map (unparseType) typedResult
        --putStrLn ("Type Checking Passed with type " ++ show unparsedTypeList)
        
---------------------
        let result = mainLoop (parsed, to_env_list)
        --putStrLn (show result)

        
        let actualResult = getMeTheResult result
        --putStrLn (show actualResult)

        let me = intercalate "\n" (map show actualResult)
        putStrLn me
        writeFile "output.txt" me


        
    getMeTheResult ( _ , xs , _ ) = listx
            where listx = unparseList (getList (getValueBinding "results" xs))

    noParse :: ErrorCall -> IO ()
    noParse e = do 
            let err =  show e
            putStrLn("\n Error found!")
            putStrLn("---------------------")
            hPutStr stderr err
            putStrLn("\n---------------------")
            return ()



    multiZipL :: [[a]] -> [[a]]
    multiZipL xs = init (helper xs)

    helper :: [[a]] -> [[a]]
    helper [] = []
    helper xs = [head x | x <- xs, length x >= 1] : helper [tail x | x <- xs, length x >= 1]

    splitOn :: Char -> String -> [String]
    splitOn c [] = []
    splitOn c ls = (takeWhile (/=c) ls) : splitOn' c (dropWhile (/=c) ls)
     where splitOn' c [] = []
           splitOn' c (x:[]) | x==c = [[]]
           splitOn' c (x:xs) | x==c = splitOn c xs
                             | otherwise = []

    removeBlanks :: String -> String
    removeBlanks s = filter (/= ' ') s

    readLists :: String -> [[Int]]
    readLists s = multiZipL (map (map (\x -> read x :: Int)) (map (map removeBlanks) (map (splitOn ' ') (lines s))))

    genName n name = [ x ++ (show y)  | (x, y) <- list_tuples ]
                where list_tuples = zip list_names [1..n]
                      list_names =  replicate n name

