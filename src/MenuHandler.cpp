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
    , mode_(GameMode::None)
    , currentTopic_("")
{
    connect(translator_.data(), &Translator::languageChanged, this, &MenuHandler::getTopicList);
}

void MenuHandler::playFrequentWords()
{
    //Frequent Words GameMode
    mode_ = GameMode::FrequentWords;

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

void MenuHandler::playShuffledTopics()
{
    qDebug() << "Shuffled topics";
}
void MenuHandler::playRandomTopic()
{
    qDebug() << "Random topic";
}
void MenuHandler::playTopic(const QString &topicName)
{
    qDebug() << "Topic:" << topicName;
}

void MenuHandler::playAgain()
{
    switch (mode_) {
    case FrequentWords:
        playFrequentWords();
        break;
    case ShuffleTopics:
        playShuffledTopics();
        break;
    case ChosenTopic:
        playTopic(currentTopic_);
        break;
    default:
        break;
    }
}

//private slots
void MenuHandler::getTopicList()
{
    qDebug() << "Get topic list called";

    emit clearTopics();

    emit addTopic("Test1");
    emit addTopic("Test2");
}

} // namespace hangman
