import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import "controls"

Window {
    width: 300
    height: 400
    visible: true
    title: qsTr("Project init")

    Rectangle {
        id: mainWindow
        color: "#272727"
        anchors.fill: parent

        Rectangle {
            id: header
            width: parent.width
            height: 50
            color: "#202020"

            Text {
                id: heading
                color: "#ffffff"
                text: qsTr("START A NEW FLASK PROJECT")
                font.family: "Segoe UI Variable Static Text"
                font.pixelSize: 14
                font.bold: true
                anchors.centerIn: parent
            }
        }

        Column {
            id: container
            width: parent.width
            height: 330
            anchors.top: header.bottom
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0

            NewTextField {
                id: projectTitleInput
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 30
                placeholderText: "Title"
            }

            NewAreaField {
                id: projectDescriptionInput
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: projectTitleInput.bottom
                anchors.topMargin: 10
                placeholderText: "Description"
            }

            NewSwitch {
                id: switch1
                anchors.top: projectDescriptionInput.bottom
                anchors.topMargin: 10
                anchors.left:  parent.left
                anchors.leftMargin: 30
                placeholder: "Blueprint project"
            }

            NewSwitch {
                id: switch2
                anchors.top: switch1.bottom
                anchors.topMargin: 10
                anchors.left:  parent.left
                anchors.leftMargin: 30
                placeholder: "Initialize Git repository"
            }

            NewButton {
                text: "Create project"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: backend.sayHello("Fildine")
            }

        }


    }
}


