# Hangman_Game_Qt

[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/Dariarty/Hangman_Game_Qt/blob/main/README.md)
[![ru](https://img.shields.io/badge/lang-ru-red.svg)](https://github.com/Dariarty/Hangman_Game_Qt/blob/main/README.ru.md)

Десктопная игра "Виселица" для Windows и Linux, написанная на C++/Qt/QML. </br> 

Виселица - это игра на угадывание слов. Программа случайным образом выбирает слово, которое должен угадать игрок. Изначально известно количество букв, и каждая буква обозначается чертой. С каждым ходом игрок предлагает букву, если она есть в слове - эта буква открывается, если нет - к рисунку виселицы добавляется черта. Если рисунок повешенного человечка завершен, игрок проигрывает. Для победы надо назвать все буквы в слове. 

## Функции приложения

* Выбор случайного слова для игры из файла.</br>
* Поддержка динамического перевода.</br>
* На данный момент, приложение доступно на русском и английском языках.</br>
* Более 1000 русских и 1500 английских слов для игры.</br>
* Полноэкранный и оконный режимы.</br>

## Скриншоты

<h3 align="center">Игровой процесс</h3>

![alt text](assets/ru_RU/gameplay.png)

<h3 align="center">Игрок успешно угадал слово</h3>

![alt text](assets/ru_RU/victory.png)

<h3 align="center">Игрок не смог угадать слово</h3>

![alt text](assets/ru_RU/defeat.png)

<h3 align="center">Главное меню приложения</h3>

![alt text](assets/ru_RU/menu.png)

## Building From Source Code
Building both for Windows and Linux is supported. </br>
Minimal supported Qt version is Qt 5.10. Maximum tested Qt version for building the app is Qt 6.7.2 </br>
1.  Download and install Qt5.10+/Qt6, Qt Creator and MinGW compiler.</br>
2.  Configure Qt Creator Kit for Desktop. </br>
3.  Clone the repo.
     ```sh
     git clone https://github.com/Dariarty/Hangman_Game_Qt.git
     ```
4.  Open src/hangman_game.pro in Qt Creator.</br>
5.  Run lrelease tool to read the TS files and produce the QM translation files. </br>
    Qt Creator > Tools > External > Linguist > Release Translations (lrelease) </br>
7.  Run qmake.</br>
8.  Build the project in Qt Creator.</br>

## ToDo

- [x] Develop Hangman game with basic functionality
- [x] Design app's GUI
- [x] Add multi-language support
- [x] Publish first release
- [ ] Add sound effects
- [ ] Add gamemodes to choose words from a specific topic
- [ ] Add support for more languages

See the [open issues](https://github.com/Dariarty/Hangman_Game_Qt/issues) for a full list of planned features and known issues.

## Attributions

Application Icon is designed by [Freepik](https://freepik.com)

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.


