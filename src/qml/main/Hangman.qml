import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12
import QtQuick.Layouts 1.15

import "../screens"
import "../areas"
import "../components"

Rectangle{
    id: root
    color: "transparent"

    readonly property double refWidth:
        1920.0

    readonly property double refHeight:
        1080.0

    readonly property double ratio:
        Math.min(root.height / refHeight, root.width / refWidth)

    readonly property string standartFont:
        itim.name

    readonly property color standartColor:
        "#5C4033"

    readonly property color hoverColor:
        "sienna"

    readonly property color downColor:
        "peru"

    readonly property color wordColor:
        "#434a54"

    FontLoader{
        id: itim
        source: "qrc:/resources/fonts/Itim.ttf"
    }

    Image{
        anchors.fill: root
        source: "qrc:/resources/images/paper_background.jpg"
        fillMode: Image.PreserveAspectCrop
    }

    StackLayout{
        id: layout
        visible: !warningScreen.visible
        anchors.fill: parent
        currentIndex: 0

        MenuScreen{
            id: menu
        }

        GameScreen{
            id: game
        }

        CreditsScreen{
            id: credits
        }
    }

    WindowButton{
        id: soundMuteButton

        visible: !warningScreen.visible
        source: Sound.muted ? "qrc:/resources/icons/sound_disabled.png" :
                              "qrc:/resources/icons/sound_enabled.png"

        height: 90 * ratio
        width: 90 * ratio

        onClicked: {
            Sound.switchMute()
            Sound.playSound("click")
        }

        anchors{
            left: root.left
            top: root.top
            leftMargin: 30 * ratio
            topMargin: 30 * ratio
        }

    }

    WindowButtonsArea{
        id: windowButtonsArea

        anchors{
            right: root.right
            top: root.top
            rightMargin: 30 * ratio
            topMargin: 30 * ratio
        }

    }

    PortraitWarningScreen{
        id: warningScreen
        visible: root.height > root.width
    }
}
