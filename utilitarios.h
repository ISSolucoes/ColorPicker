#ifndef UTILITARIOS_H
#define UTILITARIOS_H

#include <QObject>
#include <QtQml>
#include <QGuiApplication>
#include <QClipboard>

class Utilitarios : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Utilitarios(QObject *parent = nullptr);

signals:
    void textoCopiado(QString textoCor);

public slots:
    void copiaTextoCor(QString textoCor);

};

#endif // UTILITARIOS_H
