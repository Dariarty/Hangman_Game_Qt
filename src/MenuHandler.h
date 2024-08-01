#ifndef MENUHANDLER_H
#define MENUHANDLER_H

#include <QObject>
#include <QSharedPointer>

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
    Q_INVOKABLE void playTopic(const QString &topicName);

    Q_INVOKABLE void playAgain();

signals:
    void clearTopics();
    void addTopic(const QString &topicName);

public slots:
    void getTopicList();

private:
    QSharedPointer<Translator> translator_;
    QSharedPointer<GameHandler> game_;

    GameMode mode_;

    QMap<QString, QUrl> topicList_;
    QString currentTopic_;
};

} // namespace hangman

#endif // MENUHANDLER_H
