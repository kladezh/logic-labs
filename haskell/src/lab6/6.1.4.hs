import System.Environment ( getArgs )

main :: IO ()
main = do
    args <- getArgs
    let [nStr, filename] = args
        n = read nStr :: Int
    contents <- readFile filename
    let firstNLines = take n (lines contents)
    putStrLn ("Первые " ++ show n ++ " строк(и) файла " ++ filename ++ ":")
    putStrLn (unlines firstNLines)
