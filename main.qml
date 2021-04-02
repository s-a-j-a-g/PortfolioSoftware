import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true
    color: "green"

    Text {
        text: "Hello World"
        anchors.centerIn: parent
    }
}
