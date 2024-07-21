#include "UiManager.h"

namespace hangman {

//public
UiManager::UiManager(QObject *parent)
    : QObject(parent)
    , view_(new QQuickView())
    , translator_(new Translator())
    , menu_(new MenuHandler())
    , game_(new GameHandler())
    , window_was_maximized_(false)
{
    translator_->initTranslation();

    qmlRegister();

    loadUi();
}

void UiManager::qmlRegister()
{
    view_->engine()->rootContext()->setContextProperty("UiManager", this);
    view_->engine()->rootContext()->setContextProperty("Translator", translator_.data());
    //view_->engine()->rootContext()->setContextProperty("Menu", menu_.data());
    //view_->engine()->rootContext()->setContextProperty("Game", game_.data());
}

void UiManager::loadUi()
{
    view_->setResizeMode(QQuickView::SizeRootObjectToView);

    view_->setWidth(view_->screen()->geometry().width() * 0.6);
    view_->setHeight(view_->screen()->geometry().height() * 0.6);

    view_->setMinimumWidth(view_->screen()->geometry().width() / 2);
    view_->setMinimumHeight(view_->screen()->geometry().height() / 2);

    view_->setTitle(kAppTitle);
    view_->setIcon(QIcon(":/resources/icons/hangman.png"));

    view_->setSource(QUrl(kMainQmlName));

    connect(view_->engine(), &QQmlApplicationEngine::quit, this, [=](){
        view_->close();
    });

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

void UiManager::minimizeButtonPressed()
{
    view_->showMinimized();

    emit isFullScreenChanged(isFullScreen());
}

//private
void UiManager::toggleFullScreen()
{
    //Exit Fullscreen
    if (isFullScreen()) {
        view_->showNormal();

        if (window_was_maximized_)
            view_->showMaximized();
    }
    //Enter Fullscreen
    else {
        window_was_maximized_ = view_->windowState() == Qt::WindowState::WindowMaximized;
        view_->showFullScreen();
    }

    emit isFullScreenChanged(isFullScreen());
}

} // namespace hangman
