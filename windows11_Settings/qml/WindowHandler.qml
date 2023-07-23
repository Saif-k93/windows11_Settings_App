import QtQuick
import QtQuick.Controls


Item {
    anchors.fill: parent

    DragHandler {
        id: dragHandler

        enabled: dragArea.pressed
        onActiveChanged: if(active) startSystemMove();
    }
    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        enabled: visibility !== 4
        property int edges: 0;
        property int edgeOffest: 5;


        function setEdges(x, y) {
            edges = 0;
            if(x < edgeOffest) edges |= Qt.LeftEdge;
            if(x > (width - edgeOffest))  edges |= Qt.RightEdge;
            if(y < edgeOffest) edges |= Qt.TopEdge;
            if(y > (height - edgeOffest)) edges |= Qt.BottomEdge;
        }

        cursorShape: {
            return !containsMouse ? Qt.ArrowCursor:
                                    edges == 3 || edges == 12 ? Qt.SizeFDiagCursor :
                                                                edges == 5 || edges == 10 ? Qt.SizeBDiagCursor :
                                                                                            edges & 9 ? Qt.SizeVerCursor :
                                                                                                        edges & 6 ? Qt.SizeHorCursor : Qt.ArrowCursor;
        }

        onPositionChanged: setEdges(mouseX, mouseY);
        onPressed: {
            setEdges(mouseX, mouseY);
            if(edges && containsMouse) {
                startSystemResize(edges);
            }
        }
        onClicked: forceActiveFocus()
    }

    MouseArea {
        id:dragArea

        hoverEnabled: true
        anchors {
            top: parent.top
            right: parent.right
            left: parent.left
            leftMargin: 10
            topMargin: 10
            rightMargin: 140
        }
        height: 30
        onClicked: forceActiveFocus()
        onDoubleClicked: {
            if(visibility !== 4){
                showMaximized()

            }else
                showNormal()
        }
    }
}
