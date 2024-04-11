-- 1) Функция для вычисления среднего арифметического списка вещественных чисел
average :: [Double] -> Double
average xs = sum xs / fromIntegral (length xs)


-- 2) Функция для получения n-го элемента из списка (считая с 0)
getElement :: Int -> [a] -> Maybe a
getElement _ [] = Nothing
getElement n (x:xs)
    | n == 0    = Just x
    | otherwise = getElement (n - 1) xs


-- 3) Функция сложения элементов двух списков
addLists :: Num a => [a] -> [a] -> [a]
addLists [] ys = ys
addLists xs [] = xs
addLists (x:xs) (y:ys) = (x + y) : addLists xs ys


-- 4) Функция перестановки местами соседних четных и нечетных элементов
swapEvenOdd :: [a] -> [a]
swapEvenOdd [] = []
swapEvenOdd [x] = [x]
swapEvenOdd (x:y:xs) = y : x : swapEvenOdd xs


-- 5) Функция для вычисления 2^n
twopow :: Int -> Integer
twopow n
    | n == 0 = 1
    | even n = let half = twopow (n `div` 2) in half * half
    | odd n  = let half = twopow (n `div` 2) in 2 * half * half


-- 6) Функция для удаления всех нечетных чисел из списка целых чисел
removeOdd :: [Int] -> [Int]
removeOdd [] = []
removeOdd (x:xs)
    | odd x     = removeOdd xs
    | otherwise = x : removeOdd xs  


-- 7) Функция для удаления пустых строк из списка строк
removeEmpty :: [String] -> [String]
removeEmpty [] = []
removeEmpty (x:xs)
    | null x    = removeEmpty xs 
    | otherwise = x : removeEmpty xs 



-- 8) Функция для подсчета количества элементов списка, равных True
countTrue :: [Bool] -> Integer
countTrue [] = 0
countTrue (x:xs)
    | x         = countTrue xs + 1
    | otherwise = countTrue xs


-- 9) Функция для замены знака всех отрицательных чисел в списке
makePositive :: [Int] -> [Int]
makePositive [] = []
makePositive (x:xs)
    | x < 0     = (-x) : makePositive xs
    | otherwise = x : makePositive xs 


-- 10) Функция для удаления всех вхождений символа из строки
delete :: Char -> String -> String
delete _ [] = []                         
delete c (x:xs)
    | c == x    = delete c xs            
    | otherwise = x : delete c xs 

-- 11) Функция для замены всех вхождений одного символа другим в строке
substitute :: Char -> Char -> String -> String
substitute _ _ [] = []
substitute old new (x:xs)
    | x == old  = new : substitute old new xs
    | otherwise = x : substitute old new xs


main = do
    let xs = [1, 2, 3, 4, 5]
    let ys = [6, 7, 8, 9, 10]


    print $ addLists [] ys

    print $ delete 'l' "hello world"

    print $ removeOdd xs 
