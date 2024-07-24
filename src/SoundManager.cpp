#include "SoundManager.h"

namespace hangman {

//public
SoundManager::SoundManager(QObject *parent)
    : QObject(parent)
    , pencilSound_(new QSoundEffect())
    , clickSound_(new QSoundEffect())
{
    initSound(&pencilSound_, ":/resources/sounds/pencil.wav");
    initSound(&clickSound_, ":/resources/sounds/click.wav");
}

void SoundManager::playSound_pencil()
{
    pencilSound_.play();
}

void SoundManager::playSound_click()
{
    clickSound_.play();
}

//private
void SoundManager::initSound(QSoundEffect *effect, const QString &soundPath)
{
    effect->setSource(QUrl::fromLocalFile(soundPath));
    effect->setVolume(1);
    effect->setLoopCount(1);
}

} // namespace hangman
