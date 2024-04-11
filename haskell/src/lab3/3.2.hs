{- 2. 
Определите тип данных, представлющий информацию о карте в карточной игре. 
Каждая карта характеризуется одной из четырех мастей. 
Карта может быть либо младшей (от двойки до десятки), либо картинкой (валет, дама, король, туз). 

Определите функции:
    1) Функция іsMinor, проверяющая, что ее аргумент является младшей картой.
    2) Функция sameSuit, проверяющая, что переданные в нее карты одной масти.
    3) Функция beats :: Card -> Card -> Bool, проверяющая, что карта, переданная ей в качестве первого аргумента, бьет карту, являющуюся вторым аргументом.
    4) Функция beats2, аналогичная beats, но принимающая в качестве дополнительного аргумента козырную масть.
    5) Функция beatsList, принимающая в качестве аргументов список карт, карту и козырную масть 
        и возвращающая список тех карт из первого аргумента, которые бьют указанную карту с учетом козырной масти.
    6) Функция, по заданному списку карт возвращающая список чисел, каждое из которых является возможной суммой очков указанных карт, 
        рассчитанных по правилам игры в «двадцать одно»: 
        младшие карты считаются по номиналу, валет, дама и король считаются за 10 очков, 
        туз может рассматриваться и как 1 и как 11 очков. 
        Функция должна вернуть все возможные варианты.
-}


-- Тип данных для представления мастей карт
data Suit where
  Hearts :: Suit    -- Черви
  Diamonds :: Suit  -- Бубны
  Clubs :: Suit     -- Крести
  Spades :: Suit    -- Пики
  deriving (Show, Eq)

-- Тип данных для представления минорных карт
data Rank where
  One :: Rank
  Two :: Rank
  Three :: Rank
  Four :: Rank
  Five :: Rank
  Six :: Rank
  Seven :: Rank
  Eight :: Rank
  Nine :: Rank
  Jack :: Rank
  Queen :: Rank
  King :: Rank
  Ace :: Rank
  deriving (Show, Eq)

-- Тип данных для представления карты
data Card where
  Card :: Rank -> Suit -> Card
  deriving (Show, Eq)

getRank :: Card -> Rank
getRank (Card rank _) = rank

getSuit :: Card -> Suit
getSuit (Card _ suit) = suit

-- 1) Функция для проверки, является ли карта минорной
isMinor :: Card -> Bool
isMinor card = getRank card `elem` [One, Two, Three, Four, Five, Six, Seven, Eight, Nine]

-- 2) Функция для проверки, одной ли масти у двух карт
sameSuit :: Card -> Card -> Bool
sameSuit card1 card2 = getSuit card1 == getSuit card2

-- 3) Функция, проверяющая, бьет ли первая карта вторую
beats :: Card -> Card -> Bool
beats (Card rank1 suit1) (Card rank2 suit2)
    | suit1 /= suit2 = False  -- Если масти не совпадают, первая карта не бьет вторую
    | otherwise = rankValue rank1 > rankValue rank2  -- Сравниваем значения карт по их порядковым номерам

-- 4) Функция, проверяющая, бьет ли первая карта вторую с учетом козырной масти
beats2 :: Suit -> Card -> Card -> Bool
beats2 trumpSuit (Card rank1 suit1) (Card rank2 suit2)
    | suit1 == trumpSuit && suit2 /= trumpSuit = True  -- Если первая карта козырная, а вторая нет, первая карта бьет вторую
    | suit1 /= trumpSuit && suit2 == trumpSuit = False  -- Если первая карта не козырная, а вторая козырная, первая карта не бьет вторую
    | otherwise = rankValue rank1 > rankValue rank2  -- В остальных случаях сравниваем значения карт

-- 5) Функция для выбора карт из списка, которые бьют указанную карту с учетом козырной масти
beatsList :: Suit -> [Card] -> Card -> [Card]
beatsList trumpSuit cards targetCard = filter (\card -> beats2 trumpSuit card targetCard) cards

-- Вспомогательная функция для преобразования ранга в целочисленное значение
rankValue :: Rank -> Int
rankValue rank = case rank of
    One -> 1
    Two -> 2
    Three -> 3
    Four -> 4
    Five -> 5
    Six -> 6
    Seven -> 7
    Eight -> 8
    Nine -> 9
    Jack -> 10
    Queen -> 11
    King -> 12
    Ace -> 13


-- 6) Функция, считающая возможную сумму очков набора карт по правилу "двадцать одно"

-- Функция для вычисления возможных сумм очков по рангу карты
blackjackRankValue :: Rank -> [Int]
blackjackRankValue rank = case rank of
    One   -> [1]
    Two   -> [2]
    Three -> [3]
    Four  -> [4]
    Five  -> [5]
    Six   -> [6]
    Seven -> [7]
    Eight -> [8]
    Nine  -> [9]
    Jack  -> [10]
    Queen -> [10]
    King  -> [10]
    Ace   -> [1, 11]

-- Функция для вычисления всех возможных сумм очков набора карт по правилу "двадцать одно"
blackjack :: [Card] -> [Int]
blackjack = foldr (combineValues . blackjackRankValue . getRank) [0]

-- Вспомогательная функция для комбинирования всех возможных сумм очков
combineValues :: [Int] -> [Int] -> [Int]
combineValues cardValues accValues = [x + y | x <- cardValues, y <- accValues]


-- Создадим некоторые карты
cards1 = [Card Ace Hearts, Card King Diamonds]  -- Вариант с тузом как 11
cards2 = [Card Ace Hearts, Card King Diamonds, Card Three Clubs]  -- Вариант с тузом как 1

-- Проверим результаты
main = do
    putStrLn "Тестирование blackjack функции"
    putStrLn "Карты: Туз Черви, Король Бубны" 
    print (blackjack cards1)
    putStrLn "Карты: Туз Черви, Король Бубны, Тройка Крести" 
    print $ blackjack cards2
