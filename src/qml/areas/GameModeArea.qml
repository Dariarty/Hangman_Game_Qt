import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../components"

Rectangle {
    color: "transparent"

    Column{
        anchors.fill: parent
        spacing: 30 * ratio

        MenuLabel{
            text: qsTr("Play")
        }

        MenuButton{
            text: qsTr("1500 frequent words")

            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 200 * ratio
            height: 100 * ratio

            onClicked: GameMenu.playFrequentWords()
        }

        Rectangle{
            height: 5 * ratio
            width: parent.width
            color: standartColor
        }

        MenuLabel{
            text: qsTr("Words by topic")
        }

        MenuLabel{
            text: qsTr("Coming soon!")
        }

    }
}
