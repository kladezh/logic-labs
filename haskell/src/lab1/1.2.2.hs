min3 :: Int -> Int -> Int -> Int
min3 a b c = min a (min b c)

-- Пример использования:
main = do
    print (min3 5 10 3)  -- Вывод: 3