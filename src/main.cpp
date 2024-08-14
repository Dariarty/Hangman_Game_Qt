#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QSharedPointer>

#include "UiManager.h"

int main(int argc, char *argv[])
{
    int exitCode = -111;

    QCoreApplication::setApplicationName("Hangman");

    QGuiApplication app(argc, argv);

    hangman::UiManager uiManager;

    exitCode = app.exec();

    return exitCode;
}
