import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../components"

Rectangle {
    color: "transparent"

    Column{
        anchors.fill: parent
        spacing: 30 * ratio

        //Play label
        Rectangle{
            width: parent.width
            height: 80 * ratio
            color: "transparent"

            Text{
                fontSizeMode: Text.Fit
                text: qsTr("Play")
                anchors.fill: parent
                color: standartColor
                font.pointSize: 255
                horizontalAlignment: Qt.AlignHCenter
                font.family: standartFont
            }
        }

        //Gamemodes buttons
        MenuButton{
            text: qsTr("1500 frequent words")

            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 200 * ratio
            height: 100 * ratio

            onClicked: {
                layout.currentIndex = 1
            }
        }

    }
}
