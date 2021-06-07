import QtQuick 2.0
import QtQuick.Controls 2.15

Item{
    Rectangle {
        id: rectangle
        color: "#04115a"
        anchors.fill: parent

        Label {
            id: label
            x: 371
            y: 216
            width: 141
            height: 68
            color: "#ffffff"
            text: qsTr("Setting Page")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 16
        }
    }

}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:800}
}
##^##*/
