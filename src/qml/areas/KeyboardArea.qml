import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../keyboards"

Rectangle{
    id: keyboardRoot

    property url source

    height: parent.height * 0.3
    color: "transparent"

    anchors{
        left: parent.left
        right: parent.right
        bottom: parent.bottom
        bottomMargin: 20 * ratio
        rightMargin: 200 * ratio
        leftMargin: 200 * ratio
    }

    Loader{
        id: keyboardLoader
        source: keyboardRoot.source
        anchors.fill: parent
    }

    Rectangle{
        color: standartColor
        height: 5 * ratio
        anchors{
            left: parent.left
            top: parent.top
            right: parent.right
        }
    }
}
