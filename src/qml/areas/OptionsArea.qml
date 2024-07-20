import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../components"

Rectangle {
    color: "transparent"

    Column{
        anchors.fill: parent
        spacing: 30 * ratio

        //Надпись выберите язык
        Rectangle{
            width: parent.width
            height: 80 * ratio
            color: "transparent"

            Text{
                fontSizeMode: Text.Fit
                text: "Выберите язык"
                anchors.fill: parent
                color: standartColor
                font.pointSize: 255
                horizontalAlignment: Qt.AlignHCenter
                font.family: standartFont
            }
        }

        //Кнопки языков
        MenuButton{
            text: "Русский"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 300 * ratio
            height: 100 * ratio
        }

        MenuButton{
            text: "English"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 300 * ratio
            height: 100 * ratio
        }
    }
}
