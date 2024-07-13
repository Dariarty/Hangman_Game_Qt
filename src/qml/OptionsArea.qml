import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

Rectangle {
    color: "transparent"

    Column{
        anchors.fill: parent
        spacing: 30 * ratio

        //Надпись выберите язык
        Rectangle{
            width: parent.width
            height: 80 * ratio
            color: "transparent"

            Text{
                fontSizeMode: Text.Fit
                text: "Выберите язык"
                anchors.fill: parent
                color: "#5C4033"
                font.pointSize: 255
                horizontalAlignment: Qt.AlignHCenter
                font.family: "Comic Sans MS"
            }
        }

        //Кнопки языков
        MenuButton{
            text: "Русский"
        }

        MenuButton{
            text: "English"
        }
    }
}
