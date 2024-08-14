import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

MouseArea {
    id: rootArea

    property string source

    hoverEnabled: visible && !UiManager.isAndroidDevice

    height: 60 * ratio
    width: 60 * ratio

    Image{
        source: rootArea.source
        anchors.fill: parent
        opacity: parent.containsPress ? 0.75 :
            parent.containsMouse ? 0.5 : 1
    }

}
