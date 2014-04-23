import QtQuick 2.1
import QtQuick.Window 2.1

Window {
    id: page
    visible: true
    width: 360
    height: 360
    color: "#00ffff"
//    color: "#343434"

    Image {
        id: icon
        x: 10
        y: 20
        source: "qtcreator.png"
    }

    Rectangle {
        id: topLeftRect
        width: 64
        height: 64
        radius: 20
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 20
        border.width: 3
        border.color: "#ff0000"
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#ffffff"
            }

            GradientStop {
                position: 0.113
                color: "#ffffff"
            }

            GradientStop {
                position: 0.328
                color: "#000000"
            }

            GradientStop {
                position: 0.523
                color: "#000000"
            }

            GradientStop {
                position: 0.699
                color: "#000000"
            }

            GradientStop {
                position: 0.798
                color: "#000000"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }





        }
        opacity: 0.4

        MouseArea {
            anchors.fill: parent
            onClicked: stateGroup.state = ' '
//            onClicked: {
//                Qt.quit();
//            }
        }
    }

    Rectangle {
        id: middleRightRect
        x: 276
        y: 148
        width: 64
        height: 64
        color: "#0000ff"
        radius: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20
        border.width: 1
        border.color: "#ff0000"
        opacity: 1
        MouseArea {
            anchors.fill: parent
            onClicked: stateGroup.state = 'State1'
        }
    }

    Rectangle {
        id: bottomLeftRect
        y: 7
        width: 64
        height: 64
        radius: 20
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        border.width: 3
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#ffffff"
            }

            GradientStop {
                position: 0.113
                color: "#ffffff"
            }

            GradientStop {
                position: 0.328
                color: "#000000"
            }

            GradientStop {
                position: 0.523
                color: "#000000"
            }

            GradientStop {
                position: 0.699
                color: "#000000"
            }

            GradientStop {
                position: 0.798
                color: "#000000"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
        }
        border.color: "#ff0000"
        opacity: 0.4
        MouseArea {
            anchors.fill: parent
            onClicked: stateGroup.state = 'State2'
        }

    }//Rectangle

    StateGroup {
            id: stateGroup
            states: [
                State {
                    name: "State1"

                    PropertyChanges {
                        target: icon
                        x: middleRightRect.x
                        y: middleRightRect.y
                    }
                },
                State {
                                name: "State2"

                                PropertyChanges {
                                    target: icon
                                    x: bottomLeftRect.x
                                    y: bottomLeftRect.y
                                }

                }

            ]//states:

            transitions: [
                            Transition {
                                    from: "*"; to: "State1"
                                    NumberAnimation {
                                        easing.type: Easing.OutBounce
                                        properties: "x,y";
                                        duration: 1000
                                    }
                                },
                            Transition {
                                    from: "*"; to: "State2"
                                    NumberAnimation {
                                        properties: "x,y";
                                        easing.type: Easing.InOutQuad;
                                        duration: 2000
                                    }
                                },
                            Transition {
                                     NumberAnimation {
                                         properties: "x,y";
                                         duration: 100
                                     }
                                 }
            ]//transitions:

    }//StateGroup

}//Window
