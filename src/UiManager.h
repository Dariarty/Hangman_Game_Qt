#ifndef UIMANAGER_H
#define UIMANAGER_H

#include <QObject>
#include <QQmlContext>
#include <QQmlEngine>
#include <QQuickView>
#include <QtQml>

namespace {
const QString kMainQmlName = "qrc:/qml/Hangman.qml";
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

    QQuickView *view_;

    bool window_was_maximized_;
    void toggleFullScreen();
};

} // namespace hangman

#endif // UIMANAGER_H
