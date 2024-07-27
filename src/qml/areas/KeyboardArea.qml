import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../components"

Rectangle{
    id: keyboardRoot

    height: parent.height * 0.3
    color: "transparent"

    anchors{
        left: parent.left
        right: parent.right
        bottom: parent.bottom
        bottomMargin: 20 * ratio
        rightMargin: 200 * ratio
        leftMargin: 200 * ratio
    }

    Connections{
        target: Game
        function onRoundStarted(wordLength){
            keyboardModel.clear()
             for(var i = 0; i < Translator.alphabet.length; i++){
                 keyboardModel.append({buttonSymbol: Translator.alphabet[i].toUpperCase()})
             }
        }
    }

    ListModel{
        id: keyboardModel
    }

    GridView{
        id: keyboardView
        anchors.fill: parent

        model: keyboardModel

        cellHeight: height / 3
        cellWidth:  width / (Math.ceil(Translator.alphabet.length / 3))

        interactive: false

        delegate: KeyboardButton{
            text: buttonSymbol
            width: keyboardView.cellWidth
            height: keyboardView.cellHeight
        }
    }

    Rectangle{
        color: standartColor
        height: 5 * ratio
        anchors{
            left: parent.left
            top: parent.top
            right: parent.right
        }
    }
}
