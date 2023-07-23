import QtQuick
import QtQuick.Controls
import Qt.labs.platform
import QtQuick.Layouts
import QtQml
//////////////////////////////
import "../js/CustomArrow.js" as CustomArrow

Item {
    id: rootHeader

    height: 120
    width: parent.width - 10

    Rectangle {
        id: _NetworkRect

        width: 60
        height: 60
        anchors {
            left: parent.left
            verticalCenter: _Networkico.verticalCenter
            verticalCenterOffset: -10
        }
        radius: 40
        gradient: Gradient {
            GradientStop {position: 0.0; color:
                    "#50fefefe"}
            GradientStop {position: 0.3; color:
                    "#fefefe"}
            GradientStop {position: 1.0; color:
                    "#50fefefe"}
        }

        AnimatedImage {
            id: _AnimatedImg
            source: "qrc:/img/network/Network_Ethernet.gif"
            speed: 0.4
            playing: true
            smooth: true
            onPlayingChanged: if(!playing) currentFrame = 0
            antialiasing: true
            anchors {
                centerIn: parent
            }
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
        id: _Networkico

        width: 100
        height: 100
        anchors {
            left: _NetworkRect.right
            top: parent.top
            leftMargin: 20
        }
        radius: 10
        color: "transparent"
        BorderImage {
            id: _EthImg
            source: "qrc:/img/network/EhternetIco.png"
            width: 100; height: 100
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5
            anchors.fill: parent
        }

        Text {
            id: _EthName
            text: qsTr("Ethernet 1")

            anchors {
                right: _Networkico.left
                bottom: _Networkico.bottom
                rightMargin: 18
                bottomMargin: 10
            }
        }

        AnimatedImage {
            id: animatedImg
            source: "qrc:/img/network/Connected.gif"
            speed: 1
            playing: true
            smooth: true
            scale: 0.3
            onPlayingChanged: if(!playing) currentFrame = 0
            antialiasing: true
            anchors {
                top: _EthName.bottom
                left: _EthName.left
                topMargin: -10
                leftMargin: -22
            }
            Text {
                id: _status
                text: qsTr("Connected")
                anchors {
                    left: parent.right
                    verticalCenter: parent.verticalCenter
                    leftMargin: 20
                }
                font{
                    pixelSize: 40
                }
            }
        }
    }
    Rectangle {
        id: _properties

        width: 130
        height: 50
        anchors {
            left: _Networkico.right
            verticalCenter: _Networkico.verticalCenter
            leftMargin: 25
        }
        radius: 10
        color: ___hover.hovered  ? ___area.pressed ? "#80ADD8E6" : "#eaeaea" : "#f3f3f3"

        BorderImage {
            id: propertiesImg
            source: "qrc:/img/network/Properties.png"
            width: 30; height: 30
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5
            anchors {
                verticalCenter: parent.verticalCenter
            }
            transform: Translate {x: 5}
        }
        Text {
            id: proprtiesTxt
            text: qsTr("Properties")
            anchors {
                top: parent.top
                left: propertiesImg.right
                topMargin: 3
                leftMargin: 12
            }
            font {
                pixelSize: 15
            }
        }
        Text {
            id: proTxt
            text: qsTr("Private network")
            anchors {
                top: proprtiesTxt.bottom
                left: propertiesImg.right
                leftMargin: 12
            }
            font {
                pixelSize: 12
            }
        }

        HoverHandler {
            id: ___hover

            acceptedDevices: PointerDevice.Mouse
        }
        MouseArea {
            id: ___area

            anchors.fill: parent
        }
    }

    Rectangle {
        id: _DataUsage

        width: 190
        height: 60
        anchors {
            left: _properties.right
            verticalCenter: _properties.verticalCenter
            leftMargin: 10
        }
        radius: 10
        color: __hover.hovered  ? __area.pressed ? "#80ADD8E6" : "#eaeaea" : "#f3f3f3"

        Component.onCompleted: {
            CustomArrow.create(_DataUsage)
        }

        BorderImage {
            id: _datausageImg
            source: "qrc:/img/network/DataUsage.png"
            width: 30; height: 30
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5
            anchors {
                verticalCenter: parent.verticalCenter
            }
            transform: Translate {x: 5}
        }
        Text {
            id: _datausageTxt
            text: qsTr("Data Usage")
            anchors {
                top: parent.top
                left: _datausageImg.right
                topMargin: 3
                leftMargin: 12
            }
            font {
                pixelSize: 15
            }
        }
        Text {
            id: _dataTxt
            text: qsTr("55.02 GB, Last 30 Days")
            anchors {
                top: _datausageTxt.bottom
                left: _datausageImg.right
                leftMargin: 12
            }
            font {
                pixelSize: 12
            }
        }

        HoverHandler {
            id: __hover

            acceptedDevices: PointerDevice.Mouse
        }
        MouseArea {
            id: __area

            anchors.fill: parent
        }

    }
}
