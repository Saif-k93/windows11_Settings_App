
var newObject

function create(parent) {
    newObject = Qt.createQmlObject(`
                                   import QtQuick
                                   import QtQuick.Controls
                                   import Qt.labs.platform

                                   Rectangle {
                                   id: _AccountRect

                                   property var setAnc: undefined
                                   anchors {
                                   top: parent.top
                                   left: parent.left
                                   right: setAnc.right
                                   bottom: setAnc.top
                                   bottomMargin: 16
                                   topMargin: 7
                                   leftMargin: -7
                                   }
                                   radius: 5
                                   color: _AccHover.hovered ? "#eaeaea" : "#f3f3f3"

                                   Rectangle {
                                   id: _AccImg_Rect

                                   width: 58
                                   anchors {
                                   left: parent.left
                                   top: parent.top
                                   bottom: parent.bottom
                                   leftMargin: 11
                                   topMargin: 11
                                   bottomMargin: 10
                                   }
                                   radius: width
                                   clip: true
                                   border.color: "black"
                                   border.width: 2

                                   Image {
                                   id: _AccountImage

                                   source: "qrc:/img/Account_Image.png"
                                   anchors.fill: parent
                                   fillMode: Image.PreserveAspectFit
                                   anchors.margins: 1
                                   }

                                   }
                                   Text {
                                   id: _NameTxt

                                   anchors {
                                   left: _AccImg_Rect.right
                                   verticalCenter: _AccImg_Rect.verticalCenter
                                   leftMargin: 15
                                   verticalCenterOffset: -7
                                   }
                                   font {
                                   family: "Bahnschrift SemiBold"
                                   pixelSize: 15
                                   }
                                   text: qsTr("Saif Khalifa")
                                   }
                                   Text {
                                   id: _EmailTxt

                                   anchors {
                                   left: _AccImg_Rect.right
                                   verticalCenter: _AccImg_Rect.verticalCenter
                                   leftMargin: 15
                                   verticalCenterOffset: 10
                                   }
                                   text: qsTr("email@outlook.com")
                                   }
                                   HoverHandler {
                                   id: _AccHover

                                   acceptedDevices: PointerDevice.Mouse

                                   }
                                   }

                                   `,parent,"myDynamicSnippet")
}

function getAccountObj() {
    return newObject
}




