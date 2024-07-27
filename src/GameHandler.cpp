#include "GameHandler.h"

namespace hangman {

GameHandler::GameHandler(QSharedPointer<SoundManager> soundManager,
                         QSharedPointer<Translator> translator, QObject *parent)
    : QObject(parent)
    , soundManager_(soundManager)
    , translator_(translator)
    , errorsCount_(0)
    , roundState_(gameRoundState::none)
{}

void GameHandler::initGameRound(QString word)
{
    //Clear game variables
    codeWord_.clear();
    usedLetters_.clear();

    errorsCount_ = 0;
    emit errorsCountChanged();

    //Write codeword
    for (int i = 0; i < word.length(); i++) {
        codeWord_.append(qMakePair(word.at(i).toLower(), false));
    }

    emit roundStarted(word.length());

    //Update Round State as ongoing
    roundState_ = gameRoundState::ongoing;

    //Check if word contains symbols not in alphabet
    for(auto i = codeWord_.begin(); i < codeWord_.end(); i++){
      if(translator_->alphabet().contains(i->first))
          continue;
      i->second = true;
      emit openLetter(i->first, i - codeWord_.begin(), true);
    }
}

void GameHandler::makeGuess(const QChar &letter)
{
    //Return if letter is already used in this round or game is not in progress
    if (roundState_ != gameRoundState::ongoing || usedLetters_.contains(letter))
        return;

    //Saved used letter
    usedLetters_.insert(letter);

    //Check Guess
    bool successfulGuess = checkLetter(letter);

    //Mark letter in keyboard as used
    emit guessMade(letter, successfulGuess);

    //Check for game end and increase errors
    processTurn(successfulGuess);
}

void GameHandler::abandonGame()
{
    //Clear game variables
    codeWord_.clear();
    usedLetters_.clear();

    errorsCount_ = 0;
    emit errorsCountChanged();

    roundState_ = gameRoundState::none;
}

//private
bool GameHandler::wordGuessed() const
{
    for (auto i = codeWord_.begin(); i < codeWord_.end(); i++) {
        if (!i->second)
            return false;
    }

    return true;
}

bool GameHandler::checkLetter(const QChar &letter)
{
    bool guessSuccessful = false;

    //Open letter in a word display
    for (auto i = codeWord_.begin(); i < codeWord_.end(); i++) {
        if (i->first.toLower() == letter.toLower()) {
            guessSuccessful = true;
            i->second = true;
            emit openLetter(letter, i - codeWord_.begin(), true);
        }
    }

    return guessSuccessful;
}

void GameHandler::processTurn(bool successfulTurn)
{
    //Check if game Won
    if (wordGuessed()) {
        //End Round by victory
        emit roundFinished(true);
        roundState_ = gameRoundState::victory;
        //Play victory Sound
        soundManager_->playSound("victory");
        return;
    }

    //Wrong guess
    if (!successfulTurn) {
        //Increase Errors Counter
        errorsCount_++;
        emit errorsCountChanged();
    }

    //Check if game Lost
    if (errorsCount_ >= maxErrors) {
        //Open all unguessed letters
        for (auto i = codeWord_.begin(); i < codeWord_.end(); i++) {
            if (!i->second)
                emit openLetter(i->first, i - codeWord_.begin(), false);
        }

        //Play Defeat sound
        soundManager_->playSound("defeat");

        //End Round by defeat
        emit roundFinished(false);
        roundState_ = gameRoundState::defeat;
        return;
    }

    //If game is not finished, play sound
    successfulTurn ? soundManager_->playSound("correct")
                   : soundManager_->playSound("pencil");
}

} // namespace hangman
