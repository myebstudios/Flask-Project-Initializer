import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: inputField
    width: 240
    height: 32

    property string value: ""
    property string placeholderText: "Enter text here..."

    Rectangle {
        color: textEdit.activeFocus ? "#00ffffff" : "#0fffffff"
        anchors.fill: parent
        radius: 3
        border.color: "#0fffffff"

        Rectangle {
            id: bottomLine
            width: parent.width - 2
            height: 1.2
            color: textEdit.activeFocus ? "#60CDFF" : "#80ffffff"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            radius: 3
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextEdit {
            id: textEdit
            color: "#ffffff"
            anchors.fill: parent
            text: value
            verticalAlignment: Text.AlignVCenter
            leftPadding: 10
            font.pixelSize: 14
            font.family: "Segoe UI Variable Static small"
            wrapMode: TextEdit.Wrap

            Text {

                font.pixelSize: 14
                font.family: "Segoe UI Variable Static small"
                text: placeholderText
                color: "#b3ffffff"
                visible: !textEdit.text && !textEdit.activeFocus
                anchors.verticalCenter: parent.verticalCenter
                leftPadding: 10
            }
        }

        Binding {
            target: inputField;
            property: "value";
            value: textEdit.text;
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.5}
}
##^##*/

