import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

Rectangle {
    id: portraitWarningRoot
    color: "transparent"

    anchors.fill: parent

    Rectangle{
        anchors.centerIn: parent
        height: parent.height
        width: parent.width * 0.9
        color: "transparent"

        Text{
            anchors.fill: parent
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            text: qsTr("Game is available in landscape mode") + "\n\n" +
                  qsTr("Please rotate your device")
            fontSizeMode: Text.Fit
            font.pointSize: 200
            font.family: standartFont
            color: standartColor
        }
    }

}
