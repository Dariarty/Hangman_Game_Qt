#ifndef MENUHANDLER_H
#define MENUHANDLER_H

#include <QObject>

#include "GameHandler.h"
#include "Translator.h"

namespace hangman {

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

    Q_INVOKABLE void playAgain();

private:
    QSharedPointer<Translator> translator_;
    QSharedPointer<GameHandler> game_;
};

} // namespace hangman

#endif // MENUHANDLER_H
