isSorted :: Double -> Double -> Double -> Bool
isSorted x y z = (x <= y && y <= z) || (x >= y && y >= z)

-- Пример использования:
main = do
    print (isSorted 1 2 3)   -- Вывод: True (упорядочены по возрастанию)
    print (isSorted 3 2 1)   -- Вывод: True (упорядочены по убыванию)
    print (isSorted 1 3 2)   -- Вывод: False (не упорядочены)