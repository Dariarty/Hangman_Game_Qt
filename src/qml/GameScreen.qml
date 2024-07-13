import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

Rectangle {
    id: gameRoot
    color: "transparent"

    //Title Area
    Rectangle{
        id: titleRect
        width: parent.width
        height: 100 * ratio
        color: "transparent"

        anchors.top: parent.top
        anchors.topMargin: 20 * ratio

        Text{
            fontSizeMode: Text.Fit
            text: "Угадай слово"
            anchors.fill: parent
            color: "#5C4033"
            font.pointSize: 255
            horizontalAlignment: Qt.AlignHCenter
            font.family: "Comic Sans MS"
        }

        Rectangle{
            color: "#5C4033"
            height: 5 * ratio
            anchors{
                left: parent.left
                bottom: parent.bottom
                right: parent.right
                rightMargin: 400 * ratio
                leftMargin: 400 * ratio
            }
        }
    }


}
