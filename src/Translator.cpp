#include "Translator.h"

namespace hangman {

Translator::Translator(QObject *parent)
    : QObject(parent)
    , translator_(new QTranslator())
    , translationLoaded_(false)
{}

void Translator::initTranslation()
{
    QString defaultTranslation = ":/translations/hangman_game_" + QLocale::system().name() + ".qm";

    translationLoaded_ = translator_->load(defaultTranslation);

    if (!translationLoaded_)
        translationLoaded_ = translator_->load(":/translations/hangman_game_en_US.qm");

    if (translationLoaded_)
        QGuiApplication::instance()->installTranslator(translator_);
}

QString Translator::language() const
{
    return translator_->language();
}

void Translator::setLanguage(const QString &newLanguage)
{
    translationLoaded_ = translator_->load(":/translations/hangman_game_" + newLanguage + ".qm");

    if (translationLoaded_)
        emit languageChanged();
}

} // namespace hangman
