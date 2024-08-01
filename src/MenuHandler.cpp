#include "MenuHandler.h"

namespace hangman {

//public
MenuHandler::MenuHandler(QSharedPointer<Translator> translator,
                         QSharedPointer<GameHandler> gameHandler,
                         QObject *parent)
    : QObject(parent)
    , translator_(translator)
    , game_(gameHandler)
    , mode_(None)
    , currentTopic_("")
{
    connect(translator_.data(), &Translator::languageChanged, this, &MenuHandler::getTopicList);
    connect(game_.data(), &GameHandler::sessionEnded, this, &MenuHandler::gameExited);
}

void MenuHandler::playFrequentWords()
{   
    //Remember gamemode
    mode_ = FrequentWords;
    //Play frequent words gamemode
    playRandomWordFromFile(QString(":/" + translator_->language() + "/frequent_words"));
}

void MenuHandler::playShuffledTopics()
{
    if (topicList_.empty())
        return;

    //Remember GameMode
    mode_ = ShuffleTopics;
    //Generate new random topic
    currentTopic_ = getRandomTopic();
    //Play with a word from new random topic
    playRandomWordFromFile(getTopicPathStr(currentTopic_));
}
void MenuHandler::playRandomTopic()
{
    if (topicList_.empty())
        return;

    //Generate new random topic
    currentTopic_ = getRandomTopic();
    //Play Chosen Topic
    playTopic(currentTopic_);
}
void MenuHandler::playTopic(const QString &topicFile)
{
    if (topicList_.empty())
        return;

    //Remember GameMode
    mode_ = ChosenTopic;
    //Write Chosen Topic
    currentTopic_ = topicFile;
    //Play Chosen Topic
    playRandomWordFromFile(getTopicPathStr(currentTopic_));
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

//public slots
void MenuHandler::getTopicList()
{
    //clear topicList
    topicList_.clear();
    emit clearTopics();

    //Form new topicList
    topicList_ = QDir(getTopicPathStr()).entryList();

    //Add topics to GUI
    for (auto i = topicList_.begin(); i != topicList_.end(); i++) {
        //Get File by FileName
        QFile topicFile = QFile(getTopicPathStr(*i));
        if (!topicFile.open(QIODevice::ReadOnly | QIODevice::Text))
            return;
        //Create QTextStream
        QTextStream stream(&topicFile);
        //Emit Signal for GUI
        emit addTopic(*i, stream.readLine());
    }
}

//private
QString MenuHandler::getTopicPathStr(const QString &fileName) const
{
    return QString(":/" + translator_->language() + "/topics/" + fileName);
}

void MenuHandler::playRandomWordFromFile(const QString &filePath) const
{
    //Get File
    QFile wordsFile(filePath);

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

QString MenuHandler::getRandomTopic() const
{
    quint8 randomFileNum = QRandomGenerator::global()->bounded(topicList_.count());
    for (auto i = topicList_.begin(); i != topicList_.end(); i++) {
        if ((i - topicList_.begin()) == randomFileNum) {
            return *i;
        }
    }

    return QString();
}

//private slots
void MenuHandler::gameExited()
{
    mode_ = None;
    currentTopic_ = QString();
    getTopicList();
}

} // namespace hangman
