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
                rightMargin: 350 * ratio
                leftMargin: 350 * ratio
            }
        }
    }

    //GameArea
    Rectangle{
        id: gameAreaRect

        anchors{
            top: titleRect.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        color: "transparent"

        //Screen Keyboard Area
        Rectangle{
            id: keyboardRect

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

            Keyboard_ru{
                id: keyboard
            }

            Rectangle{
                color: "#5C4033"
                height: 5 * ratio
                anchors{
                    left: parent.left
                    top: parent.top
                    right: parent.right
                }
            }
        }

        //Drawing Area
        Rectangle{
            id: drawingRect

            width: parent.width * 0.4 - anchors.leftMargin

            anchors{
                left: parent.left
                top: parent.top
                bottom: keyboardRect.top
                topMargin: 50 * ratio
                margins: 50 * ratio
            }

            color: "transparent"

            Image{
                anchors.fill: parent
                source: "qrc:/resources/images/stages/stage9.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        //Word Area
        WordArea{

        }

    }

    //Кнопка выхода в главное меню
    MouseArea{
        id: fullScreenButtonArea

        anchors{
            left: parent.left
            bottom: parent.bottom
            leftMargin: 30 * ratio
            bottomMargin: 30 * ratio
        }

        hoverEnabled: true

        height: 100 * ratio
        width: 100 * ratio

        Image{
            source: "qrc:/resources/icons/quit_to_menu.png"
            anchors.fill: parent
            opacity: parent.containsPress ? 0.75 :
                parent.containsMouse ? 0.5 : 1
        }

        onClicked: {
            layout.currentIndex = 0
        }
    }


}
