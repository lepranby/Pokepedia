# Pokepedia
Pokemon App written in Swift (UIKit).

Pokémon viewer app. By tapping on a cell (UICollectionView), a screen appears with detailed information (according to the terms of reference) - type, height, weight.

Приложение для проссмотра покемонов. По тапу на ячейку (UICollectionView) появляется экран с подробной информацией (согласно техническому заданию) - тип, рост, вес.
Я пробовал реализовать АПИ через https://pokeapi.co/api/v2/pokemon (по ТЗ) но он был недоступен в течении трех дней, и ввиду отсутствия опыта написания без видимого результата при недоступном АПИ, перенял другой АПИ. Я использовал pokedex (https://pokedex-bb36f.firebaseio.com/pokemon.json).

Написан основной сервис, который обрабатывает данные + контроллеры для воспроизведения информации. 
Интерфейс написан кодом, без использования сторибордов. 

Был заложен в планах поиск по ячейкам и быстрый предпроссмотр (popupView). Не успел. 
Реализую в следующих версиях.

![IMG_1661](https://github.com/lepranby/Pokepedia/assets/113884557/e33892cc-884f-4e1e-b2b1-85a9e4bc2bcb)
![IMG_1658](https://github.com/lepranby/Pokepedia/assets/113884557/958214b0-051b-4332-954b-55f492bcf1b4)
