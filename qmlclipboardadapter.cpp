#include "qmlclipboardadapter.h"

#include <QClipboard>
#include <QObject>
#include <QGuiApplication>

QmlClipboardAdapter::QmlClipboardAdapter(QObject *parent)
    : QObject{parent}
{

}

void QmlClipboardAdapter::setText(const QString &from) {
    QClipboard *clipboard = QGuiApplication::clipboard();
    clipboard->setText(from);
}

QString QmlClipboardAdapter::text() {
    QClipboard *clipboard = QGuiApplication::clipboard();
    return clipboard->text();
}
