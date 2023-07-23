import QtQuick
import QtQuick.Controls
import Qt.labs.platform
import QtQuick.Layouts
import QtQml


Item {
    id: rootItem

    height: 250
    width: parent.width -10


    Rectangle {
        id: _AddDeviceRect

        width: 200
        height: 200
        anchors {
            left: parent.left
            top: parent.top
        }
        radius: 20
        color: _HoverH.hovered ? _Marea.pressed ? "#09f6f6f6" : "#f6f6f6" : "white"
        border.color: "#85ADD8E6"

        AnimatedImage {
            id: _AnimatedImg
            source: "qrc:/img/AddDevice.gif"
            speed: 0.6
            playing: _HoverH.hovered
            scale: 1.15
            smooth: true
            onPlayingChanged: if(!playing) currentFrame = 0
            antialiasing: true
            anchors {
                centerIn: parent
            }
        }

        Text {
            id: innerTxt

            anchors {
                top: _AnimatedImg.bottom
                horizontalCenter: _AnimatedImg.horizontalCenter
                topMargin: 10
            }
            font {
                pixelSize: 15
                family: "Cascadia Code SemiBold"
            }
            text: qsTr("Add Device")
        }

        HoverHandler {
            id: _HoverH
        }
        MouseArea {
            id: _Marea

            anchors.fill: parent
        }
    }

    Rectangle {

        height: 40
        anchors {
            top: _AddDeviceRect.bottom
            left: _AddDeviceRect.left
            right: _AddDeviceRect.right
            topMargin: 5
        }
        color: _HoverHandler.hovered ? _MArea.pressed ? "#10f5f5f5" : "#f6f6f6" : "#fbfbfb"
        radius: 5
        border.color: "#85ADD8E6"

        Text {
            id: _ITxt

            anchors.centerIn: parent
            text: qsTr("View more devices")
            font.pixelSize: 14
            color: "#0e4998"
        }
        HoverHandler {
            id:_HoverHandler

            acceptedDevices: PointerDevice.Mouse
        }
        MouseArea {
            id: _MArea

            anchors.fill: parent
        }
    }
}
