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
    QString fileStr = ":/" + translator_->language() + "/frequent_words";
    QFile wordsFile(fileStr);

    //Read Random Line in File
    if (wordsFile.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream stream(&wordsFile);

        //Get random line number
        quint32 randomLineNumber = QRandomGenerator::global()->bounded(stream.readLine().toInt());

        QString word;

        //Get Line in file by number
        for (quint32 i = 0; i <= randomLineNumber; i++) {
            word = stream.readLine();
        }

        //Init Game Round
        game_->initGameRound(word);
    }
}

void MenuHandler::playAgain()
{
    playFrequentWords();
}

} // namespace hangman
