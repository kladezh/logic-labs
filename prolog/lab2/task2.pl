авто("Москвич",9500,зеленый,1). 
авто("Москвич",3000,синий,5). 
авто("Волга",15000,черный,1). 
авто("Волга",8000,белый,6). 
авто("УАЗ",9000,зеленый,3). 
авто("ВАЗ",6000,белый,4). 
авто("ВАЗ",4000,синий,10). 
авто("ВАЗ-2108",8000,серый,2).

следует_купить(Марка, Цена, Цвет, Возраст, Сумма) :- 
    авто(Марка, Цена, Цвет, Возраст),
    (Цвет = зеленый ; Цвет = синий), 
    Цена =< Сумма, 
    Возраст < 3.

можно_купить(Авто, Сумма) :-
    следует_купить(Марка, Цена, Цвет, Возраст, Сумма),
    Авто = (Марка, Цена, Цвет, Возраст).

/** <examples>
?- авто(Марка, Цена, Цвет, Возраст), Цена < 5000. % Найти авто с ценой < 5000, любого цвета и возраста. %
?- можно_купить(Авто, 10000). % Какие авто можно купить за 10000? %
*/