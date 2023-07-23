
import QtQuick
import QtQuick.Controls
import Qt.labs.platform
import QtQml
/////////////////////////
import "../js/ResizeLeftBarImg.js" as ResizeLeftBarImg

Rectangle {
    id:compRect

    width: parent.width
    height: 35
    radius: 5
    color: _hover.hovered ? "#eaeaea" : "#f3f3f3"

    Rectangle {
        id:selectorRect

        width: 3
        height: parent.height / 2/1
        anchors.right: img.left
        anchors.rightMargin: 5
        color: "#784c98"
        radius: width
        transform: Translate {y:9}
        visible: _hover.hovered ? true : false
    }
    Rectangle {
        id:selectedRect

        width: 30
        height: 2
        anchors {
            top: txt.bottom
            left: txt.left
            right: txt.right
            topMargin: 4
        }

        color: "#784c98"
        radius: width
        visible: leftBar.currentIndex === index
    }

    Text {
        id: txt

        text: _txt
        font {
            pixelSize: 14
        }
        color: _area.pressed ? "#6e6d6d" : "black"
        opacity: leftBar.currentIndex === index ? 1: 0.75
        anchors {
            left: img.right
            leftMargin: 15
            verticalCenter: parent.verticalCenter
        }
    }
    BorderImage {
        id: img
        source: _icon
        width: index === 1 ? 23 : 20; height: ResizeLeftBarImg.getSize(index)
        border.left: 0; border.top: 0
        border.right: 0; border.bottom: 0
        x: index === 1 ? 12 : 15
        anchors.verticalCenter: parent.verticalCenter

    }
    HoverHandler {
        id:_hover
        acceptedDevices: PointerDevice.Mouse
    }
    MouseArea {
        id:_area
        anchors.fill: parent
        onClicked: {
            leftBar.currentIndex = index
            forceActiveFocus()
        }
    }
}
