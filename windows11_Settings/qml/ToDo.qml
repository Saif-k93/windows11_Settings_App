import QtQuick

Rectangle {
    id: _TODO

    x:20
    width: 500
    height: 250
    color: "red"
    border.color: "black"
    border.width: 10
    radius: 30


    Image {
        id: _TODOimg

        source: "qrc:/img/TO-DO.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }

    SequentialAnimation {
        loops: Animator.Infinite
        running: true

        XAnimator {
            target: _TODO
            from: 20
            to: (rightBarHandler.width - width)
            duration: 1000

        }
        XAnimator {
            target: _TODO
            from: (rightBarHandler.width - width)
            to: 20
            duration: 1000
        }
    }
    SequentialAnimation {
        loops: Animator.Infinite
        running: true

        ParallelAnimation {

            OpacityAnimator {
                target: _TODOimg
                from: 1
                to:0.5
                duration: 2000
            }

            ScaleAnimator {
                target: _TODOimg
                from: 1
                to:0.5
                duration: 2000
            }

        }

        ParallelAnimation {

            OpacityAnimator {
                target: _TODOimg
                from: 0.5
                to:1
                duration: 2000
            }
            ScaleAnimator {
                target: _TODOimg
                from: 0.5
                to:1
                duration: 2000
            }
        }
    }

    SequentialAnimation {
        loops: Animator.Infinite
        running: true

       RotationAnimator {
           target: _TODO
           from: -10
           to: 10
           duration: 1000
       }

       RotationAnimator {
           target: _TODO
           from: 10
           to: -10
           duration: 1000
       }
    }

}
