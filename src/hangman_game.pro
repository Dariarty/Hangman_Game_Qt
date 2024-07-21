QT += quick

SOURCES += \
        GameHandler.cpp \
        MenuHandler.cpp \
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
    Translator.h \
    UiManager.h

TRANSLATIONS += \
    translations/hangman_game_ru_RU.ts \
    translations/hangman_game_en_US.ts

