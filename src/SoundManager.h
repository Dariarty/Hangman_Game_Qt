#ifndef SOUNDMANAGER_H
#define SOUNDMANAGER_H

#include <QMap>
#include <QObject>
#include <QSoundEffect>

namespace hangman {

class SoundManager : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(SoundManager)

    Q_PROPERTY(bool muted READ muted NOTIFY mutedChanged)

public:
    SoundManager(QObject *parent = NULL);
    ~SoundManager() = default;

    bool muted() const { return muted_; }

    // Play Sound
    Q_INVOKABLE void playSound(const QString &soundName) const;

    //Mute or unmute all sounds
    Q_INVOKABLE void switchMute();

  signals:
    void mutedChanged();

private:
    void initSound(const QString &effectName, const QString &soundPath);

    //Sound Effects
    QMap<QString, QSoundEffect *> *effects_;

    //Are all sounds muted
    bool muted_;
};

} // namespace hangman

#endif // SOUNDMANAGER_H
