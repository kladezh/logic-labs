import Data.Typeable

main = do

    -- 1) ((Char,Integer), String, [Double])
    let expr1 = (('x' :: Char, 10 :: Integer), "OpenAI" :: String, [2.718 :: Double, 3.14159 :: Double, 1.618 :: Double])

    -- 2) [(Double,Bool,(String,Integer))]
    let expr2 = [(2.718 :: Double, False :: Bool, ("model" :: String, 3 :: Integer))]

    -- 3) ([Integer],[Double],[(Bool,Char)])
    let expr3 = ([4 :: Integer, 5 :: Integer, 6 :: Integer], [1.618 :: Double, 2.71828 :: Double, 3.14159 :: Double], [(False :: Bool, 'x' :: Char), (True :: Bool, 'y' :: Char)])

    -- 4) [[[(Integer,Bool)]]]
    let expr4 = [[[(4 :: Integer, False :: Bool), (5 :: Integer, True :: Bool)], [(6 :: Integer, False :: Bool)]]]

    -- 5) (((Char,Char),Char),[String])
    let expr5 = ((('o' :: Char, 'p' :: Char), 'e' :: Char), ["AI" :: String, "ChatGPT" :: String])

    -- 6) (([Double],[Bool]),[Integer])
    let expr6 = (([2.71828 :: Double, 3.14159 :: Double], [False :: Bool, True :: Bool]), [4 :: Integer, 5 :: Integer, 6 :: Integer])

    -- 7) [Integer, (Integer,[Bool])] - указаны разные типы элементов списка, поэтому используем такой список [(Integer, (Integer,[Bool]))]
    let expr7 = [(100 :: Integer, (20 :: Integer, [False :: Bool, True :: Bool]))]

    -- 8) (Bool,([Bool],[Integer]))
    let expr8 = (True :: Bool, ([False :: Bool, True :: Bool], [4 :: Integer, 5 :: Integer, 6 :: Integer]))

    -- 9) [([Bool],[Double])]
    let expr9 = [([False :: Bool, True :: Bool], [2.718 :: Double, 3.14159 :: Double])]

    -- 10) [([Integer],[Char])]
    let expr20 = [([4 :: Integer, 5 :: Integer, 6 :: Integer], ['x' :: Char, 'y' :: Char])]

    -- вывод типа выражения при компиляции
    putStrLn ("expr5 :: " ++ show (typeOf expr5))


{-
Чтобы вывести тип выражения в интерпритаторе нужно использовать команду :t (:type), например:

ghci> let expr5 = ((('o' :: Char, 'p' :: Char), 'e' :: Char), ["AI" :: String, "ChatGPT" :: String])
ghci> :t expr5

Выведет: 
expr5 :: (((Char, Char), Char), [String])
-}