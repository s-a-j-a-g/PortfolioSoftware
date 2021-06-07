import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnLeftMenu
    text: qsTr("Left Menu Text")

    //CUSTOM PROPORTIES
    property url btnIconSource: "../images/home_icon.svg"
    property color btnColorDefault: "#020728"
    property color btnColorMouseOver: "#000000"
    property color btnColorClicked: "#00a1f1"
    property int iconWidth: 18
    property int iconHeight: 18
    property color activeMenuColor: "#55aaff"
    property color activeMenuColorRight: "#04115a"
    property bool isActiveMenu: false

    QtObject{
        id: internal

        // MOUSE OVER AND MOUSE CLICK CHANGE COLOR
        property var dynamicColor: if(btnLeftMenu.down){
                                       btnLeftMenu.down ? btnColorClicked : btnColorDefault
                                   }
                                   else{
                                       btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    implicitWidth: 250
    implicitHeight: 60

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Rectangle{
            anchors{
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
        color: activeMenuColor
        width: 3
        visible: isActiveMenu
        }

        Rectangle{
            anchors{
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
        color: activeMenuColorRight
        width: 5
        visible: isActiveMenu
        }
    }

    contentItem: Item{
        anchors.fill: parent
        id: content

        Image{
            id: iconBtn
            source: btnIconSource
            sourceSize.width: iconHeight
            sourceSize.height: iconWidth
            height: iconHeight
            anchors.left: parent.left
            anchors.leftMargin: 26
            anchors.verticalCenter: parent.verticalCenter
            width: iconWidth
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: true
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#FFFFFF"
            anchors.leftMargin: 26
            anchors.left: parent.left
            antialiasing: true
            width: iconWidth
            height: iconHeight
        }

        Text{
            color: "#ffffff"
            text: btnLeftMenu.text
            font: btnLeftMenu.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
        }
    }
}

/*##^##
Designer {
    D{i:0;height:60;width:250}
}
##^##*/
