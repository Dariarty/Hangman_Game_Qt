#ifndef MENUHANDLER_H
#define MENUHANDLER_H

#include <QDebug>
#include <QDir>
#include <QFile>
#include <QObject>
#include <QRandomGenerator>
#include <QSharedPointer>
#include <QTextStream>

#include "GameHandler.h"
#include "Translator.h"

namespace hangman {

enum GameMode { None = 0, FrequentWords, ShuffleTopics, ChosenTopic };

class MenuHandler : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(MenuHandler)

public:
    MenuHandler(QSharedPointer<Translator> translator,
                QSharedPointer<GameHandler> gameHandler,
                QObject *parent = NULL);
    ~MenuHandler() = default;

    Q_INVOKABLE void playFrequentWords();
    Q_INVOKABLE void playShuffledTopics();
    Q_INVOKABLE void playRandomTopic();
    Q_INVOKABLE void playTopic(const QString &topicFile);

    Q_INVOKABLE void playAgain();

signals:
    void clearTopics();
    void addTopic(const QString &fileName, const QString &topicName);

public slots:
    void getTopicList();

private:
    QSharedPointer<Translator> translator_;
    QSharedPointer<GameHandler> game_;

    GameMode mode_; /// << current gamemode

    QList<QString> topicList_; /// << list with names of topic file names
    QString currentTopic_;     /// << current topic's file name

    //get topic file path string from file name
    QString getTopicPathStr(const QString &fileName = "") const;

    //init a game with a random word from target file path
    void playRandomWordFromFile(const QString &filePath) const;

    //generate a random topic from topicList_
    QString getRandomTopic() const;

private slots:
    //game ended
    void gameExited();
};

} // namespace hangman

#endif // MENUHANDLER_H
