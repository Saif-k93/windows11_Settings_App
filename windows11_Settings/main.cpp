
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QQmlContext>
#include <QWindow>
#include "returncurrentindex.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    //////////////////////////////////////////////////////////////////

    qmlRegisterType<ReturnCurrentIndex>("returncurrentindex.h",1,0,"CurrentIndex");

    //////////////////////////////////////////////////////////////////

    engine.loadFromModule("windows11_Settings", "Main");



    return app.exec();
}

