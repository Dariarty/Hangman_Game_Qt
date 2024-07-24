QT += quick multimedia

SOURCES += \
        GameHandler.cpp \
        MenuHandler.cpp \
        SoundManager.cpp \
        Translator.cpp \
        UiManager.cpp \
        main.cpp

RESOURCES += \ 
        qml.qrc \
        resources.qrc \
        words.qrc \
        translations.qrc

HEADERS += \
    GameHandler.h \
    MenuHandler.h \
    SoundManager.h \
    Translator.h \
    UiManager.h

TRANSLATIONS += \
    translations/hangman_game_ru_RU.ts \
    translations/hangman_game_en_US.ts

