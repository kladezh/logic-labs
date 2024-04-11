-- 1) Функция вычисления арифметического среднего элементов списка вещественных чисел с использованием функции foldr.
-- Функция должна осуществлять только один проход по списку.
average :: [Double] -> Double
average xs = (\(s, n) -> if n == 0 then 0 else s / n) 
            (foldr (\x (s, n) -> (s + x, n + 1)) (0, 0) xs)


-- 2) Функция, вычисляющая скалярное произведение двух списков (используйте функции foldr и zipWith).
-- Num - класс типов, включающий числовые типы: Int, Integer, Float, Double
dotProduct :: Num a => [a] -> [a] -> a
dotProduct xs ys = foldr (+) 0 $ zipWith (*) xs ys


-- 3) Функция countEven, возвращающая количество четных элементов в списке.
-- Integral - класс типов, включаюищй целые типы: Int, Integer
countEven :: Integral a => [a] -> Int
countEven xs = foldr (\x acc -> if even x then acc + 1 else acc) 0 xs


-- 4) Функция quicksort, осуществляющая быструю сортировку списка.
-- Ord - класс типов, предоставляющий операции сравнения, включает такие типы как Int, Char, String и др.
quicksort :: Ord a => [a] -> [a]
quicksort []     = []
quicksort (x:xs) = quicksort (filter (< x) xs) ++ [x] ++ quicksort (filter (>= x) xs)


-- 5) Определенная в предыдущем пункте функция quicksort сортирует список в порядке возрастания.
-- Обобщим ее: пусть она принимает еще один аргумент — функцию сравнения типа a -> a -> Bool и сортирует список в соответствие с ней.
quicksortBy :: Ord a => (a -> a -> Bool) -> [a] -> [a]
quicksortBy _ []     = []
quicksortBy cmp (x:xs) = quicksortBy cmp (filter (\y -> y `cmp` x) xs)
                          ++ [x]
                          ++ quicksortBy cmp (filter (\y -> not (y `cmp` x)) xs)


main :: IO ()
main = do
    let nums = [4, 2, 7, 1, 5, 8, 3, 6] :: [Double]
    let nums2 = [1, 2, 3, 4, 5] :: [Int]
    let nums3 = [10, 20, 30, 40, 50] :: [Int]

    putStrLn "\n1) Вычисление арифметического среднего элементов списка:"
    putStrLn $ "Список: " ++ show nums
    putStrLn $ "Среднее: " ++ show (average nums)

    putStrLn "\n2) Вычисление скалярного произведения двух списков:"
    putStrLn $ "Первый список: " ++ show nums2
    putStrLn $ "Второй список: " ++ show nums3
    putStrLn $ "Скалярное произведение: " ++ show (dotProduct nums2 nums3)

    putStrLn "\n3) Подсчет количества четных элементов в списке:"
    putStrLn $ "Список: " ++ show nums2
    putStrLn $ "Количество четных элементов: " ++ show (countEven nums2)

    putStrLn "\n4) Быстрая сортировка списка:"
    putStrLn $ "Список до сортировки: " ++ show nums
    putStrLn $ "Список после сортировки: " ++ show (quicksort nums)

    putStrLn "\n5) Обобщенная быстрая сортировка списка по убыванию:"
    putStrLn $ "Список до сортировки: " ++ show nums
    putStrLn $ "Список после сортировки: " ++ show (quicksortBy (>) nums)
