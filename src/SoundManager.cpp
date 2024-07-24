#include "SoundManager.h"

namespace hangman {

//public
SoundManager::SoundManager(QObject *parent)
    : QObject(parent)
    , pencilSound_(new QSoundEffect())
{
    initSound(pencilSound_, ":/resources/sounds/pencil.wav");
}

void SoundManager::playSound_pencil()
{
    pencilSound_->play();
}

//private
void SoundManager::initSound(QScopedPointer<QSoundEffect> &effect, QString soundPath)
{
    effect->setSource(QUrl::fromLocalFile(soundPath));
    effect->setVolume(1);
    effect->setLoopCount(1);
}

} // namespace hangman
