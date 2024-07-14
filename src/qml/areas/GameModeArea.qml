import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../components"

Rectangle {
    color: "transparent"

    Column{
        anchors.fill: parent
        spacing: 30 * ratio

        //Надпись Играть
        Rectangle{
            width: parent.width
            height: 80 * ratio
            color: "transparent"

            Text{
                fontSizeMode: Text.Fit
                text: "Играть"
                anchors.fill: parent
                color: "#5C4033"
                font.pointSize: 255
                horizontalAlignment: Qt.AlignHCenter
                font.family: "Comic Sans MS"
            }
        }

        //Кнопки режимов игры
        MenuButton{
            text: "1000 частых слов"

            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 200 * ratio

            onClicked: {
                //PLACEHOLDER
                layout.currentIndex = 1
            }
        }

    }
}
