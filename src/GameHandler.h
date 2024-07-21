#ifndef GAMEHANDLER_H
#define GAMEHANDLER_H

#include <QChar>
#include <QObject>
#include <QPair>
#include <QSet>

namespace hangman {

enum gameRoundState { none, ongoing, victory, defeat };

class GameHandler : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(GameHandler)

    Q_PROPERTY(int errorsCount READ errorsCount NOTIFY errorsCountChanged)

public:
    GameHandler(QObject *parent = NULL);
    ~GameHandler() = default;

    void initGameRound(QString codeword);

    int errorsCount() const { return errorsCount_; }

    Q_INVOKABLE void makeGuess(const QChar &letter);

    Q_INVOKABLE void abandonGame();

signals:
    //Start Round
    void roundStarted(int wordLength);

    //Finish round
    void roundFinished(bool victory);

    //Mark letter as used on keyboard
    void guessMade(QChar letter, bool success);

    //Open letter in word display
    void openLetter(QChar letter, int position, bool success);

    //Update Image
    void errorsCountChanged();

private:
    //CodeWord - QPair contains symbol and flag if it is guessed
    QList<QPair<QChar, bool>> codeWord_;

    //number of errors made by player
    int errorsCount_;

    //used characters
    QSet<QChar> usedLetters_;

    gameRoundState roundState_;

    //Check if word is guessed
    bool wordGuessed() const;

    //Check if letter is in codeWord
    bool checkLetter(const QChar &letter);

    void processTurn(bool successfulTurn);

    static const int maxErrors = 10;
};

} // namespace hangman

#endif // GAMEHANDLER_H
