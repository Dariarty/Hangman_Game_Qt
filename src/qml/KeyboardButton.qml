import QtQuick 2.15

Rectangle{
    id: letterRect

    color: "transparent"

    width: (parent.width - ((parent.columns - 1) * parent.columnSpacing ))
           / parent.columns
    height: (parent.height - ((parent.rows - 1) * parent.rowSpacing ))
           / parent.rows

    property string text

    MouseArea {
        id: keyboardButton

        hoverEnabled: true
        anchors.fill: parent

        Text{
            fontSizeMode: Text.Fit
            text: letterRect.text
            anchors.fill: parent
            font.pointSize: 255
            horizontalAlignment: Qt.AlignHCenter
            font.family: "Comic Sans MS"
            color: parent.containsPress ? "#5C4033" :
                parent.containsMouse ? "sienna" : "#5C4033"
        }

    }
}
