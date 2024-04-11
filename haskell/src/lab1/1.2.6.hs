{-
Определение параллельности отрезков по вектороному произведению. Если произведение двух векторов равно 0, значит векторы паралельны.
-}


isParallel :: (Double, Double) -> (Double, Double) -> (Double, Double) -> (Double, Double) -> Bool
isParallel (x1, y1) (x2, y2) (x3, y3) (x4, y4) =
    (x2 - x1) * (y4 - y3) == (y2 - y1) * (x4 - x3)

-- Пример использования:
main = do
    print (isParallel (1,1) (2,2) (2,0) (4,2))  -- Вывод: True
    print (isParallel (1,1) (2,2) (3,3) (4,4))  -- Вывод: True (отрезки лежат на одной прямой)
    print (isParallel (1,1) (2,2) (0,0) (3,4))  -- Вывод: False