bothTrue :: Bool -> Bool -> Bool
bothTrue True True = True
bothTrue _ _       = False

-- Пример использования:
main = do
    print (bothTrue (2 < 5) (2 < 6))    -- Вывод: True
    print (bothTrue False True)   -- Вывод: False
    print (bothTrue True False)   -- Вывод: False
    print (bothTrue False False)  -- Вывод: False