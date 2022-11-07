#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QLocale>
#include <QTranslator>

#include <QQmlContext>

#include <qmlclipboardadapter.h>>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QmlClipboardAdapter clipboard;

    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "ColorPicker_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/ColorPicker/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    QQmlContext * context = engine.rootContext();
    context->setContextProperty("clipboard", &clipboard);

    return app.exec();
}
