import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

Button{
    id: button

    width: parent.width - 300 * ratio
    height: 100 * ratio

    anchors.horizontalCenter: parent.horizontalCenter

    font.family: "Comic Sans MS"
    font.pointSize: 255

    hoverEnabled: true

    property string color: "sienna"
    property string downColor: "#5C4033"
    property string hoverColor: "peru"

    background: Rectangle {
        color: button.down ? button.downColor :
               button.hovered ? button.hoverColor : button.color
        radius: 80
    }

    contentItem: Text{
        id: contentText
        font: button.font
        text: button.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit
        color: "white"
    }
}
