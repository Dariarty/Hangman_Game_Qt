import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../areas"

Rectangle {
    id: menuRoot
    color: "transparent"

    //Title Area
    TitleArea{
        id: titleRect
        text: "Виселица"
    }

    //Left Area
    OptionsArea{
        id: optionsRect

        anchors{
            top: titleRect.bottom
            left: menuRoot.left
            bottom: menuRoot.bottom
            margins: 50 * ratio
        }

        width: menuRoot.width / 2 -  ( anchors.margins * 2 )
    }

    //RightArea
    GameModeArea{
        id: gameRect

        anchors{
            top: titleRect.bottom
            right: menuRoot.right
            bottom: menuRoot.bottom
            margins: 50 * ratio
        }

        width: menuRoot.width / 2 -  ( anchors.margins * 2 )
    }

    //Dividing Line
    Rectangle{
        width: 5 * ratio
        anchors{
            top: optionsRect.top
            bottom: optionsRect.bottom
            horizontalCenter: menuRoot.horizontalCenter
        }

        color: standartColor
    }

}
