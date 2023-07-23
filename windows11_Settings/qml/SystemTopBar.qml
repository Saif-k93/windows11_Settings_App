import QtQuick
import QtQuick.Controls
import Qt.labs.platform
import QtQuick.Layouts
import QtQml

Item {

    height: 155

    Rectangle {
        id: _backgroundImage

        width: 125
        height: 72
        anchors {
            top:parent.top
            left: parent.left
        }
        radius: 8
        border.color: "black"
        border.width: 6

        Image {
            id: _BackGroundImg
            source: "qrc:/img/BackgroundImage.jpg"
            fillMode: Image.PreserveAspectCrop
            anchors {
                fill: parent
                margins: 4
            }
        }
    }
    Text {
        id: _PcNameTxt
        text: qsTr("Saif-PC")
        anchors {
            left: _backgroundImage.right
            top: _backgroundImage.top
            leftMargin: 14
            topMargin: 9
        }
        font {
            pixelSize: 18
            family: "Bahnschrift SemiBold"
        }
    }
    Text {
        id: _SysNameTxt
        text: qsTr("System Product Name")
        anchors {
            left: _backgroundImage.right
            top: _PcNameTxt.bottom
            leftMargin: 14
            topMargin: 5
        }
        font {
            pixelSize: 13
        }
        opacity: 0.9
    }
    Rectangle {

        implicitHeight: _ReNameTxt.implicitHeight
        implicitWidth: _ReNameTxt.implicitWidth
        anchors {
            left: _backgroundImage.right
            top: _SysNameTxt.bottom
            leftMargin: 14
            topMargin: 3
        }
        color: __Hover.hovered ? __Area.pressed ? "#99ffeaea" : "#eaeaea" : "#f3f3f3"
        radius: 10
        Text {
            id: _ReNameTxt

            anchors.fill: parent
            color: __Area.pressed ? "#99003e92" : "#003e92"
            text: qsTr("Rename")
            font {
                pixelSize: 14
            }
            opacity: 0.9
        }
        HoverHandler {
            id: __Hover

            acceptedDevices: PointerDevice.Mouse
        }

        MouseArea {
            id: __Area
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked:  forceActiveFocus()
        }
    }


    Rectangle {
        id: _OfficeRect

        width: 140
        height: 48
        anchors {
            left: parent.left
            top: _backgroundImage.bottom
            topMargin: 9
        }
        color: _HoverHandler.hovered ? _Mouse_Area.pressed ? "#99feaaea" : "#eaeaea" : "#f3f3f3"
        radius: 7

        BorderImage {
            id: _OffImg
            source: "qrc:/img/Microsoft_office.png"
            width: 20; height: 20
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5
            anchors.verticalCenter: parent.verticalCenter
            transform: Translate {x:10}
        }
        Text {
            id: _OfficeTxt

            anchors {
                top: parent.top
                right: parent.right
                topMargin: 10
                rightMargin: 17
            }
            font {
                pixelSize: 13
                family: "Bahnschrift SemiBold"
            }
            scale: 1.08
            text: qsTr("Microsoft 365")

        }
        Text {
            id: _BenefitTxt

            anchors {
                top: _OfficeTxt.bottom
                left: _OfficeTxt.left
                topMargin: 3
            }
            font.pixelSize: 13
            color: "#616161"
            text: qsTr("View benefits")
        }

        HoverHandler {
            id: _HoverHandler

            acceptedDevices: PointerDevice.Mouse
        }
        MouseArea {
            id: _Mouse_Area

            anchors.fill: parent
            hoverEnabled: true
            onEntered: _HoverHandler.enabled = true
            onExited: _HoverHandler.enabled = false
            onReleased: if(_HoverHandler.enabled) Qt.openUrlExternally("https://account.microsoft.com/services?ref=Win11_Settings_HeroControl_Trial")
            onClicked:  forceActiveFocus()
        }
    }

    Rectangle {
        id: _WindowsUpdateRect

        width: 188
        anchors {
            top: _OfficeRect.top
            left: _OfficeRect.right
            bottom: _OfficeRect.bottom
            leftMargin: 5
        }
        color: _HoverHandler2.hovered ? _Mouse_Area2.pressed ? "#99feaaea" : "#eaeaea" : "#f3f3f3"

        radius: 7

        BorderImage {
            id: _WindowsUpdateImg
            source: "qrc:/img/Windows_Update.png"
            width: 20; height: 20
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5
            anchors.verticalCenter: parent.verticalCenter
            transform: Translate {x:10}
        }
        Text {
            id: _WindowsUpdateTxt

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 10
            }
            font {
                pixelSize: 13
                family: "Bahnschrift SemiBold"
            }
            scale: 1.08
            text: qsTr("Windows Update")

        }
        Text {
            id: _WindowsUpdateStatusTxt

            anchors {
                top: _WindowsUpdateTxt.bottom
                left: _WindowsUpdateTxt.left
                topMargin: 3
            }
            font.pixelSize: 12
            color: "#616161"
            text: qsTr("Last checked: 2 hours ago")
        }

        HoverHandler {
            id: _HoverHandler2

            acceptedDevices: PointerDevice.Mouse
        }
        MouseArea {
            id: _Mouse_Area2

            anchors.fill: parent
            hoverEnabled: true
            onEntered: _HoverHandler2.enabled = true
            onExited: _HoverHandler2.enabled = false
            onReleased: if(_HoverHandler2.enabled) Qt.openUrlExternally("ms-settings:windowsupdate?activationSource=SMC-IA-4027667")
            onClicked:  forceActiveFocus()
        }
    }
}
