#ifndef TRANSLATOR_H
#define TRANSLATOR_H

#include <QGuiApplication>
#include <QMap>
#include <QObject>
#include <QTranslator>

namespace hangman {

class Translator : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(Translator)

    Q_PROPERTY(QString language READ language NOTIFY languageChanged)
    Q_PROPERTY(QString alphabet READ alphabet NOTIFY alphabetChanged)

public:
    Translator(QObject *parent = NULL);
    ~Translator() = default;

    void initTranslation();

    QString language() const;

    QString alphabet() const;

    Q_INVOKABLE void setLanguage(const QString &newLanguage);

signals:
    void languageChanged();
    void alphabetChanged();

private:
    QTranslator *translator_;

    bool translationLoaded_;

    QMap<QString, QString> alphabets_;
};

} // namespace hangman

#endif // TRANSLATOR_H
