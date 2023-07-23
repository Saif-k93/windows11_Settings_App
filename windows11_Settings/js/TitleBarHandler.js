
var newObject

function create(parent) {
    newObject = Qt.createQmlObject(`
                                   import QtQuick
                                   import QtQuick.Controls
                                   import Qt.labs.platform

                                   Item {
                                   anchors.fill: parent

                                   property alias maximizeImage: maxImg
                                   Text {
                                   id: settingsTxt
                                   text: qsTr("Settings")
                                   anchors {
                                   top: parent.top
                                   left: parent.left
                                   leftMargin: 56
                                   topMargin: 17
                                   }
                                   color: "#1a1a1a"
                                   font.pixelSize: 10
                                   scale: 1.2
                                   }

                                   Image {
                                   id: backImg
                                   source: "qrc:/img/left-arrow.png"
                                   anchors {
                                   verticalCenter: settingsTxt.verticalCenter
                                   }
                                   transform: Translate {x: -230; y:1}
                                   opacity: 0.3
                                   scale: 0.031
                                   }

                                   Rectangle {
                                   id: _CloseRect
                                   anchors {
                                   right: parent.right
                                   top: parent.top
                                   rightMargin: 1.5
                                   topMargin: 1.5
                                   }
                                   width: 45
                                   height: 33
                                   color: __Hover.hovered ? _Mouse_Area.pressed ? "#91c91f11" : "#c42b1c" : "#f3f3f3"
                                   radius: 4
                                   HoverHandler {
                                   id: __Hover

                                   acceptedDevices: PointerDevice.Mouse
                                   }
                                   BorderImage {
                                   id: closeImg
                                   source: "qrc:/img/Close.png"
                                   width: 17; height: 17
                                   border.left: 1; border.top: 1
                                   border.right: 1; border.bottom: 1
                                   anchors.centerIn: parent
                                   opacity: 0.7
                                   }
                                   MouseArea {
                                   id: _Mouse_Area
                                   anchors.fill: parent
                                   hoverEnabled: true
                                   onEntered: __Hover.enabled = true
                                   onExited: __Hover.enabled = false
                                   onReleased: if(__Hover.hovered)root.close()
                                   }
                                   }

                                   Rectangle {
                                   id: _MaxRect
                                   anchors {
                                   right: _CloseRect.left
                                   top: parent.top
                                   rightMargin: 1.5
                                   topMargin: 1.5
                                   }
                                   width: 45
                                   height: 33
                                   color: __Hover2.hovered ? _Mouse_Area2.pressed ? "#91966ab4" : "#986db5" : "#f3f3f3"
                                   radius: 4
                                   HoverHandler {
                                   id: __Hover2

                                   acceptedDevices: PointerDevice.Mouse
                                   }

                                   BorderImage {
                                   id: maxImg
                                   source: "qrc:/img/Maximize.png"
                                   width: 16; height: 16
                                   border.left: 1; border.top: 1
                                   border.right: 1; border.bottom: 1
                                   anchors.centerIn: parent
                                   opacity: 0.7
                                   }

                                   MouseArea {
                                   id: _Mouse_Area2
                                   anchors.fill: parent
                                   hoverEnabled: true
                                   onEntered: __Hover2.enabled = true
                                   onExited: __Hover2.enabled = false
                                   onReleased: if(__Hover2.hovered){
                                   if(visibility === 2)
                                   root.showMaximized()
                                   else
                                   root.showNormal()
                                   }
                                   }
                                   }

                                   Rectangle {
                                   id: _MinRect
                                   anchors {
                                   right: _MaxRect.left
                                   top: parent.top
                                   rightMargin: 1.5
                                   topMargin: 1.5
                                   }
                                   width: 45
                                   height: 33
                                   color: __Hover3.hovered ? _Mouse_Area3.pressed ? "#91986db5" : "#986db5" : "#f3f3f3"
                                   radius: 4
                                   HoverHandler {
                                   id: __Hover3

                                   acceptedDevices: PointerDevice.Mouse
                                   }

                                   BorderImage {
                                   id: minImg
                                   source: "qrc:/img/Minimize.png"
                                   width: 16; height: 16
                                   border.left: 1; border.top: 1
                                   border.right: 1; border.bottom: 1
                                   anchors.centerIn: parent
                                   opacity: 0.7
                                   }

                                   MouseArea {
                                   id: _Mouse_Area3
                                   anchors.fill: parent
                                   hoverEnabled: true
                                   onEntered: __Hover3.enabled = true
                                   onExited: __Hover3.enabled = false
                                   onReleased: if(__Hover3.hovered) root.showMinimized()
                                   }
                                   }
                                   }

                                   `,parent,"myDynamicSnippet")
}

function getTitleBarObj() {
    return newObject
}










