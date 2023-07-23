import QtQuick
import QtQuick.Controls
import Qt.labs.platform
import QtQuick.Layouts
import QtQml
//////////////////////
import "../js/ResizeImg.js" as ResizeImg
import "../js/BlueRect.js" as BlueRect
import "../js/CustomArrow.js" as CustomArrow
import "../js/CustomSwitch.js" as CustomSwitch


RowLayout {
    id: _Container

    Layout.alignment: Qt.AlignTop

    width: rightBar.width -10

    Rectangle {
        id: _MainRect

        Layout.fillWidth: true
        height: 60
        radius:7
        color: _RectHover.hovered ? "#f6f6f6" : "#fbfbfb"
        border.color: "#80ADD8E6"
        border.width: 1
        clip: true

        opacity: _RectArea.pressed ? index === 0 || index === 1 || index === 3 ? 1 : 0.65 : 1

        Component.onCompleted:{
            if(index !== 0)CustomArrow.create(_MainRect)
            if(index === 1) BlueRect.create(_MainRect)
            if(index === 0) CustomSwitch.create(_MainRect)
            if(index === 3) {
                BlueRect.create(_MainRect)
                var rectObj = BlueRect.getBlueRectObj()
                rectObj.setText = "Open Phone Link"
                rectObj.width = 120
            }
        }

        BorderImage {
            id: _ImgCtrl

            source: icon
            width: index === 0 ? 12 : index === 5 ? 15 : 20; height: ResizeImg.getRSize(index)
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 20
            }
        }
        Text {
            id: _Title


            anchors {
                left: _ImgCtrl.right
                leftMargin: 20
                verticalCenter: parent.verticalCenter
                verticalCenterOffset: -10
            }
            font {
                pixelSize: 15
                family: "Yu Gothic UI"
            }
            text: title
            opacity: 0.95

            SequentialAnimation {
                running: _RectHover.hovered
                loops: 1

                ScaleAnimator {
                    target: _Title
                    from: 1
                    to: 1.2
                    duration: 600
                }
                ScaleAnimator {
                    target: _Title
                    from: 1.2
                    to: 1
                    duration: 200
                }
            }

        }
        Text {
            id: __Txt

            anchors {
                top: _Title.bottom
                left: _Title.left
            }
            font {
                family: "Yu Gothic UI"
            }

            text: txt

            opacity: 1
            color: "#5e5e5e"
        }
        HoverHandler {
            id: _RectHover

            acceptedDevices: PointerDevice.Mouse
        }
        MouseArea {
            id: _RectArea

            anchors.fill: parent
            onClicked:  forceActiveFocus()
        }
    }
}
