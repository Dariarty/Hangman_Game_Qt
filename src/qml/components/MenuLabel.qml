import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

Rectangle{
    id: rootRect
    width: parent.width
    height: 80 * ratio
    color: "transparent"

    property color labelColor: standartColor

    property string text

    Text{
        fontSizeMode: Text.Fit
        text: rootRect.text
        anchors.fill: parent
        color: labelColor
        font.pointSize: 200
        horizontalAlignment: Qt.AlignHCenter
        font.family: standartFont
    }
}
