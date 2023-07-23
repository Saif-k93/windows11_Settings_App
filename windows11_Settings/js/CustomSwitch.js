
var newObject

function create(parent) {
    newObject = Qt.createQmlObject(`

                                   import QtQuick
                                   import QtQuick.Controls

                                   Rectangle {
                                   id: _rootRect

                                   property string __Key: "Validator"
                                   property bool checked: false
                                   function getColor() {
                                   return checked ? "#1a76c6"
                                   : _switchRectHover.hovered ? "#ececec"
                                   : "#f5f5f5"
                                   }
                                   Timer {
                                   id: timer

                                   interval: 500
                                   repeat: false
                                   onTriggered: {
                                   enabled = true
                                   switchRect.color = getColor()
                                   }
                                   }
                                   HoverHandler {
                                   id: _switchRectHover

                                   acceptedDevices: PointerDevice.Mouse
                                   }
                                   MouseArea {
                                   id: _switchRectArea

                                   anchors.fill: parent
                                   hoverEnabled: true
                                   drag.target: innerRect
                                   drag.maximumX: 22
                                   drag.minimumX: 4
                                   drag.maximumY: 2.5
                                   drag.minimumY: 2.5
                                   onReleased: {
                                   if(_switchRectHover.hovered) {
                                   checked = !checked
                                   _rootRect.enabled = false
                                   switchRect.color = "#c5c5c5"
                                   timer.start()
                                   }
                                   innerRect.Drag.drop()
                                   }
                                   }

                                   width: 70
                                   height: 25
                                   anchors {
                                   right: parent.right
                                   top: parent.top
                                   bottom: parent.bottom
                                   rightMargin: 10
                                   topMargin: 10
                                   bottomMargin: 10
                                   }

                                   color: "transparent"
                                   radius: 5

                                   Text {
                                   id: _OffOn

                                   anchors.verticalCenter: switchRect.verticalCenter
                                   text: checked ? "On" : "Off"
                                   font {
                                   pixelSize: 14
                                   family: "Franklin Gothic Medium"
                                   }
                                   }

                                   Rectangle {
                                   id: switchRect

                                   width: 40
                                   height: 19
                                   anchors {
                                   verticalCenter: parent.verticalCenter
                                   right: parent.right
                                   }

                                   DropArea {
                                   id: _dropZone
                                   anchors.fill: parent
                                   Drag.keys: [_rootRect.__Key]
                                   onDropped: {
                                   if(Math.round(innerRect.x) >= 14)
                                   {
                                   checked = true
                                   innerRect.x = 22
                                   }
                                   else if (Math.round(innerRect.x) <= 13)
                                   {
                                   checked = false
                                   innerRect.x = 4
                                   }
                                   switchRect.color = _rootRect.getColor()
                                   }
                                   }
                                   color: getColor()
                                   radius: 10
                                   border.color: "#898989"
                                   border.width: 1
                                   antialiasing: true
                                   clip: true

                                   Rectangle {
                                   id: innerRect
                                   width: _switchRectArea.pressed ? 16 : _switchRectHover.hovered ? 14 : 12
                                   height: _switchRectHover.hovered ? 14 : 12
                                   x: checked ? 22 : 4
                                   y: _switchRectHover.hovered ? 2.5 : 3
                                   radius: height
                                   opacity: _switchRectArea.pressed ? 1 : checked ? 1 : _switchRectHover.hovered ? 0.95 : 0.88
                                   color: checked ? "#ffffff" : "#5d5d5d"

                                   Behavior on x {
                                   NumberAnimation {
                                   duration: 500
                                   easing.type: Easing.InOutBack
                                   }
                                   }
                                   Drag.active: _switchRectArea.drag.active
                                   Drag.keys: [_rootRect.__Key]
                                   }


                                   }
                                   }

                                   `,parent,"myDynamicSnippet")
}

function getSwitchObj() {
    return newObject
}



