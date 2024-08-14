import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../components"

Row{
    id: windowButtonsRow

    spacing: 30 * ratio

    WindowButton{
        id: minimizeButton

        visible: UiManager.isFullScreen && !UiManager.isAndroidDevice
        source: "qrc:/resources/icons/minimize.png"
        onClicked: UiManager.minimizeButtonPressed()
        onReleased: Sound.playSound("click")
    }

    WindowButton{
        id: fullScreenButtonArea

        visible: !UiManager.isAndroidDevice
        source: UiManager.isFullScreen ?
                    "qrc:/resources/icons/exit_fullscreen.png" :
                    "qrc:/resources/icons/enter_fullscreen.png"
        onClicked: UiManager.fullScreenButtonPressed()
        onReleased: Sound.playSound("click")
    }

    WindowButton{
        id: exitButtonArea

        visible: UiManager.isFullScreen || UiManager.isAndroidDevice
        source: "qrc:/resources/icons/exit.png"
        onClicked: Qt.quit()
    }

}
