import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

Rectangle{
    id: root
    color: "transparent"

    Image{
        anchors.fill: root
        source: "qrc:/resources/images/paper_background.jpg"
        fillMode: Image.PreserveAspectCrop
    }

    MouseArea{
        id: fullScreenButtonArea
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: root.height * 0.03
        anchors.topMargin: root.height * 0.03

        hoverEnabled: true

        height: root.height * 0.05
        width: root.height * 0.05

        Image{
            source: UiManager.isFullScreen ?
                        "qrc:/resources/icons/exit_fullscreen.png" :
                        "qrc:/resources/icons/enter_fullscreen.png"
            anchors.fill: parent
            opacity: fullScreenButtonArea.containsPress ? 0.75 :
                fullScreenButtonArea.containsMouse ? 0.5 : 1
        }

        onClicked: {
            UiManager.fullScreenButtonPressed()
        }
    }

}
