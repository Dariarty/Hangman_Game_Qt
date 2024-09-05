import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12
import QtQuick.Layouts 1.15

import "../components"

Rectangle {
    id: rootWordArea
    width: parent.width * 0.6 - anchors.leftMargin - anchors.rightMargin

    readonly property double letterAspectRatio: 1.5625

    readonly property double symbolHeight:
        Math.min((rootWordArea.width / wordModel.count) * 0.8 * letterAspectRatio,
                 250 * ratio)

    Connections{
        target: Game
        function onRoundStarted(wordLength){
            layout.currentIndex = 1

            wordModel.clear()

            for(var i = 0; i < wordLength; i++){
                wordModel.append({displayedLetter: "", failed: false})
            }

            gameEndMessageRect.visible = false
            gameEndButtonsRect.visible = false
        }

        function onRoundFinished(victory){
            gameEndMessageRect.visible = true
            gameEndButtonsRect.visible = true

            gameEndMessage.text = victory ? qsTr("Victory!") : qsTr("Defeat")
            gameEndMessage.color = victory ? "green" : "red"
        }

        function onOpenLetter(letter, position, success){
            wordModel.setProperty(position, "displayedLetter", letter)
            wordModel.setProperty(position, "failed", !success)
        }
    }

    anchors{
        right: parent.right
        top: title.bottom
        bottom: keyboardRect.top
        rightMargin: 80
        leftMargin: 30
    }

    ListModel{
        id: wordModel
    }

    color: "transparent"

    Column {
        id: wordColumn

        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Rectangle{
            id: wordRect
            width: ((symbolHeight / letterAspectRatio) + wordView.spacing ) * wordModel.count
            height: symbolHeight
            anchors.horizontalCenter: parent.horizontalCenter

            color: "transparent"

            ListView{
                id: wordView

                anchors.bottom: parent.bottom
                width: parent.width
                height: symbolHeight

                orientation: ListView.Horizontal
                interactive: false

                spacing: symbolHeight / 8

                model: wordModel

                delegate: WordLetter{
                    text: displayedLetter
                    height: rootWordArea.symbolHeight
                    failedGuess: failed
                }

            }

        }

        Rectangle{
            id:gameEndMessageRect
            height: Math.min(rootWordArea.height - wordRect.height - gameEndButtonsRect.height,
                             150 * ratio)
            width: wordColumn.width
            anchors.horizontalCenter: parent.horizontalCenter

            color: "transparent"

            Text{
                id: gameEndMessage

                fontSizeMode: Text.Fit
                anchors.fill: parent
                anchors.bottomMargin: 10 * ratio
                font.pointSize: 200
                horizontalAlignment: Qt.AlignHCenter
                font.family: standartFont
            }

        }

        Rectangle{
            id: gameEndButtonsRect
            height: 100 * ratio
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            color: "transparent"

            MenuButton{
                id: playAgainButton

                text: qsTr("Play again")

                height: parent.height
                width: parent.width / 2 - anchors.rightMargin
                anchors.rightMargin: 20 * ratio
                anchors.left: parent.left
                onClicked: {
                    GameMenu.playAgain()
                }

            }

            MenuButton{
                id: exitMenuButton

                text: qsTr("To menu")

                width: parent.width / 2 - anchors.leftMargin
                height: parent.height
                anchors.leftMargin: 20 * ratio
                anchors.right: parent.right

                onClicked: {
                    layout.currentIndex = 0
                    Game.abandonGame();
                }
            }
        }

    }
}
