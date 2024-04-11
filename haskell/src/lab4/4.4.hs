-- data FileSystem where
--   File :: String -> Int -> FileSystem                -- Файл (имя, размер в байтах)
--   Directory :: String -> [FileSystem] -> FileSystem  -- Каталог (имя, список содержимого)
--   deriving(Show, Eq)

data FileSystem = File String Int
    | Directory String [FileSystem]
    deriving(Show, Eq)


-- 1) Функция, возвращающая список полных имен всех файлов каталога, включая подкаталоги
dirall :: FileSystem -> [String]
dirall (File name _) = [name]
dirall (Directory name contents) = map (\subfile -> name ++ "/" ++ subfile) (concatMap dirall contents)

-- 2) Функция, возращающая путь, ведущий к файлу с заданным именем
find :: FileSystem -> String -> Maybe String
find (File name _) target = if name == target then Just name else Nothing
find (Directory name contents) target =
    case filter (/= Nothing) (map (\subfile -> fmap (\s -> name ++ "/" ++ s) (find subfile target)) contents) of
        [] -> Nothing
        (x:_) -> x

-- 3) Функция, возращающая количество байт, занимаемых файла у заданного каталога (включая файлы и подкаталоги)
du :: FileSystem -> Int
du (File _ size) = size
du (Directory _ contents) = sum (map du contents)


-- Примеры файловой системы
files =
    Directory "root"
        [ 
            File "file1.txt" 100, 
            File "file2.txt" 200, 
            Directory "subdir"
            [ 
                File "file3.txt" 150,
                File "file4.txt" 300
            ]
        ]



main = do
    putStrLn "1) Список всех файлов в файловой системе:"
    mapM_ putStrLn (dirall files)

    putStrLn "\n2) Найти файл 'file3.txt':"
    putStrLn $ case find files "file3.txt" of
        Just path -> "Файл найден: " ++ path
        Nothing -> "Файл не найден..."

    putStrLn "\n3) Размер всех файлов в файловой системе:"
    putStrLn $ show (du files) ++ " байт"
