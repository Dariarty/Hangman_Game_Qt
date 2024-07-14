import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

Row{
    id: windowButtonsRow

    spacing: 30 * ratio

    MouseArea{
        id: minimizeButtonArea

        visible: UiManager.isFullScreen

        hoverEnabled: true

        height: 60 * ratio
        width: 60 * ratio

        Image{
            source: "qrc:/resources/icons/minimize.png"
            anchors.fill: parent
            opacity: parent.containsPress ? 0.75 :
                parent.containsMouse ? 0.5 : 1
        }

        onClicked: {
            UiManager.minimizeButtonPressed()
        }
    }

    MouseArea{
        id: fullScreenButtonArea

        hoverEnabled: true

        height: 60 * ratio
        width: 60 * ratio

        Image{
            source: UiManager.isFullScreen ?
                        "qrc:/resources/icons/exit_fullscreen.png" :
                        "qrc:/resources/icons/enter_fullscreen.png"
            anchors.fill: parent
            opacity: parent.containsPress ? 0.75 :
                parent.containsMouse ? 0.5 : 1
        }

        onClicked: {
            UiManager.fullScreenButtonPressed()
        }
    }

    MouseArea{
        id: exitButtonArea

        visible: UiManager.isFullScreen

        hoverEnabled: true

        height: 60 * ratio
        width: 60 * ratio

        Image{
            source: "qrc:/resources/icons/exit.png"
            anchors.fill: parent
            opacity: parent.containsPress ? 0.75 :
                parent.containsMouse ? 0.5 : 1
        }

        onClicked: {
            Qt.quit()
        }
    }

}
