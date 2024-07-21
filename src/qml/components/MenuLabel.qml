import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

Rectangle{
    id: rootRect
    width: parent.width
    height: 80 * ratio
    color: "transparent"

    property string text

    Text{
        fontSizeMode: Text.Fit
        text: rootRect.text
        anchors.fill: parent
        color: standartColor
        font.pointSize: 255
        horizontalAlignment: Qt.AlignHCenter
        font.family: standartFont
    }
}
