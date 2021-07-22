import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtCharts 2.15
import "controls"

Window {
    id: mainWindow
    title: qsTr("Portfolio Management and Financial Indicator Application")
    width: 1000
    height: 580
    minimumWidth: 800
    minimumHeight: 500
    color: "#00000000"
    visible: true

    //Remove Title Bar
    flags: Qt.Window | Qt.FramelessWindowHint

    //Properties
        property int windowMargin: 10
        property int windowStatus: 0

    //Internal Functions
    QtObject{
        id: internal

        function maximizeRestore(){
            if(windowStatus == 0){
                mainWindow.showMaximized()
                windowStatus = 1
                windowMargin = 0

            }
            else{
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
            }
        }

        function ifMaximizedWindowRestore(){ //Drag handler - return to its original state when drag handler is moved
           if(windowStatus == 1){
               mainWindow.showNormal()
               windowStatus = 0
               windowMargin = 10
           }
       }

        function restoreMargins()
        {
            windowsStatus = 0
            windowMargin = 10
        }

        function retainMaximizedState() //if the window is in maximized(restored up) then minmized in this state then if we open this window it returns to original state rather than being in maximized statee
        {

        }
    }

    Rectangle {
        id: background
        color: "#ffffff"
        border.width: 1
        border.color: "#777777"
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        //windowMargin = 10
        anchors.topMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.rightMargin: windowMargin
        z: 1

        Rectangle {
            id: topBar
            height: 35
            color: "#777777"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0

            Rectangle {
                id: titleBar
                height: 35
                color: "#00000000"
                anchors.right: rowBtns.left
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0

                DragHandler{
                    onActiveChanged: if(active){
                                         mainWindow.startSystemMove()
                                         internal.ifMaximizedWindowRestore()
                                     }
                }

                Image {
                    id: iconApp
                    width: 35
                    height: 35
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 4
                    fillMode: Image.PreserveAspectFit
                    source: "../images/icon.png"
                }

                Label {
                    id: label
                    color: "#000000"
                    text: qsTr("Portfolio Management and Financial Indicator Application")
                    font.family: "Arial"
                    anchors.right: parent.right
                    anchors.rightMargin: 159
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    anchors.left: iconApp.right
                    anchors.leftMargin: 5
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.top: parent.top
                    anchors.topMargin: 0
                }
            }

            Row {
                id: rowBtns
                x: 879
                width: 105
                height: 35
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0


                TopBarButton {
                    id: btnMinimize
                    width: 35
                    height: 35
                    onClicked:{
                        mainWindow.showMinimized()
                        internal.restoreMargins()
                    }
                }

                TopBarButton {
                    id: btnMaximizeRestore
                    width: 35
                    height: 35
                    btnIconSource: "../images/button_max.png"
                    onClicked: internal.maximizeRestore()
                }

                TopBarButton {
                    id: btnClose
                    width: 35
                    height: 35
                    btnIconSource: "../images/button_exit.png"
                    onClicked: mainWindow.close()
                }
            }

        }

        Rectangle {
            id: content
            color: "#00000000"
            anchors.top: topBar.bottom
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.topMargin: 0

            Rectangle {
                id: leftMenu
                width: 70
                color: "#C4C4C4"
                clip: true
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0

                PropertyAnimation{
                    id: animationMenu
                    target: leftMenu
                    property: "width"
                    to: if(leftMenu.width == 70) return 200; else return 70
                    duration: 200
                    easing.type: easing.InOutQuint //try InOutBounce or OutBounce
                }

                Column {
                    id: columnMenus
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 90
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    clip: true

                    LeftMenuBtn {
                        id: btnToggle
                        width: leftMenu.width
                        text: qsTr("")
                        onClicked: animationMenu.running = true
                    }

                    LeftMenuBtn {
                        id: btnDashboard
                        width: leftMenu.width
                        text: qsTr("Dashboard")
                        btnIconSource: "../images/dashboard_icon.png"
                        isActiveMenu: true
                        onClicked: {
                            btnDashboard.isActiveMenu = true
                            btnPortfolio.isActiveMenu = false
                            btnCalculator.isActiveMenu = false
                            btnGraph.isActiveMenu = false
                            btnSettings.isActiveMenu = false
                            //stackView.push(Qt.resolvedUrl("pages/homePage.qml"))
                        }
                    }

                    LeftMenuBtn {
                        id: btnPortfolio
                        width: leftMenu.width
                        text: qsTr("Portfolio")
                        btnIconSource: "../images/portfolio_icon.png"
                        isActiveMenu: false
                        onClicked: {
                            btnPortfolio.isActiveMenu = true
                            btnDashboard.isActiveMenu = false
                            btnCalculator.isActiveMenu = false
                            btnGraph.isActiveMenu = false
                            btnSettings.isActiveMenu = false
                            //stackView.push(Qt.resolvedUrl("pages/homePage.qml"))
                        }
                    }

                    LeftMenuBtn {
                        id: btnCalculator
                        width: leftMenu.width
                        text: qsTr("Calculator")
                        btnIconSource: "../images/calculator_icon.png"
                        isActiveMenu: false
                        onClicked: {
                            btnCalculator.isActiveMenu = true
                            btnDashboard.isActiveMenu = false
                            btnPortfolio.isActiveMenu = false
                            btnGraph.isActiveMenu = false
                            btnSettings.isActiveMenu = false
                            //stackView.push(Qt.resolvedUrl("pages/homePage.qml"))
                        }
                    }

                    LeftMenuBtn {
                        id: btnGraph
                        width: leftMenu.width
                        text: qsTr("Graph")
                        btnIconSource: "../images/graph_icon.png"
                        isActiveMenu: false
                        onClicked: {
                            btnGraph.isActiveMenu = true
                            btnDashboard.isActiveMenu = false
                            btnPortfolio.isActiveMenu = false
                            btnCalculator.isActiveMenu = false
                            btnSettings.isActiveMenu = false
                        }
                    }
                }

                LeftMenuBtn {
                    id: btnSettings
                    width: leftMenu.width
                    text: qsTr("Settings")
                    btnIconSource: "../images/settings_icon.png"
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 25
                    isActiveMenu: false
                    onClicked: {
                        btnSettings.isActiveMenu = true
                        btnDashboard.isActiveMenu = false
                        btnPortfolio.isActiveMenu = false
                        btnCalculator.isActiveMenu = false
                        btnGraph.isActiveMenu = false
                        stackView.push(Qt.resolvedUrl("pages/settingsPage.qml"))
                    }
                }
            }

            Rectangle {
                id: contentPages
                color: "#000000"
                clip: true
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: leftMenu.right
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 25
                anchors.top: parent.top
                anchors.topMargin: 0

                StackView {
                    id: stackView
                    anchors.fill: parent
                    //initialItem: Qt.resolvedUrl("pages/homePage.qml")
                }
            }

            Rectangle {
                id: footer
                color: "#777777"
                anchors.top: contentPages.bottom
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: leftMenu.right
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0

                MouseArea {
                    id: resizeWindow
                    width: 25
                    height: 25
                    //opacity: 0.5
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    cursorShape: Qt.SizeFDiagCursor

                    DragHandler{
                        target: null
                        onActiveChanged: if (active){
                                             mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                         }
                    }

                    Image {
                        id: resizeImage
                        width: 16
                        height: 16
                        anchors.fill: parent
                        source: "../images/resize_icon.svg"
                        anchors.leftMargin: 5
                        anchors.topMargin: 5
                        sourceSize.height: 16
                        sourceSize.width: 16
                        fillMode: Image.PreserveAspectFit
                        antialiasing: false
                    }
                }
            }

        }
    }

    DropShadow{
        anchors.fill: background
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color:"#80000000"
        source: background
        z: 0
    }


}





/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
