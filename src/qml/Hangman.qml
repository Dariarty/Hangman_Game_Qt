import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12
import QtQuick.Layouts 2.12

Rectangle{
    id: root
    color: "transparent"

    readonly property double refHeight: 1080.0
    readonly property double refWidth: 1920.0

    property double ratio: Math.min(root.height / refHeight, root.width / refWidth)

    Image{
        anchors.fill: root
        source: "qrc:/resources/images/paper_background.jpg"
        fillMode: Image.PreserveAspectCrop
    }

    StackLayout{
        id: layout
        anchors.fill: parent
        currentIndex: 0

        MenuScreen{

        }

        GameScreen{

        }
    }

    WindowButtons{
        id: windowButtonsArea

        anchors{
            right: root.right
            top: root.top
            rightMargin: 30 * ratio
            topMargin: 30 * ratio
        }

    }
}
