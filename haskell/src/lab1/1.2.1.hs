max3 :: Int -> Int -> Int -> Int
max3 a b c = max a (max b c)

main = do
    print (max3 5 10 3)  -- Вывод: 10 