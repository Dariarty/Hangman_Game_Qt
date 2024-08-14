import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

MouseArea{
    id: rootButton

    property url source

    anchors{
        left: parent.left
        bottom: parent.bottom
        leftMargin: 30 * ratio
        bottomMargin: 30 * ratio
    }

    hoverEnabled: !UiManager.isAndroidDevice

    height: 100 * ratio
    width: 100 * ratio

    Image{
        source: rootButton.source
        anchors.fill: parent
        opacity: parent.containsPress ? 0.75 :
            parent.containsMouse ? 0.5 : 1
    }

    onReleased: Sound.playSound("click")
}
