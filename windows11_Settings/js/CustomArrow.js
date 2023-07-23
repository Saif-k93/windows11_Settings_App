var newObject

function create(parent) {
    newObject = Qt.createQmlObject(`

                                   import QtQuick
                                   import QtQuick.Controls

                                   BorderImage {
                                       id: _ArrowImg
                                       source: "qrc:/img/ArrowRight.png"
                                       width: 20; height: 20
                                       border.left: 5; border.top: 5
                                       border.right: 5; border.bottom: 5

                                       anchors {
                                           top: parent.top
                                           right: parent.right
                                           bottom: parent.bottom
                                           topMargin: 20
                                           bottomMargin: 20
                                           rightMargin: 12
                                       }
                                       scale: 0.75
                                   }

                                   `,parent,"myDynamicSnippet")
}

function getArrowObj() {
    return newObject
}
