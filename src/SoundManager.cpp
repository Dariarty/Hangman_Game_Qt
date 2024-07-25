#include "SoundManager.h"

namespace hangman {

//public
SoundManager::SoundManager(QObject *parent)
    : QObject(parent)
    , effects_(new QMap<QString, QSoundEffect *>)
    , muted_(false)
{
    initSound("pencil", ":/resources/sounds/pencil.wav");
    initSound("click", ":/resources/sounds/click.wav");
    initSound("correct", ":/resources/sounds/correct.wav");
    initSound("victory", ":/resources/sounds/victory.wav");
    initSound("defeat", ":/resources/sounds/defeat.wav");
}

void SoundManager::playSound(const QString &soundName) const {
  if (!muted_)
    effects_->value(soundName)->play();
}

void SoundManager::switchMute()
{
    muted_ = !muted_;

    for (auto effect = effects_->begin(); effect != effects_->end(); effect++) {
        effect.value()->setMuted(muted_);
    }

    emit mutedChanged();
}

//private
void SoundManager::initSound(const QString &effectName, const QString &soundPath)
{
    effects_->insert(effectName, new QSoundEffect());

    effects_->value(effectName)->setSource(QUrl::fromLocalFile(soundPath));
    effects_->value(effectName)->setVolume(1);
    effects_->value(effectName)->setLoopCount(1);
}

} // namespace hangman
