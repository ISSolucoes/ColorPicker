#ifndef QMLCLIPBOARDADAPTER_H
#define QMLCLIPBOARDADAPTER_H

#include "qwindowdefs.h"
#include <QObject>
#include <QClipboard>
#include <QGuiApplication>

class QmlClipboardAdapter : public QObject
{
    Q_OBJECT
public:
    explicit QmlClipboardAdapter(QObject *parent = nullptr);
    Q_INVOKABLE void setText(const QString &from);
    Q_INVOKABLE QString text();

signals:

};

#endif // QMLCLIPBOARDADAPTER_H
