import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

Rectangle{
    id: letterRect

    property string text
    color: "transparent"

    width: height * rootWordArea.widthToHeightMultiplier

    Label{
        text: parent.text
        fontSizeMode: Text.Fit
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
        font.pointSize: 255
        font.family: "Comic Sans MS"
    }

    Rectangle{
        height: parent.height * 0.07
        anchors.bottom: parent.bottom
        width: parent.width
        color: "#5C4033"
    }
}
