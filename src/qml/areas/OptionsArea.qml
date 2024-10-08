import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../components"

Rectangle {
    color: "transparent"

    Column{
        anchors.fill: parent
        spacing: 20 * ratio

        MenuLabel{
            text: qsTr("Choose language")
        }

        MenuButton{
            text: "English"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 40 * ratio
            height: 100 * ratio
            onClicked: Translator.setLanguage("en_US")
        }

        MenuButton{
            text: "Русский"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 40 * ratio
            height: 100 * ratio
            onClicked: Translator.setLanguage("ru_RU")
        }

    }
}
