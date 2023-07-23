import QtQuick
import QtQuick.Controls
import Qt.labs.platform
import QtQuick.Layouts
import QtQml
/////////////////////////////////////////////
import "qml"
import "js/TitleBarHandler.js" as TitleBarHandler

Window {
    id: root

    visible: true
    width: 900
    height: 580
    minimumHeight: 350
    minimumWidth: 610
    color: "transparent"
    flags: Qt.Window | Qt.FramelessWindowHint

    property bool drowerHasOpened: false

    MainWindowFrame {
        id: mainWindowFrame

        Component.onCompleted: {
            TitleBarHandler.create(root)
        }
    }

    WindowHandler {
        id:windowHandler

    }

    onVisibilityChanged: {
        var TitleBar = TitleBarHandler.getTitleBarObj()
        if(root.visibility === 4) TitleBar.maximizeImage.source = "qrc:/img/Restore.png"
        else
            TitleBar.maximizeImage.source = "qrc:/img/Maximize.png"
    }


    LeftBarHandler {
        id: leftBarHandler

        visible: root.width >= 885 ? true : false

        Timer {
            id: timer

            interval: 200
            repeat: false
            onTriggered: rightBarHandler.__RightBar.snapMode = ListView.NoSnap
        }
        onIndexChanged: {
            rightBarHandler.__RightBar.snapMode = ListView.SnapToItem
            timer.start()
            if(drowerHasOpened) subLeftBarHandler.__index = __index
            drawer.close()

        }
    }


    RightBarHandler {
        id: rightBarHandler

        anchors.left: _LeftSpacer.right
    }

    Item {
        id: _LeftSpacer

        anchors {
            left: root.width >= 885 ? leftBarHandler.right : parent.left
            top: parent.top
            bottom: parent.bottom
        }
        width: root.width >= 885 ? root.width >= 1300 ? 70 : 1 : 20
    }

    Rectangle {
        id: _DrawerController

        width: 30
        height: 30
        color: _Hoverhandler.hovered ? _area.pressed ? "#f9c7ed" : "#f6f6f6" : "#fbfbfb"
        radius: 5
        transform: Translate {x: 120; y:5}
        visible: root.width >= 885 ? false : true
        BorderImage {
            id: _ListImg
            source: "qrc:/img/DrawerList.png"
            width: 20; height: 20
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5
            anchors.centerIn: parent
        }

        HoverHandler {
            id: _Hoverhandler

            acceptedDevices: PointerDevice.Mouse
        }
        MouseArea {
            id: _area

            anchors.fill: parent
            onReleased: {
                drawer.open()
                drowerHasOpened = true
            }
        }
    }

    Drawer {
        id: drawer

        width: leftBarHandler.width
        height: root.height
        clip: true

        onOpened: subLeftBarHandler.__index = leftBarHandler.__index

        Rectangle {
            id: _DrawerFrame

            LeftBarHandler {
                id: subLeftBarHandler
                onIndexChanged: {
                    leftBarHandler.__index = __index
                }
            }

            anchors.fill: parent
            border.color: "lightblue"
            border.width: 2
            color: "#f3f3f3"
            clip: true

        }
    }


}


