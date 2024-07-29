import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12

import "../components"


Grid{
    id: topicsRect
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    width: parent.width
    height: parent.height - contentColumn.implicitHeight - 20 * ratio

    columns: 3

    columnSpacing: 20 * ratio
    rowSpacing: 20 * ratio

    MenuButton{
        text: "Животные"

        width: (parent.width - parent.columnSpacing * 2) / 3
        height: 80 * ratio

    }

    MenuButton{
        text: "Еда"

        width: (parent.width - parent.columnSpacing * 2) / 3
        height: 80 * ratio

    }

    MenuButton{
        text: "Спорт"

        width: (parent.width - parent.columnSpacing * 2) / 3
        height: 80 * ratio

    }

    MenuButton{
        text: "Города"

        width: (parent.width - parent.columnSpacing * 2) / 3
        height: 80 * ratio

    }

    MenuButton{
        text: "Страны"

        width: (parent.width - parent.columnSpacing * 2) / 3
        height: 80 * ratio

    }

    MenuButton{
        text: "Хобби"

        width: (parent.width - parent.columnSpacing * 2) / 3
        height: 80 * ratio

    }

    MenuButton{
        text: "Техника"

        width: (parent.width - parent.columnSpacing * 2) / 3
        height: 80 * ratio

    }

    MenuButton{
        text: "Тема 1"

        width: (parent.width - parent.columnSpacing * 2) / 3
        height: 80 * ratio

    }

    MenuButton{
        text: "Тема 2"

        width: (parent.width - parent.columnSpacing * 2) / 3
        height: 80 * ratio

    }

    MenuButton{
        text: "Тема 3 - длинная"

        width: (parent.width - parent.columnSpacing * 2) / 3
        height: 80 * ratio

    }

    MenuButton{
        text: "Тема 4 - длинная надпись"

        width: (parent.width - parent.columnSpacing * 2) / 3
        height: 80 * ratio

    }

    MenuButton{
        text: "Тема 5"

        width: (parent.width - parent.columnSpacing * 2) / 3
        height: 80 * ratio

    }

}
