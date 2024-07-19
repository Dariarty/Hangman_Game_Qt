import QtQuick 2.15

import "../components"

Grid {
    id: keyboardGrid

    anchors.fill: parent

    columns: 11
    rows: 3

    columnSpacing: 5
    rowSpacing: 5

    KeyboardButton{
        text: "А"

    }

    KeyboardButton{
        text: "Б"
    }

    KeyboardButton{
        text: "В"
    }

    KeyboardButton{
        text: "Г"
        used: true
        guessed: false
    }

    KeyboardButton{
        text: "Д"
        used: true
        guessed: true
    }

    KeyboardButton{
        text: "Е"
    }

    KeyboardButton{
        text: "Ж"
    }

    KeyboardButton{
        text: "З"
    }

    KeyboardButton{
        text: "И"
    }

    KeyboardButton{
        text: "Й"
    }

    KeyboardButton{
        text: "К"
    }

    KeyboardButton{
        text: "Л"
    }

    KeyboardButton{
        text: "М"
    }

    KeyboardButton{
        text: "Н"
    }

    KeyboardButton{
        text: "О"
    }

    KeyboardButton{
        text: "П"
    }

    KeyboardButton{
        text: "Р"
    }

    KeyboardButton{
        text: "С"
    }

    KeyboardButton{
        text: "Т"
    }

    KeyboardButton{
        text: "У"
    }

    KeyboardButton{
        text: "Ф"
    }

    KeyboardButton{
        text: "Х"
    }

    KeyboardButton{
        text: "Ц"
    }

    KeyboardButton{
        text: "Ч"
    }

    KeyboardButton{
        text: "Ш"
    }

    KeyboardButton{
        text: "Щ"
    }

    KeyboardButton{
        text: "Ъ"
    }

    KeyboardButton{
        text: "Ы"
    }

    KeyboardButton{
        text: "Ь"
    }

    KeyboardButton{
        text: "Э"
    }

    KeyboardButton{
        text: "Ю"
    }

    KeyboardButton{
        text: "Я"
    }

}
