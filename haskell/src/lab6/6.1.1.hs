main :: IO ()
main = do
    putStrLn "Введите два числа через пробел:"

    input <- getLine
    let [first, second] = words input
        num1 = read first :: Int
        num2 = read second :: Int
        sum = num1 + num2
        
    putStrLn $ "Сумма: " ++ show sum
