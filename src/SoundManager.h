#ifndef SOUNDMANAGER_H
#define SOUNDMANAGER_H

#include <QObject>
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

    //Click Sound Effect
    Q_INVOKABLE void playSound_click();

    //Correct Sound Effect
    Q_INVOKABLE void playSound_correct();

private:
    void initSound(QSoundEffect *effect, const QString &soundPath);

    //Sound Effects
    QSoundEffect pencilSound_;
    QSoundEffect clickSound_;
    QSoundEffect correctSound_;
};

} // namespace hangman

#endif // SOUNDMANAGER_H
