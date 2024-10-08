# Hangman_Game_Qt

[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/Dariarty/Hangman_Game_Qt/blob/main/README.md)
[![ru](https://img.shields.io/badge/lang-ru-red.svg)](https://github.com/Dariarty/Hangman_Game_Qt/blob/main/README.ru.md)

<a href="https://dariarty.github.io/Hangman_Game_Qt/" title="GitHub Pages link">Играть в браузере - версия WebAssembly на хостинге GitHub Pages</a>

Кроссплатформенная игра "Виселица", написанная на C++/Qt/QML для Windows, Linux, Android и WebAssembly. </br> 

Виселица - это игра на угадывание слов. Программа случайным образом выбирает слово, которое должен угадать игрок. Изначально известно количество букв, и каждая буква обозначается чертой. С каждым ходом игрок предлагает букву, если она есть в слове - эта буква открывается, если нет - к рисунку виселицы добавляется черта. Если рисунок повешенного человечка завершен, игрок проигрывает. Для победы надо назвать все буквы в слове. 

## Функции приложения

* Множество игровых режимов со словами на разные темы.</br>
* Более 2000 русских и 2500 английских слов для игры.</br>
* 15 русских и английских тем, которые можно перемешать и выбрать случайную.</br>
* Выбор случайного слова для игры из файла.</br>
* Звуковые эффекты во время геймплея.</br>
* Полноэкранный и оконный режимы, поддержка разных размеров окна.</br>
* Поддержка динамического перевода.</br>
* На данный момент, приложение доступно на русском и английском языках.</br>

## Скриншоты

<h3 align="center">Игровой процесс</h3>

![alt text](assets/ru_RU/gameplay.jpg)

<h3 align="center">Главное меню приложения</h3>

![alt text](assets/ru_RU/menu.jpg)

<h3 align="center">Игрок успешно угадал слово</h3>

![alt text](assets/ru_RU/victory.jpg)

<h3 align="center">Игрок не смог угадать слово</h3>

![alt text](assets/ru_RU/defeat.jpg)

## Сборка исходного кода
На данный момент поддерживается сборка на Windows, Linux, Android и WebAssembly (с использованием Qt for WebAssembly).</br>
Минимальная поддерживаемая версия Qt 5.10. Также приложение может быть собрано на Qt6, протестирована сборка на Qt 6.7.2 </br>

1.  Загрузить Qt5.10+/Qt6, Qt Creator и компилятор MinGW.</br>
2.  Сконфигурировать kit в Qt Creator для целевого устройства. </br>
3.  Склонировать репозиторий
     ```sh
     git clone https://github.com/Dariarty/Hangman_Game_Qt.git
     ```
4.  Открыть файл проекта src/hangman_game.pro в Qt Creator</br>
5.  Запустить команду lrelease для чтения файлов TS и генерации файлов перевода QM. </br>
    Qt Creator > Tools > External > Linguist > Release Translations (lrelease) </br>
6.  Запустить qmake.</br>
7.  Собрать проект в Qt Creator.</br>

## Атрибуция

<a href="https://www.freepik.com/icon/hangman_3401289#fromView=keyword&page=1&position=6&uuid=05e78836-b3a9-48e0-9ded-0f79c2320b2e" title="App Icon Attribution">Иконка приложения создана Freepik</a>

## Лицензия

Распространяется под MIT License. Смотри [LICENSE](LICENSE) для полной информации.
