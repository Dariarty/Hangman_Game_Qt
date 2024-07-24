#ifndef UIMANAGER_H
#define UIMANAGER_H

#include <QObject>
#include <QQmlContext>
#include <QQmlEngine>
#include <QQuickView>
#include <QtQml>
#include <QScreen>

#include "GameHandler.h"
#include "MenuHandler.h"
#include "SoundManager.h"
#include "Translator.h"

namespace {
const QString kMainQmlName = "qrc:/qml/main/Hangman.qml";
const QString kAppTitle = "Hangman";
} // namespace

namespace hangman {

class UiManager : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(UiManager)

    Q_PROPERTY(bool isFullScreen READ isFullScreen NOTIFY isFullScreenChanged)

public:
    UiManager(QObject *parent = NULL);
    ~UiManager() = default;

    bool isFullScreen() const;

    Q_INVOKABLE void fullScreenButtonPressed();
    Q_INVOKABLE void minimizeButtonPressed();

signals:
    void isFullScreenChanged(bool fullScreenState);

private:
    void qmlRegister();
    void loadUi();

    QSharedPointer<SoundManager> soundManager_;
    QSharedPointer<Translator> translator_;
    QSharedPointer<GameHandler> game_;
    QSharedPointer<MenuHandler> menu_;

    QScopedPointer<QQuickView> view_;

    bool window_was_maximized_;
    void toggleFullScreen();
};

} // namespace hangman

#endif // UIMANAGER_H
