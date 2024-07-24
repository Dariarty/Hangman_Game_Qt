#ifndef SOUNDMANAGER_H
#define SOUNDMANAGER_H

#include <QObject>
#include <QScopedPointer>
#include <QSoundEffect>

namespace hangman {

class SoundManager : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(SoundManager)

public:
    SoundManager(QObject *parent = NULL);
    ~SoundManager() = default;

    //Pencil Sound Effect
    Q_INVOKABLE void playSound_pencil();

private:
    void initSound(QScopedPointer<QSoundEffect> &effect, QString soundPath);

    //Sound Effects
    QScopedPointer<QSoundEffect> pencilSound_;
};

} // namespace hangman

#endif // SOUNDMANAGER_H
