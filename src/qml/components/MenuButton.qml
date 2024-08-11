import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

Button{
    id: button

    font.family: standartFont
    font.pointSize: 80

    hoverEnabled: true

    background: Rectangle {
        color: button.down ? downColor :
               button.hovered ? hoverColor : standartColor
        radius: 80
    }

    contentItem: Text{

        id: contentText

        anchors.fill: parent
        anchors.margins: 10 * ratio
        font: button.font
        text: button.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit
        color: "white"
    }

    onReleased: Sound.playSound("click")

}
