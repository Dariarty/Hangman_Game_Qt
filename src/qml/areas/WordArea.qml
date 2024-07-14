import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12
import QtQuick.Layouts 1.15

import "../components"

Rectangle {
    id: rootWordArea
    width: parent.width * 0.6 - anchors.leftMargin - anchors.rightMargin

    property double widthToHeightMultiplier: 0.64

    property double symbolHeight:
        Math.min((rootWordArea.width / wordModel.count) * 0.8 * ( 1 / widthToHeightMultiplier),
                 wordRect.height)

    anchors{
        right: parent.right
        top: parent.top
        bottom: keyboardRect.top
        margins: 50 * ratio
    }

    ListModel{
        id: wordModel

        ListElement{
            displayedLetter: "Т"
        }

        ListElement{
            displayedLetter: "Ю"
        }

        ListElement{
            displayedLetter: "Л"
        }

        ListElement{
            displayedLetter: "Е"
        }

        ListElement{
            displayedLetter: "Н"
        }

        ListElement{
            displayedLetter: "Ь"
        }
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
                    anchors.verticalCenter: parent.verticalCenter
                }

            }

        }

        Rectangle{
            id:gameEndMessageRect
            Layout.preferredHeight: 150 * ratio
            Layout.preferredWidth: wordColumn.width

            color: "transparent"

            Text{
                fontSizeMode: Text.Fit
                text: "Вы победили!"
                anchors.fill: parent
                color: "green"
                font.pointSize: 255
                horizontalAlignment: Qt.AlignHCenter
                font.family: "Comic Sans MS"
            }

        }

        Rectangle{
            id: gameEndButtonsRect
            Layout.preferredHeight: 100 * ratio
            Layout.preferredWidth: parent.width
            color: "transparent"

            MenuButton{
                id: playAgainButton

                text: "Играть еще"

                height: parent.height
                width: parent.width / 2 - anchors.rightMargin
                anchors.rightMargin: 20 * ratio
                anchors.left: parent.left

            }

            MenuButton{
                id: exitMenuButton

                text: "В меню"

                width: parent.width / 2 - anchors.leftMargin
                height: parent.height
                anchors.leftMargin: 20 * ratio
                anchors.right: parent.right

                onClicked: {
                    layout.currentIndex = 0
                }
            }
        }

    }
}
