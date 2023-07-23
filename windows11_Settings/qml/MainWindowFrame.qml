import QtQuick

Rectangle {
    anchors.fill: parent

    color: "#f3f3f3"
    border.color: root.active ? "#9b6cba" : "#bfbfbf"
    border.width: 1
    radius:8
    antialiasing: true
    clip: true
}
