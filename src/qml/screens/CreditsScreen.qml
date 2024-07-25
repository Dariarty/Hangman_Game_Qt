import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../components"

Rectangle {
    id: creditsRoot
    color: "transparent"

    Column{
        id: creditsColumn
        anchors.fill: parent
        anchors.margins: 150 * ratio
        spacing: 20 * ratio

        MenuLabel{
            text: qsTr("Developer")
            height: creditsRoot.height / 8
            labelColor: wordColor
        }

        MenuLabel{
            text: qsTr("Artem Darmogray")
            height: creditsRoot.height / 8
        }
    }

    Column{

        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 150 * ratio
        }

        MenuLabel{
            text: qsTr("App Font: Itim Regular")
            height: creditsRoot.height / 16
        }

        MenuLabel{
            text: qsTr("App Icon Designed by Freepik")
            height: creditsRoot.height / 16
        }

    }

    //Exit to menu Button
    SwitchScreenButton{
        id: exitToMenuButton
        source: "qrc:/resources/icons/quit_to_menu.png"
        onClicked: layout.currentIndex = 0
    }

}
