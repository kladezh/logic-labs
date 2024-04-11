import System.Environment ( getArgs )

main :: IO ()
main = do
    -- Получаем список аргументов командной строки
    args <- getArgs
    -- Перебираем каждый аргумент (имя файла)
    mapM_ printFileContents args -- mapM_ применяет функцию к каждому элементу списка и не сохраняет результат

-- Функция для вывода содержимого файла
printFileContents :: FilePath -> IO ()
printFileContents filename = do
    -- Пытаемся прочитать содержимое файла
    fileContents <- readFile filename
    -- Выводим содержимое файла на экран
    putStrLn ("Содержимое файла " ++ filename ++ ":")
    putStrLn fileContents
