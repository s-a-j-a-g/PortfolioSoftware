import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.0
import QtQuick.Timeline 1.0


Window {
    id: splashScreen
    title: qsTr("SplashScreen")
    width: 600
    height: 200
    visible: true
    color: "#00000000"

    //Remove Title Bar
    //flags: Qt.SplashScreen | Qt.FramelessWindowHint

    Rectangle {
        id: bg
        x: 20
        y: 20
        width: 580
        height: 180
        color: "#252527"
        radius: 10
        border.color: "#00000000"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1

        Text {
            id: fullname
            x: 56
            y: 54
            width: 489
            height: 33
            opacity: 1
            visible: true
            color: "#2b4d94"
            text: "Portfolio Management and Financial Indicator Application."
            font.pixelSize: 20
            font.bold: true
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
            minimumPixelSize: 10
            styleColor: "#222222"
            font.family: "Times New Roman"
        }

        Text {
            id: projectwork
            x: 226
            y: 70
            width: 329
            height: 20
            opacity: 0
            visible: true
            color: "#552b94"
            text: "A project work for partial fufillment of COMP 208"
            font.pixelSize: 14
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignBottom
            font.bold: true
            styleColor: "#222222"
            minimumPixelSize: 10
            font.family: "Times New Roman"
        }

        Rectangle {
            id: progressbar
            x: 77
            y: 93
            width: 450
            height: 30
            opacity: 1
            visible: true
            color: "#a4b1c9"
            radius: 15
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: 9
        }

        Rectangle {
            id: progresslevel
            y: 84
            width: 450
            height: 30
            opacity: 1
            visible: true
            color: "#3d254e"
            radius: 15
            anchors.left: progressbar.right
            anchors.leftMargin: -450
        }
    }

    DropShadow{
        anchors.fill: bg
        source: bg
        horizontalOffset: 0
        radius: 10
        color: "#d9e7ff"
    }

    Timeline {
        id: splashScreenTimeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                duration: 1500
                loops: 1
                running: true
                to: 1500
                from: 0
            }
        ]
        endFrame: 1500
        startFrame: 0
        enabled: true

        KeyframeGroup {
            target: fullname
            property: "opacity"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 50
                value: 1
            }
        }

        KeyframeGroup {
            target: projectwork
            property: "x"
            Keyframe {
                frame: 150
                value: 229
            }
        }

        KeyframeGroup {
            target: projectwork
            property: "y"
            Keyframe {
                frame: 150
                value: 145
            }

            Keyframe {
                frame: 75
                value: 70
            }

            Keyframe {
                frame: 0
                value: 144.9999
            }
        }

        KeyframeGroup {
            target: projectwork
            property: "opacity"
            Keyframe {
                frame: 75
                value: 0
            }

            Keyframe {
                frame: 150
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: progressbar
            property: "opacity"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 175
                value: 1
            }
        }

        KeyframeGroup {
            target: progressbar
            property: "width"
            Keyframe {
                frame: 150
                value: 0
            }

            Keyframe {
                frame: 175
                value: 450
            }
        }

        KeyframeGroup {
            target: progresslevel
            property: "width"
            Keyframe {
                frame: 175
                value: 0
            }

            Keyframe {
                frame: 250
                value: 450
            }
        }
    }
}


