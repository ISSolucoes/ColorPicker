import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

ApplicationWindow {
    id: root
    visible: true
    title: qsTr("Color Picker")
    color: retanguloCor.border.color
    Material.foreground: "white"

    Rectangle {
        id: retanguloCor
        z: 0
        anchors.fill: parent
        color: "#2196f3";
        border.color: "black";
        border.width: 6;
        radius: 35;

        MouseArea {
            anchors.fill: retanguloCor

            onClicked: function() {
                function getRandomIntInclusive(min, max) {
                    min = Math.ceil(min);
                    max = Math.floor(max);
                    return Math.floor(Math.random() * (max - min) + min);
                }

                campoTextoCorHex.text = qsTr("Cor gerada e código copiado");

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

                let progressaoTransparencia = 0.00025;
                let transparencia;
                for(transparencia = 0; transparencia <= 1; transparencia += progressaoTransparencia) {
                    cor = Qt.rgba(vermelho, verde, azul, transparencia);
                    retanguloCor.color = cor;
                }

                //Convertendo para hexadecimal
                let hexadecimal;
                let transparenciaHex = Math.round(transparencia * 255).toString(16);

                if (vermelhoHex.length === 1)
                  vermelhoHex = "0" + vermelhoHex;
                if (verdeHex.length === 1)
                  verdeHex = "0" + verdeHex;
                if (azulHex.length === 1)
                  azulHex = "0" + azulHex;
                if (transparenciaHex.length === 1)
                  transparenciaHex = "0" + transparenciaHex;

                //hexadecimal = "#" + vermelhoHex + verdeHex + azulHex + transparenciaHex;
                hexadecimal = "#" + vermelhoHex + verdeHex + azulHex;

                //console.log(vermelhoHex + " " + verdeHex + " " + azulHex);

                clipboard.setText(hexadecimal);

            }
        }

    }

    Label {
        id: campoTextoCorHex
        text: qsTr("Toque para gerar uma cor")
        font.pixelSize: 16
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

}
