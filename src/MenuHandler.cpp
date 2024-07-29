#include <QFile>
#include <QRandomGenerator>
#include <QTextStream>

#include "MenuHandler.h"

namespace hangman {

//public
MenuHandler::MenuHandler(QSharedPointer<Translator> translator,
                         QSharedPointer<GameHandler> gameHandler,
                         QObject *parent)
    : QObject(parent)
    , translator_(translator)
    , game_(gameHandler)
{}

void MenuHandler::playFrequentWords()
{
    //Frequent Words GameMode

    //Get File
    QFile wordsFile(QString(":/" + translator_->language() + "/frequent_words"));

    //Open file
    if (!wordsFile.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    //Create stream
    QTextStream stream(&wordsFile);

    //Get random word frome a file and hint
    QString word, hint = stream.readLine();

    //Get random line number
    quint32 randomLineNumber = QRandomGenerator::global()->bounded(stream.readLine().toInt());

    //Get Line in file by number
    for (quint32 i = 0; i <= randomLineNumber; i++) {
        word = stream.readLine();
    }

    //Init Game Round
    game_->initGameRound(word, hint);
}

void MenuHandler::playAgain()
{
    playFrequentWords();
}

} // namespace hangman
