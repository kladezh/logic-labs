-- 1) Функция, создающая список из n натуральных чисел
naturalNumbers :: Int -> [Int]
naturalNumbers n
    | n <= 0 = []
    | otherwise = naturalNumbers (n - 1) ++ [n]


-- 2) Функция, создающая список из первых n нечетных натуральных чисел
oddNumbers :: Int -> [Int]
oddNumbers n
    | n <= 0 = []
    | otherwise = oddNumbers (n - 1) ++ [2 * n - 1]


-- 3) Функция, создающая список из первых n четных натуральных чисел
evenNumbers :: Int -> [Int]
evenNumbers n
    | n <= 0 = []
    | otherwise = evenNumbers (n - 1) ++ [2 * n]


-- 4) Функция, создающая список из квадратов натуральных чисел от 1 до n
squares :: Int -> [Int]
squares n
    | n <= 0 = []
    | otherwise = squares (n - 1) ++ [n * n]


-- 5) Функция, создающая список из факториалов натуральных чисел от 1 до n
factorials :: Int -> [Int]
factorials n
    | n <= 0 = []
    | otherwise = factorials (n - 1) ++ [factorial n]

factorial :: Int -> Int
factorial x
    | x <= 0 = 1
    | otherwise = x * factorial (x - 1)


-- 6) Функция, создающая список из степеней двойки от 2^0 до 2^(n-1)
powersOfTwo :: Int -> [Int]
powersOfTwo n
    | n <= 0 = []
    | otherwise = powersOfTwo (n - 1) ++ [2 ^ (n - 1)]


-- 7) Функция, создающая список из первых n треугольных чисел
triangularNumbers :: Int -> [Int]
triangularNumbers n
    | n <= 0 = []
    | otherwise = triangularNumbers (n - 1) ++ [n * (n + 1) `div` 2]


-- 8) Функция, создающая список из первых n пирамидальных чисел
pyramidalNumbers :: Int -> [Int]
pyramidalNumbers n
    | n <= 0 = []
    | otherwise = pyramidalNumbers (n - 1) ++ [n * (n + 1) * (n + 2) `div` 6]


main = do
    let n = 5

    putStrLn ("N = " ++ show n)

    putStrLn "список из N натуральных чисел:"
    print (naturalNumbers n)

    putStrLn "список из первых N нечетных натуральных чисел:"
    print (oddNumbers n)

    putStrLn "список из первых N четных натуральных чисел:"
    print (evenNumbers n)

    putStrLn "список из квадратов натуральных чисел от 1 до N:"
    print (squares n)

    putStrLn "список из факториалов натуральных чисел от 1 до N:"
    print (factorials n)

    putStrLn "список из степеней двойки от 2^0 до 2^(N-1):"
    print (powersOfTwo n)

    putStrLn "список из первых N треугольных чисел:"
    print (triangularNumbers n)
    
    putStrLn "список из первых N пирамидальных чисел:"
    print (pyramidalNumbers n)
