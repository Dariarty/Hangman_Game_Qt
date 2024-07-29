import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../components"

Rectangle {
    color: "transparent"

    Column{
        id: contentColumn
        anchors.fill: parent
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

                onClicked: {
                    GameMenu.playFrequentWords()
                }
            }

            MenuButton{
                text: qsTr("All topics")

                width: (parent.width - parent.spacing) / 2
                height: 100 * ratio
            }

        }

        MenuButton{
            text: qsTr("Random topic")

            anchors.horizontalCenter: parent.horizontalCenter

            width: (parent.width - parent.spacing) / 2
            height: 100 * ratio
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

    PlaceholderTopics{
        id: placeholderTopics
    }
}
