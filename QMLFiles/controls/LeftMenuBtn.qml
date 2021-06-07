import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnLeftMenu
    text: qsTr("Left Menu Text")


    //CUSTOM PROPORTIES
    property url btnIconSource: "../../images/menu_icon.svg"
    property color btnColorDefault: "#C4C4C4"
    property color btnColorMouseOver: "#9290FC"
    property color btnColorClicked: "#00a1f1"
    property int iconWidth: 35
    property int iconHeight: 35
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

    implicitWidth: 200
    implicitHeight: 60

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Rectangle{
            id: activeDisplay
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
            id: activeDisplayExpanded
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
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            width: iconWidth
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: true
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#000000"
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            width: iconWidth
            height: iconHeight
        }

        Text{
            color: "#000000"
            text: btnLeftMenu.text
            font.pointSize: 12
            //font: btnLeftMenu.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 70
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:3;height:60;width:200}
}
##^##*/
