import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12
import QtQuick.Layouts 1.15

import "../components"

Rectangle {
    id: rootWordArea
    width: parent.width * 0.6 - anchors.leftMargin - anchors.rightMargin

    readonly property double widthToHeightMultiplier: 0.64

    readonly property double symbolHeight:
        Math.min((rootWordArea.width / wordModel.count) * 0.8 * ( 1 / widthToHeightMultiplier),
                 wordRect.height)

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
        bottomMargin: 30
        topMargin: 30
    }

    ListModel{
        id: wordModel
    }

    color: "transparent"

    ColumnLayout {
        id: wordColumn

        anchors.fill: parent

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Rectangle{
            id: wordRect
            Layout.preferredWidth: ((symbolHeight * widthToHeightMultiplier) + wordView.spacing ) * wordModel.count
            Layout.preferredHeight: 250 * ratio
            Layout.alignment: Qt.AlignHCenter

            color: "transparent"

            ListView{
                id: wordView

                anchors.fill: parent

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
            Layout.preferredHeight: 150 * ratio
            Layout.preferredWidth: wordColumn.width

            color: "transparent"

            Text{
                id: gameEndMessage

                fontSizeMode: Text.Fit
                anchors.fill: parent
                font.pointSize: 200
                horizontalAlignment: Qt.AlignHCenter
                font.family: standartFont
            }

        }

        Rectangle{
            id: gameEndButtonsRect
            Layout.preferredHeight: 100 * ratio
            Layout.preferredWidth: parent.width
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
