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

    anchors{
        right: parent.right
        top: title.bottom
        bottom: keyboardRect.top
        rightMargin: 80
        leftMargin: 30
        bottomMargin: 50
    }

    ListModel{
        id: wordModel

        ListElement{
            displayedLetter: "В"
        }

        ListElement{
            displayedLetter: "И"
        }

        ListElement{
            displayedLetter: "С"
        }

        ListElement{
            displayedLetter: "Е"
        }

        ListElement{
            displayedLetter: "Л"
        }

        ListElement{
            displayedLetter: "И"
        }
        ListElement{
            displayedLetter: "Ц"
        }
        ListElement{
            displayedLetter: "А"
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
                id: gameEndMessage

                fontSizeMode: Text.Fit
                text: "Вы победили!"
                anchors.fill: parent
                color: "green"
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
