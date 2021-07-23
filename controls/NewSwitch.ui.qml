import QtQuick 2.15
import QtQuick.Controls 2.12

Switch {
    id: newSwitch

    width: 40
    height: 20

    property string placeholder: "Text here..."
    readonly property int baseSize: 12

    background: backgroundItem
    Rectangle {
        id: backgroundItem
        color: "#1a000000"
        border.width: 1
        radius: width / 2
        border.color: "#80ffffff"
        anchors.fill: parent
    }

    indicator: switchHandle
    Rectangle {
        id: switchHandle
        height: parent.height
        width: parent.width
        color: background.color
        anchors.verticalCenter: parent.verticalCenter
        radius: backgroundItem.radius

        Rectangle {
            id: rectangle
            width: height
            height: parent.height - 8
            x: 4
            radius: width/2
            color: backgroundItem.border.color
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: backgroundItem.right
        anchors.leftMargin: 12
        color: "#ffffff"
        font.pixelSize: 14
        font.family: "Segoe UI Variable Static small"
        text: placeholder
    }

    states: [
        State {
            name: "off"
            when: !newSwitch.checked

            PropertyChanges {
                target: rectangle
                color: rectangle.color
            }

            PropertyChanges {
                target: switchHandle
                color: switchHandle.color
                border.color: "#aeaeae"
            }
        },
        State {
            name: "on"
            when: newSwitch.checked

            PropertyChanges {
                target: switchHandle
                color: "#60CDFF"
                border.color: "#60CDFF"
            }

            PropertyChanges {
                target: rectangle
                x: parent.width - width - 4
                color: "#000000"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;formeditorZoom:3}
}
##^##*/

