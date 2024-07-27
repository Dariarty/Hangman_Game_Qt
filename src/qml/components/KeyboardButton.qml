import QtQuick 2.15
import QtQuick.Layouts 1.0

MouseArea{
    id: rootArea

    property string text

    state: "active"

    states: [
        State{
            name: "active"
            PropertyChanges { target: usedLetterImage; visible: false }
            PropertyChanges { target: rootArea; hoverEnabled: true }
            PropertyChanges { target: rootArea; enabled: true }
        },
        State{
            name: "rightGuess"
            PropertyChanges { target: usedLetterImage; visible: true }
            PropertyChanges { target: usedLetterImage; source: "qrc:/resources/icons/rightLetter.png" }
            PropertyChanges { target: rootArea; hoverEnabled: false }
            PropertyChanges { target: rootArea; enabled: false }
        },
        State{
            name: "wrongGuess"
            PropertyChanges { target: usedLetterImage; visible: true }
            PropertyChanges { target: usedLetterImage; source: "qrc:/resources/icons/wrongLetter.png" }
            PropertyChanges { target: rootArea; hoverEnabled: false }
            PropertyChanges { target: rootArea; enabled: false }
        }
    ]

    Text{
        id: keyboardButtonText
        anchors.fill: parent

        text: rootArea.text
        color: parent.containsPress ? downColor :
            parent.containsMouse ? hoverColor : standartColor
        font.family: standartFont
        fontSizeMode: Text.Fit
        font.pointSize: 80
        horizontalAlignment: Qt.AlignHCenter
    }

    Image{
        id: usedLetterImage
        anchors.fill: parent

        fillMode: Image.Stretch
        visible: false
        opacity: 0.8
    }

    onClicked: {
        Game.makeGuess(rootArea.text)
    }

    Connections{
        target: Game
        function onGuessMade(letter, success){
            if(letter===rootArea.text){
                state = success ? "rightGuess" : "wrongGuess"
            }
        }

        function onRoundStarted(wordLength){
            state = "active"
        }
    }

}
