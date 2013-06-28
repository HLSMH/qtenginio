import QtQuick 2.0
//![imports]
import Enginio 1.0
//![imports]
import "qrc:///config.js" as AppConfig

Rectangle {
    id: root
    width: 400
    height: 640
    color: "#f4f4f4"

    //![model]
    EnginioModel {
        id: enginioModel
        enginio: Enginio {
            backendId: AppConfig.backendData.id
            backendSecret: AppConfig.backendData.secret
        }
        query: {"objectType": "objects.todos" }
    }
    //![model]

    // A simple layout:
    // a listview and a line edit with button to add to the list
    Rectangle {
        id: header
        anchors.top: parent.top
        width: parent.width
        height: 70
        color: "white"

        Row {
            id: logo
            anchors.centerIn: parent
            spacing: 8
            Image {
                source: "qrc:images/enginio.png"
            }
            Text {
                text: "Todo"
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                font.pixelSize: 38
                color: "#555"
            }
        }
        Rectangle {
            width: parent.width ; height: 1
            anchors.bottom: parent.bottom
            color: "#bbb"
        }
    }

    //![view]
    ListView {
        id: listview
        model: enginioModel
        delegate: listItemDelegate
        anchors.top: header.bottom
        anchors.bottom: footer.top
        width: parent.width
        clip: true

        // Animations
        add: Transition { NumberAnimation { properties: "y"; from: root.height; duration: 250 } }
        removeDisplaced: Transition { NumberAnimation { properties: "y"; duration: 150 } }
        remove: Transition { NumberAnimation { property: "opacity"; to: 0; duration: 150 } }
    }
    //![view]

    Image {
        id: headerShadow
        anchors.top: header.bottom
        width: parent.width
        source: "qrc:images/shadow.png"
    }

    BorderImage {
        id: footer

        width: parent.width
        anchors.bottom: parent.bottom
        source: "qrc:images/delegate.png"
        border.left: 5; border.top: 5
        border.right: 5; border.bottom: 5

        Rectangle {
            // Horizontal line
            height: 1
            width: parent.width
            color: "#bbb"
        }

        //![append]

        BorderImage {

            anchors.left: parent.left
            anchors.right: addButton.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 16
            source:"images/textfield.png"
            border.left: 14 ; border.right: 14 ; border.top: 8 ; border.bottom: 8

            TextInput{
                id: textInput
                anchors.fill: parent
                clip: true
                anchors.leftMargin: 14
                anchors.rightMargin: 14
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 22
                Text {
                    id: placeholderText
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    visible: !(parent.text.length || textInput.activeFocus)
                    font: parent.font
                    text: "New todo..."
                    color: "#aaa"
                }
                onAccepted: {
                    enginioModel.append({"title": textInput.text, "completed": false})
                    textInput.text = ""
                }
            }
        }

        Item {
            id: addButton

            width: 40 ; height: 40
            anchors.margins: 20
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            enabled: textInput.text.length
            Image {
                id: addIcon
                source: "qrc:icons/add_icon.png"
                anchors.centerIn: parent
                opacity: enabled ? 1 : 0.5
            }
            MouseArea {
                id: removeMouseArea
                anchors.fill: parent
                onClicked: textInput.accepted()
            }
        }
    }
    //![append]

    Component {
        id: listItemDelegate

        BorderImage {
            id: item

            width: parent.width ; height: 70
            source: mouse.pressed ? "qrc:images/delegate_pressed.png" : "qrc:images/delegate.png"
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5

            Image {
                id: shadow
                anchors.top: parent.bottom
                width: parent.width
                visible: !mouse.pressed
                source: "qrc:images/shadow.png"
            }

            //![setProperty]
            MouseArea {
                id: mouse
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (index !== -1 && _synced) {
                        enginioModel.setProperty(index, "completed", !completed)
                    }
                }
            }
            //![setProperty]
            Image {
                id: checkbox
                anchors.left: parent.left
                anchors.leftMargin: 16
                anchors.verticalCenter: parent.verticalCenter
                source: completed ? "qrc:images/checkbox_checked.png" : "qrc:images/checkbox.png"
            }

            //![delegate-properties]
            Text {
                id: todoText
                text: title
                font.pixelSize: 24
                font.strikeout: completed
                color: completed ? "#333" : "black"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: checkbox.right
                anchors.right: parent.right
                anchors.leftMargin: 12
                anchors.rightMargin: 40
                elide: Text.ElideRight
            }
            //![delegate-properties]

            // Show a delete button when the mouse is over the delegate
            Image {
                //![sync]
                id: removeIcon
                source: "qrc:icons/delete_icon.png"
                enabled: _synced
                //![sync]

                anchors.margins: 20
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                opacity: enabled ? 1 : 0.5
                Behavior on opacity {NumberAnimation{duration: 100}}
                //![remove]
                MouseArea {
                    id: removeMouseArea
                    anchors.fill: parent
                    onClicked: enginioModel.remove(index)
                }
                //![remove]
            }
        }
    }
}
