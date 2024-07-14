import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

Rectangle {
    id: menuRoot
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
            text: "Виселица"
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
                rightMargin: 350 * ratio
                leftMargin: 350 * ratio
            }
        }
    }

    //Left Area
    Rectangle{
        id: optionsRect
        color: "transparent"

        anchors{
            top: titleRect.bottom
            left: menuRoot.left
            bottom: menuRoot.bottom
            margins: 50 * ratio
        }

        width: menuRoot.width / 2 -  ( anchors.margins * 2 )

        OptionsArea{
            id: options
            anchors.fill: parent
        }
    }

    //RightArea
    Rectangle{
        id: gameRect
        color: "transparent"

        anchors{
            top: titleRect.bottom
            right: menuRoot.right
            bottom: menuRoot.bottom
            margins: 50 * ratio
        }

        width: menuRoot.width / 2 -  ( anchors.margins * 2 )

        GameModeArea{
            id: gameMode
            anchors.fill: parent
        }
    }

    //Dividing Line
    Rectangle{
        width: 5 * ratio
        anchors{
            top: optionsRect.top
            bottom: optionsRect.bottom
            horizontalCenter: menuRoot.horizontalCenter
        }

        color: "#5C4033"
    }

}
