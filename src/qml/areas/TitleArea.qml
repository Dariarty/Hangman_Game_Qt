import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

Rectangle{
    id: titleArea

    property string text

    width: parent.width
    height: 100 * ratio
    color: "transparent"

    anchors.top: parent.top
    anchors.topMargin: 20 * ratio

    Text{
        fontSizeMode: Text.Fit
        text: titleArea.text
        anchors.fill: parent
        color: standartColor
        font.pointSize: 255
        horizontalAlignment: Qt.AlignHCenter
        font.family: standartFont
        anchors.bottomMargin: 5
    }

    Rectangle{
        color: standartColor
        height: 5 * ratio
        anchors{
            left: parent.left
            bottom: parent.bottom
            right: parent.right
            rightMargin: 350 * ratio
            leftMargin: 350 * ratio
        }
    }
}
