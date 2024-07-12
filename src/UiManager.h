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

const int kMinWidth = 800;
const int kMinHeight = 600;

} // namespace

namespace hangman {

class UiManager : public QObject {
  Q_OBJECT
  Q_DISABLE_COPY(UiManager)

public:
  UiManager(QObject *parent = NULL);
  ~UiManager() = default;

private:
  void qmlRegister();
  void loadUi();

  QQuickView *view_;
};

} // namespace hangman

#endif // UIMANAGER_H
