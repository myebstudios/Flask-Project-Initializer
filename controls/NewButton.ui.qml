import QtQuick 2.15
import QtQuick.Controls 2.12

Button {
    id: control

    property string buttonText: "Button"

    implicitWidth: Math.max(
                       buttonBackground ? buttonBackground.implicitWidth : 0,
                       textItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(
                        buttonBackground ? buttonBackground.implicitHeight : 0,
                        textItem.implicitHeight + topPadding + bottomPadding)

    text: buttonText

    background: buttonBackground
    Rectangle {
        id: buttonBackground
        color: "#60CDFF"
        implicitWidth: 240
        implicitHeight: 32
        radius: 4
    }

    contentItem: textItem
    Text {
        id: textItem
        text: control.text
        font.pixelSize: 14
        font.family: "Segoe UI Variable Static small"
        color: "#000000"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    states: [
        State {
            name: "normal"
            when: !control.down

            PropertyChanges {
                target: buttonBackground
                color: "#60CDFF"
            }

            PropertyChanges {
                target: textItem
                color: "#000000"
            }
        },
        State {
            name: "down"
            when: control.down
            PropertyChanges {
                target: textItem
                color: "#000000"
            }

            PropertyChanges {
                target: buttonBackground
                color: "#60CDFF"
            }
        }
    ]
}
