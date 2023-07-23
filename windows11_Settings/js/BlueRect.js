var newObject

function create(parent) {
    newObject = Qt.createQmlObject(`

                                   import QtQuick
                                   import QtQuick.Controls

                                   Rectangle {
                                       id: _BlueRect

                                   property alias setText: inTxt.text
                                       width: 100
                                       height: 32
                                       anchors {
                                           right: parent.right
                                           verticalCenter: parent.verticalCenter
                                           rightMargin: 40
                                       }
                                       radius: 6
                                       color: hoveH.hovered ? "#1975c5" : "#0067c0"
                                       Text {
                                           id: inTxt
                                           text: qsTr("Add device")
                                           anchors.centerIn: parent
                                           color: _Area.pressed ? "#a8cae9" : "white"
                                           font.pixelSize: 13
                                           font.family: "Segoe UI Variable Small Semibol"
                                       }
                                       MouseArea {
                                           id:_Area

                                           anchors.fill: parent
                                       }
                                       HoverHandler {
                                           id:hoveH

                                           acceptedDevices: PointerDevice.Mouse
                                       }
                                   }

                                   `,parent,"myDynamicSnippet")
}

function getBlueRectObj() {
    return newObject
}
