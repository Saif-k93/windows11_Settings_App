import QtQuick
import QtQuick.Controls
import Qt.labs.platform
import QtQuick.Layouts
import QtQml
/////////////////////////////////////////////
import returncurrentindex.h


Item {
    id: rightItem

    property alias __RightBar: rightBar
    anchors {
        top: parent.top
        bottom: parent.bottom
        right: parent.right
        topMargin: 40
        rightMargin: root.width > 1300 ? 150 : 5
    }

    clip: true

    CurrentIndex {id: currentIndex}

    SettingsTitle {
        id: settingsTitle
    }

    ////// <<<<< MODELS >>>>> ///////
    RListViewModels {
        id: rListViewModels

    }
    DevicesModels {
        id: devicesModels

    }
    NetworkModels {
        id: networkModels

    }

    ////// <<<<< MODELS >>>>> ///////

    ListView {
        id:rightBar
        keyNavigationWraps: false

        anchors {
            top: rightItem.top
            left: rightItem.left
            right: rightItem.right
            bottom: rightItem.bottom
            topMargin: 80
            bottomMargin: 15
            rightMargin: -2
        }

        interactive: true
        antialiasing: true
        boundsMovement: Flickable.FollowBoundsBehavior
        boundsBehavior: Flickable.DragOverBounds
        highlightFollowsCurrentItem: true
        highlightRangeMode: ListView.NoHighlightRange
        flickableDirection: Flickable.VerticalFlick
        flickDeceleration: 100
        maximumFlickVelocity: 1000
        clip: true
        orientation: ListView.Vertical
        spacing: 5

        ScrollIndicator.vertical: ScrollIndicator {
            active: true
            contentItem: Rectangle {
                id: contentRect
                color: "#998a8a8a"
                implicitHeight: 10
                implicitWidth: _HoverHandler.hovered ? 6 : 3


                HoverHandler {
                    id: _HoverHandler

                    acceptedDevices: PointerDevice.Mouse
                }
                Behavior on implicitWidth {
                    SpringAnimation {spring: 2; damping: 0.2}
                }
            }
        }

        ////////////////////////// <<<<<<<<< HEADERS/MODELS/COMPONENTS >>>>>>>>>>  //////////////////////////////
        model: {
            switch (currentIndex.getIndex(leftBarHandler.__CurrentIndex)){
            case "System":
                return  rListViewModels

            case "Bluetooth & devices":
                return devicesModels

            case "Network & internet":
                return networkModels

            default:
                return 1
            }
        }

        delegate: Component {
            Loader {
                source: {
                    switch (currentIndex.getIndex(leftBarHandler.__CurrentIndex)){
                    case "System":
                        return  "RListViewComponents.qml"

                    case "Bluetooth & devices":
                        return "DevicesComponents.qml"

                    case "Network & internet":
                        return "NetworkComponents.qml"

                    default:
                        return "ToDo.qml"
                    }
                }
            }
        }

        header: Component {
            Loader {
                source: {
                    switch (currentIndex.getIndex(leftBarHandler.__CurrentIndex)){
                    case "System":
                        return  "SystemTopBar.qml"

                    case "Bluetooth & devices":
                        return "DevicesTopBar.qml"

                    case "Network & internet":
                        return "NetworkTopBar.qml"

                    default:
                        return ""
                    }
                }

            }
        }
        ////////////////////////// <<<<<<<<< HEADERS/MODELS/COMPONENTS >>>>>>>>>>  //////////////////////////////


    }

}
