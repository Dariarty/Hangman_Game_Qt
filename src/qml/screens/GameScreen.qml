import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../areas"
import "../keyboards"

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
        source: "qrc:/qml/keyboards/Keyboard_" + Translator.language + ".qml"
    }

    //Word Area
    WordArea{
        id: wordRect
    }

    //Exit to menu Button
    MouseArea{
        id: exitToMenuButton

        anchors{
            left: parent.left
            bottom: parent.bottom
            leftMargin: 30 * ratio
            bottomMargin: 30 * ratio
        }

        hoverEnabled: true

        height: 100 * ratio
        width: 100 * ratio

        Image{
            source: "qrc:/resources/icons/quit_to_menu.png"
            anchors.fill: parent
            opacity: parent.containsPress ? 0.75 :
                parent.containsMouse ? 0.5 : 1
        }

        onClicked: {
            layout.currentIndex = 0
            Game.abandonGame();
        }
    }

}
