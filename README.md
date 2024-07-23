# Hangman_Game_Qt

[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/Dariarty/Hangman_Game_Qt/blob/main/README.md)
[![ru](https://img.shields.io/badge/lang-ru-red.svg)](https://github.com/Dariarty/Hangman_Game_Qt/blob/main/README.ru.md)

Desktop Hangman game made with C++/Qt/QML. </br> 

Hangman is a word guessing game. Program randomly chooses a word and the player tries to guess it by suggesting letters. Which each incorrect guess, a line is added to hangman drawing. If the picture is complete, player loses. To win, player has to correctly guess all letters in a word.

## Features

* Words to guess are chosen randomly from a file.</br>
* Application supports dynamic translations.</br>
* Currently, the game is available in English and Russian.</br>
* More than 1500 English words and 1000 Russian words.</br>
* Fullscreen and Windowed modes.</br>



## Screenshots

<h3 align="center">Gameplay</h3>

![alt text](assets/en_US/gameplay.png)

<h3 align="center">Player has successfully guessed a word</h3>

![alt text](assets/en_US/victory.png)

<h3 align="center">Player has failed to guess a word</h3>

![alt text](assets/en_US/defeat.png)

<h3 align="center">Main Menu of the application</h3>

![alt text](assets/en_US/menu.png)

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



