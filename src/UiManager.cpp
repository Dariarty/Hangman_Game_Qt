#include "UiManager.h"

namespace hangman {

UiManager::UiManager(QObject *parent)
    : QObject(parent), view_(new QQuickView()) {
  qmlRegister();

  loadUi();
}

void UiManager::qmlRegister() {
  view_->engine()->rootContext()->setContextProperty("UiManager", this);
}

void UiManager::loadUi() {
  view_->setResizeMode(QQuickView::SizeRootObjectToView);

  view_->setMinimumWidth(kMinWidth);
  view_->setMinimumHeight(kMinHeight);

  view_->setSource(QUrl(kMainQmlName));
  view_->setTitle(kAppTitle);

  view_->setWindowState(Qt::WindowState::WindowMaximized);

  view_->showMaximized();
}

} // namespace hangman
