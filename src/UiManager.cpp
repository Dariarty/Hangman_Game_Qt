#include "UiManager.h"

namespace hangman {

//public
UiManager::UiManager(QObject *parent)
    : QObject(parent)
    , view_(new QQuickView())
    , window_was_maximized_(false)
{
    qmlRegister();

    loadUi();
}

void UiManager::qmlRegister()
{
    view_->engine()->rootContext()->setContextProperty("UiManager", this);
}

void UiManager::loadUi()
{
    view_->setResizeMode(QQuickView::SizeRootObjectToView);

    view_->setMinimumWidth(kMinWidth);
    view_->setMinimumHeight(kMinHeight);

    view_->setSource(QUrl(kMainQmlName));
    view_->setTitle(kAppTitle);

    //Show App in FullScreen
    toggleFullScreen();
}

bool UiManager::isFullScreen() const
{
    return (view_->windowState() == Qt::WindowState::WindowFullScreen);
}

void UiManager::fullScreenButtonPressed()
{
    toggleFullScreen();
}

//private
void UiManager::toggleFullScreen()
{
    //Exit Fullscreen
    if (isFullScreen()) {
        if (window_was_maximized_){
            view_->showNormal();
            view_->showMaximized();
        }
        else
            view_->showNormal();
    }
    //Enter Fullscreen
    else {
        window_was_maximized_ = view_->windowState() == Qt::WindowState::WindowMaximized;
        view_->showFullScreen();
    }

    emit isFullScreenChanged(isFullScreen());
}

} // namespace hangman
