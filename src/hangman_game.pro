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

DISTFILES += \
    android/AndroidManifest.xml \

contains(ANDROID_TARGET_ARCH,arm64-v8a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

