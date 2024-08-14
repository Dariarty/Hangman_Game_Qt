import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../components"

Rectangle {
    id: gamemodeRect
    color: "transparent"

    Column{
        id: contentColumn
        anchors.top: parent.top
        width: parent.width
        spacing: 20 * ratio

        MenuLabel{
            text: qsTr("Play")
        }

        Row{

            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 100 * ratio

            spacing: 20 * ratio

            MenuButton{
                text: qsTr("Frequent words")

                width: (parent.width - parent.spacing) / 2
                height: 100 * ratio

                onClicked: GameMenu.playFrequentWords()
            }

            MenuButton{
                text: qsTr("All topics")

                width: (parent.width - parent.spacing) / 2
                height: 100 * ratio

                onClicked: GameMenu.playShuffledTopics()
            }

        }

        MenuButton{
            text: qsTr("Random topic")

            anchors.horizontalCenter: parent.horizontalCenter

            width: (parent.width - parent.spacing) / 2
            height: 100 * ratio

            onClicked: GameMenu.playRandomTopic()
        }

        Rectangle{
            height: 5 * ratio
            width: parent.width
            color: standartColor
        }

        MenuLabel{
            id: wordsByTopicLabel
            text: qsTr("Words by topic")
        }
    }

    Connections{
        target: GameMenu

        function onClearTopics(){
            topicsModel.clear()
        }

        function onAddTopic(fileName, topicName){
            topicsModel.append({ file: fileName, topic: topicName})
        }
    }

    ListModel{
        id: topicsModel
        Component.onCompleted: GameMenu.getTopicList()
    }

    GridView{
        id: topicsGridView

        model: topicsModel

        anchors {
            left: parent.left
            right: parent.right
            top: contentColumn.bottom
            topMargin: 20
        }

        width: parent.width
        height: gamemodeRect.height - contentColumn.height - 20

        contentHeight: implicitHeight
        contentWidth: implicitWidth

        cellWidth: (width - 20 * ratio ) / 3
        cellHeight: 90 * ratio

        clip: true
        interactive: topicScrollBar.visible
        boundsMovement: Flickable.StopAtBounds

        delegate: MenuButton{
            width: topicsGridView.cellWidth - 10 * ratio
            height: 80 * ratio
            text: topic
            onClicked: GameMenu.playTopic(file)
        }

        ScrollBar.vertical: ScrollBar{
            id: topicScrollBar

            policy: topicsGridView.contentHeight > topicsGridView.height ?
                        ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
            hoverEnabled: visible && !UiManager.isAndroidDevice

            contentItem: Rectangle{
                id: scrollBarContentRect
                parent: topicScrollBar

                color: parent.hovered || parent.pressed ? hoverColor : standartColor
                implicitWidth: 15 * ratio
                radius: 200
            }

        }

    }

}
