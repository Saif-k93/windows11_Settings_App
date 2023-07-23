import QtQuick
import QtQuick.Controls
import Qt.labs.platform
import QtQuick.Layouts
import QtQml

import returncurrentindex.h

Text {
    id: _SystemTxt

    CurrentIndex {id: currentIndex}
    text: currentIndex.getIndex(leftBarHandler.__CurrentIndex)
    anchors {
        left: parent.left
        top: parent.top
        topMargin: 15
        leftMargin: 5
    }
    font {
        pixelSize: 26
        family: "Bahnschrift SemiBold"
    }
    opacity: 0.85
}
