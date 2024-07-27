import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../areas"
import "../components"

Rectangle {
    id: gameRoot
    color: "transparent"

    //Title Area
    TitleArea{
        id: title
        text: qsTr("Guess a word")
    }

    //Drawing Area
    DrawingArea{
        id: drawingRect
    }

    //Screen Keyboard Area
    KeyboardArea{
        id: keyboardRect
    }

    //Word Area
    WordArea{
        id: wordRect
    }

    //Exit to menu Button
    SwitchScreenButton{
        id: exitToMenuButton
        source: "qrc:/resources/icons/quit_to_menu.png"
        onClicked: {
            layout.currentIndex = 0
            Game.abandonGame();
        }
    }

}
