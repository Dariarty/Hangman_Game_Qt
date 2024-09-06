# Hangman_Game_Qt

[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/Dariarty/Hangman_Game_Qt/blob/main/README.md)
[![ru](https://img.shields.io/badge/lang-ru-red.svg)](https://github.com/Dariarty/Hangman_Game_Qt/blob/main/README.ru.md)

<a href="https://dariarty.github.io/Hangman_Game_Qt/" title="GitHub Pages link">Play in browser - WebAssembly version hosted on GitHub Pages</a>

Cross-platform Hangman game made with C++/Qt/QML for Windows, Linux, Android and WebAssembly. </br> 

Hangman is a word guessing game. Program randomly chooses a word and the player tries to guess it by suggesting letters. With each incorrect guess, a line is added to hangman drawing. If the picture is complete, player loses. To win, player has to correctly guess all letters in a word.

## Features

* Lots of gamemodes for words on different themes and topics.</br>
* More than 2500 English and 2000 Russian words.</br>
* 15 English and 15 Russian topics. Topics can be shuffled and chosen randomly.</br>
* Words to guess are chosen randomly from files. </br>
* Sound effects when interacting with game's GUI.</br>
* Fullscreen and Windowed modes, app is responsive to different window sizes.</br>
* Application supports dynamic translations.</br>
* Currently, the game is available in English and Russian.</br>

## Screenshots

<h3 align="center">Gameplay</h3>

![alt text](assets/en_US/gameplay.jpg)

<h3 align="center">Main Menu of the application</h3>

![alt text](assets/en_US/menu.jpg)

<h3 align="center">Player has successfully guessed a word</h3>

![alt text](assets/en_US/victory.jpg)

<h3 align="center">Player has failed to guess a word</h3>

![alt text](assets/en_US/defeat.jpg)


## Building Source Code
App supports building for Windows, Linux, Android and WebAssembly (using Qt for WebAssembly). </br>
Minimal supported Qt version is Qt 5.10. Maximum tested Qt version for building the app is Qt 6.7.2 </br>
1.  Download and install Qt5.10+/Qt6, Qt Creator and MinGW compiler.</br>
2.  Configure Qt Creator Kit for Desktop or target device. </br>
3.  Clone the repo.
     ```sh
     git clone https://github.com/Dariarty/Hangman_Game_Qt.git
     ```
4.  Open src/hangman_game.pro in Qt Creator.</br>
5.  Run lrelease tool to read the TS files and produce the QM translation files. </br>
    Qt Creator > Tools > External > Linguist > Release Translations (lrelease) </br>
7.  Run qmake.</br>
8.  Build the project in Qt Creator.</br>

## Attributions

<a href="https://www.freepik.com/icon/hangman_3401289#fromView=keyword&page=1&position=6&uuid=05e78836-b3a9-48e0-9ded-0f79c2320b2e" title="App Icon Attribution">Application Icon is designed by Freepik</a>


## License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.



