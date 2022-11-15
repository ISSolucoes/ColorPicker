import QtQuick
import QtQuick.Controls

import ColorPicker2

Window {
    visible: true
    title: qsTr("Color Picker 2")
    color: retanguloCor.border.color

    Utilitarios {
        id: util;
    }

    Rectangle {
        id: retanguloCor
        z: 0
        anchors.fill: parent
        color: "#2196f3";
        border.color: "black";
        border.width: 6;
        radius: 35;

        ColorAnimation {
            id: retanguloCorAnimation
            target: retanguloCor
            property: "color"
            //to: "yellow"
            duration: 300
            running: true
        }

        MouseArea {
            anchors.fill: retanguloCor

            onClicked: function() {
                function getRandomIntInclusive(min, max) {
                    min = Math.ceil(min);
                    max = Math.floor(max);
                    return Math.floor(Math.random() * (max - min) + min);
                }

                let vermelho = getRandomIntInclusive(0, 255);
                let verde = getRandomIntInclusive(0, 255);
                let azul = getRandomIntInclusive(0, 255);

                // representando os valores de 0 a 255 em hexadecimal
                let vermelhoHex = vermelho.toString(16);
                let verdeHex = verde.toString(16);
                let azulHex = azul.toString(16);

                // representando os valores de 0 a 255 em intervalo de 0 á 1
                vermelho = vermelho/255;
                verde = verde/255;
                azul = azul/255;

                let cor;
                cor = Qt.rgba(vermelho, verde, azul);

                retanguloCorAnimation.to = cor;
                retanguloCorAnimation.running = true;

                //Convertendo para hexadecimal
                let hexadecimal = "";

                if (vermelhoHex.length === 1)
                  vermelhoHex = "0" + vermelhoHex;
                if (verdeHex.length === 1)
                  verdeHex = "0" + verdeHex;
                if (azulHex.length === 1)
                  azulHex = "0" + azulHex;

                hexadecimal = "#" + vermelhoHex + verdeHex + azulHex;

                util.copiaTextoCor(hexadecimal);

                campoTextoCorHex.text = qsTr("Cor gerada e código copiado, agora basta pressionar um campo de texto e colar o código");

            }
        }

    }

    Text {
        id: campoTextoCorHex
        width: parent.width
        height: parent.height
        text: qsTr("Toque para gerar uma cor")
        fontSizeMode: Text.Fit
        font.pixelSize: 25
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        padding: 20
        wrapMode: Text.Wrap
    }


}
