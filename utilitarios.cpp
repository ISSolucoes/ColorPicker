#include "utilitarios.h"

Utilitarios::Utilitarios(QObject *parent)
    : QObject{parent}
{

}

void Utilitarios::copiaTextoCor(QString textoCor)
{
    QClipboard *clipboard = QGuiApplication::clipboard();
    clipboard->setText(textoCor);

    emit textoCopiado(textoCor);
}
