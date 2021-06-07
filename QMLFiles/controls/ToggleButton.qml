import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnToggle
    //CUSTOM PROPORTIES
    property url btnIconSource: "../images/menu_icon.svg"
    property color btnColorDefault: "#020728"
    property color btnColorMouseOver: "#000000"
    property color btnColorClicked: "#00a1f1"


    QtObject{
        id: internal

        // MOUSE OVER AND MOUSE CLICK CHANGE COLOR
        property var dynamicColor: if(btnToggle.down){
                                       btnToggle.down ? btnColorClicked : btnColorDefault
                                   }
                                   else{
                                       btnToggle.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    implicitWidth: 70
    implicitHeight: 60

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Image{
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 25
            width: 25
            fillMode: Image.PreserveAspectFit
            visible: false
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#FFFFFF"
            antialiasing: false
        }
    }
}
