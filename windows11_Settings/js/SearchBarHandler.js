
var newObject

function create(parent) {
    newObject = Qt.createQmlObject(`
                                   import QtQuick
                                   import QtQuick.Controls
                                   import Qt.labs.platform
                                   import QtQuick.Layouts
                                   import QtQml

                                   TextField {
                                   id:searchTxt

                                   property alias searchText: searchTxt
                                   height: 33
                                   placeholderText: "Find a setting"
                                   focus: true
                                   color: activeFocus ? "black" : "#4a4949"
                                   font {
                                   pixelSize: 13
                                   bold: false
                                   }
                                   verticalAlignment: Qt.AlignVCenter
                                   horizontalAlignment: Qt.AlignLeft
                                   rightPadding: 70

                                   anchors {
                                   bottom: leftBar.top
                                   left: parent.left
                                   right: parent.right
                                   rightMargin: 25
                                   bottomMargin: 15
                                   }
                                   background: Rectangle {
                                   id: back_Rect
                                   implicitHeight: 33
                                   implicitWidth: 280
                                   color: searchTxt.activeFocus ? "#ffffff" : _Hover.hovered ? "#f6f6f6" : "#fbfbfb"
                                   border.color: "#e5e5e5"
                                   border.width: 1
                                   radius: 5

                                   HoverHandler {
                                   id:_Hover
                                   acceptedDevices: PointerDevice.Mouse
                                   cursorShape: Qt.IBeamCursor
                                   }
                                   }

                                   Rectangle {
                                   id:lineRect
                                   height: searchTxt.activeFocus ? 2 : 1
                                   color: searchTxt.activeFocus ? "#784c98" : "#868686"
                                   anchors {
                                   top: searchTxt.bottom
                                   left: searchTxt.left
                                   right: searchTxt.right
                                   topMargin: searchTxt.activeFocus ? -3 : -2
                                   leftMargin: searchTxt.activeFocus ? 1 : 2
                                   rightMargin: searchTxt.activeFocus ? 1 : 2
                                   }
                                   radius: width

                                   OpacityAnimator {
                                   target: lineRect
                                   duration: 1000
                                   from: 0.0
                                   to: 1.0
                                   loops: 1
                                   running: searchTxt.activeFocus
                                   }
                                   OpacityAnimator {
                                   target: lineRect
                                   duration: 1000
                                   from: 1.0
                                   to: 0.0
                                   loops: 1
                                   running: !searchTxt.activeFocus
                                   onFinished: lineRect.opacity = 1
                                   }
                                   }
                                   Rectangle {
                                   id: _SearchRect

                                   width: 20
                                   color: "transparent"
                                   anchors {
                                   top: searchTxt.top
                                   bottom: searchTxt.bottom
                                   right: searchTxt.right
                                   rightMargin: 6
                                   }
                                   radius: width
                                   AnimatedImage {
                                   id: _AnimatedImg
                                   source: "qrc:/img/SearchBox.gif"
                                   anchors.fill: parent
                                   fillMode: Image.PreserveAspectFit
                                   rotation: -90
                                   speed: 0.7
                                   opacity: searchTxt.activeFocus ? 1 : 0.4
                                   playing: searchTxt.text && searchTxt.activeFocus
                                   OpacityAnimator {
                                   target: _AnimatedImg
                                   duration: 2000
                                   running: searchTxt.activeFocus
                                   from: 0
                                   to: 1
                                   }
                                   OpacityAnimator {
                                   target: _AnimatedImg
                                   duration: 1000
                                   running: !searchTxt.activeFocus
                                   from: 1
                                   to: 0.4
                                   }
                                   MouseArea {
                                   id:_ImageArea
                                   anchors.fill: parent
                                   onPressed: if(searchTxt.activeFocus) _AnimatedImg.opacity = 0.5
                                   onReleased: if(searchTxt.activeFocus) _AnimatedImg.opacity = 1
                                   }
                                   }

                                   HoverHandler {
                                   id: _SreachHover
                                   acceptedDevices: PointerDevice.Mouse
                                   cursorShape: Qt.ArrowCursor
                                   }

                                   }
                                   Rectangle {
                                   id: _ClearTxt

                                   width: 18
                                   height: 18
                                   anchors {
                                   right: _SearchRect.left
                                   top: searchTxt.top
                                   bottom: searchTxt.bottom
                                   topMargin: 7
                                   bottomMargin: 8
                                   rightMargin: 11
                                   }
                                   radius: width
                                   color: _ClearHover.hovered ? _ClearArea.pressed ? "#418a8a8a" : "#f3f3f3" : "#f6f6f6"
                                   visible: searchTxt.text !== ""
                                   HoverHandler {
                                   id:_ClearHover
                                   acceptedDevices: PointerDevice.Mouse
                                   cursorShape: Qt.ArrowCursor
                                   }
                                   MouseArea {
                                   id: _ClearArea
                                   anchors.fill: parent
                                   hoverEnabled: true
                                   onEntered: _ClearHover.enabled = true
                                   onExited: _ClearHover.enabled = false
                                   onReleased: if(_ClearHover.hovered) searchTxt.clear()
                                   }
                                   BorderImage {
                                   id: _ClearImg
                                   source: "qrc:/img/Close.png"
                                   width: 14; height: 14
                                   border.left: 0; border.top: 0
                                   border.right: 0; border.bottom: 0
                                   anchors.fill: parent
                                   anchors.margins: 2
                                   opacity: .7
                                   }
                                   }

                                   }

                                   `,parent,"myDynamicSnippet")

}

function getSearchBarObj() {
    return newObject
}
