import QtQuick
import QtQuick.Controls
import Qt.labs.platform
import QtQuick.Layouts
import QtQml

import "../js/AccountDetails.js" as AccountDetails
import "../js/SearchBarHandler.js" as SearchBarHandler

Item {
    id: leftItem

    signal indexChanged()

    property alias __CurrentIndex: __CurrentIndextxt.text
    property alias __index: leftBar.currentIndex

    Text {
        id: __CurrentIndextxt
        text: leftBar.currentIndex
        visible: false
    }

    anchors {
        left: parent.left
        top: parent.top
        bottom: parent.bottom
        topMargin: 40
        leftMargin: 15
    }
    width: 305

    Component.onCompleted: {
        SearchBarHandler.create(leftItem)
        var sbar = SearchBarHandler.getSearchBarObj()
        AccountDetails.create(leftItem)
        var adet = AccountDetails.getAccountObj()
        adet.setAnc = sbar.searchText
    }

    ListView {
        id:leftBar

        anchors {
            top: leftItem.top
            left: leftItem.left
            right: leftItem.right
            bottom: leftItem.bottom
            topMargin: 150
            bottomMargin: 15
            rightMargin: 25
        }
        interactive: true
        antialiasing: true
        boundsMovement: Flickable.FollowBoundsBehavior
        boundsBehavior: Flickable.DragOverBounds
        highlightFollowsCurrentItem: true
        highlightRangeMode: ListView.NoHighlightRange
        flickableDirection: Flickable.VerticalFlick
        flickDeceleration: 100
        maximumFlickVelocity: 600
        clip: true
        orientation: ListView.Vertical
        spacing: 5

        onCurrentIndexChanged: indexChanged()

        ScrollIndicator.vertical: ScrollIndicator {
            active: true
            contentItem: Rectangle {
                id: contentRect
                color: "#998a8a8a"
                implicitHeight: 10
                implicitWidth: _HoverHandler.hovered ? 6 : 3
                visible: root.height < 640
                HoverHandler {
                    id: _HoverHandler

                    acceptedDevices: PointerDevice.Mouse
                }
                Behavior on implicitWidth {
                    SpringAnimation {spring: 2; damping: 0.2}
                }
            }
        }

        model: ListViewModels {}
        delegate: ListViewComponents {}


    }
}
