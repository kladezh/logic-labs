{-
IO - тип ввода-вывода, информирует о том, что функция будет взаимодействовать с внешним миром
() - пустой тип (тип IO () означает что функция ничего не возращает)
<- - символ связыывания, извелечения результата из монады (обычно IO)
do - ключевов слово для do-нотации, определяющей последовательность операторов, которые выполняются по порядку
монада - абстрактный математический объект, который используются для работы с побочными эффектами, такими как ввод-вывод, обработка ошибок, состояние и другие.
-}


bothTrue :: Bool -> Bool -> Bool
bothTrue True True = True
bothTrue _ _       = False

main :: IO ()
main = do
    putStrLn "Введите два значения типа Bool (True или False), разделенные пробелом:"

    input <- getLine
    let [first, second] = words input
        arg1 = read first :: Bool
        arg2 = read second :: Bool

    putStrLn $ "Результат: " ++ show (bothTrue arg1 arg2)