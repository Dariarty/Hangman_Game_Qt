#include "Translator.h"

namespace hangman {

Translator::Translator(QObject *parent)
    : QObject(parent), translator_(new QTranslator()),
      translationLoaded_(false) {
  alphabets_.insert("en_US", "abcdefghijklmnopqrstuvwxyz");
  alphabets_.insert("ru_RU", "абвгдежзийклмнопрстуфхцчшщъыьэюя");
}

void Translator::initTranslation()
{
    QString defaultTranslation = ":/translations/hangman_game_" + QLocale::system().name() + ".qm";

    translationLoaded_ = translator_->load(defaultTranslation);

    if (!translationLoaded_)
        translationLoaded_ = translator_->load(":/translations/hangman_game_en_US.qm");

    if (translationLoaded_)
        QGuiApplication::instance()->installTranslator(translator_);

    emit languageChanged();
    emit alphabetChanged();
}

QString Translator::language() const
{
    return translator_->language();
}

QString Translator::alphabet() const {
  return alphabets_.value(translator_->language());
}

void Translator::setLanguage(const QString &newLanguage)
{
    translationLoaded_ = translator_->load(":/translations/hangman_game_" + newLanguage + ".qm");

    if (translationLoaded_) {
        emit languageChanged();
        emit alphabetChanged();
    }
}

} // namespace hangman
