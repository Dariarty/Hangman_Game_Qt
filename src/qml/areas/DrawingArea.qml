import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

Image{
    id: drawing

    width: parent.width * 0.4 - anchors.leftMargin

    anchors{
        left: parent.left
        top: title.bottom
        bottom: keyboardRect.top
        topMargin: 50 * ratio
        margins: 50 * ratio
    }

    source: "qrc:/resources/images/stages/stage10.png"

    fillMode: Image.PreserveAspectFit
}
