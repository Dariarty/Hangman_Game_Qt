import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

Rectangle{
    id: letterRect

    property string text

    property bool failedGuess

    color: "transparent"

    width: height / rootWordArea.letterAspectRatio

    Label{
        id: letter
        text: parent.text
        fontSizeMode: Text.Fit
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
        font.pointSize: 160
        font.family: standartFont
        color: failedGuess ? "red" : wordColor
        font.capitalization: Font.AllUppercase
    }

    Rectangle{
        height: parent.height * 0.07
        anchors.bottom: parent.bottom
        width: parent.width
        visible: letter.text !== " "
        color: standartColor
    }
}
