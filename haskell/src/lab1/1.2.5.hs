solve2 :: Double -> Double -> (Bool, Double)
solve2 a b
    | a == 0    = (False, 0.0)  -- Уравнение не является линейным
    | otherwise = (True, (-b) / a)

-- Пример использования:
main = do
    print (solve2 2.0 4.0)  -- Вывод: (True, -2.0)
    print (solve2 0.0 4.0)  -- Вывод: (False, 0.0)