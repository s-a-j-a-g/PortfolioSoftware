import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "controls"


Window {
    id: mainwindow
    title: qsTr("Portfolio Software")
    width: 1000
    height: 580
    minimumWidth: 800
    minimumHeight: 500
    color: "#00000000"
    visible: true

    //Remove Title Bar
    flags: Qt.Window | Qt.FramelessWindowHint

    //Properties
    property int windowStatus: 0
    property int windowMargin: 10
    

    //Internal Functions
    QtObject{
        id: internal

        //Resize Visibility
        function resetResizeBorders(){
            resizeLeft.visible = true
            resizeRight.visible = true
            resizeBottom.visible = true
            reSizeWindow.visible = true
        }

        function maximizeRestore(){
            if(windowStatus == 0){
                mainwindow.showMaximized()
                windowStatus = 1
                windowMargin = 0
                //Resize Visibility
                resizeLeft.visible = false
                resizeRight.visible = false
                resizeBottom.visible = false
                reSizeWindow.visible = false
                btnMaximizeRestore.btnIconSource = "../images/restore_icon.svg"
            }
            else{
                mainwindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                internal.resetResizeBorders() //Resize Visibility
                btnMaximizeRestore.btnIconSource = "../images/maximize_icon.svg"
            }
        }

        function ifMaximizedWindowRestore(){ //Drag handler
            if(windowStatus == 1){
                mainwindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                internal.resetResizeBorders() //Resize Visibility
                btnMaximizeRestore.btnIconSource = "../images/maximize_icon.svg"
            }
        }

        function restoreMargins() //maximized(restored up) then minmized
        {
            windowsStatus = 0
            windowMargin = 10
            internal.resetResizeBorders() //Resize Visibility
            btnMaximizeRestore.btnIconSource = "../images/maximize_icon.svg"
        }
    }

    Rectangle {
        id: background
        color: "#04115a"
        border.width: 1
        border.color: "#05146a"
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
            id: appContainer
            color: "#00000000"
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1
            anchors.fill: parent

            Rectangle {
                id: topBar
                height: 60
                color: "#020728"
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0

                //                Button {
                //                    id: toggleBtn
                //                    width: 70
                //                    height: 60
                //                    text: qsTr("Toggle")
                //                    anchors.left: parent.left
                //                    anchors.leftMargin: 0
                //                    anchors.top: parent.top
                //                    anchors.topMargin: 0
                //                }

                ToggleButton{
                    onClicked: animationMenu.running = true
                }

                Rectangle {
                    id: topBarDescription
                    y: 16
                    height: 25
                    color: "#030e47"
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 70
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0

                    Label {
                        id: labelTopInfo
                        color: "#e5e8eb"
                        text: qsTr("Description")
                        verticalAlignment: Text.AlignVCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 300
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 0
                    }

                    Label {
                        id: labelRightInfo
                        color: "#e5e8eb"
                        text: qsTr("Description")
                        horizontalAlignment: Text.AlignRight
                        anchors.top: parent.top
                        anchors.left: labelTopInfo.right
                        anchors.right: parent.right
                        anchors.topMargin: 0
                        anchors.rightMargin: 10
                        anchors.leftMargin: 0
                        verticalAlignment: Text.AlignVCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                    }
                }

                Rectangle {
                    id: titleBar
                    height: 35
                    color: "#00000000"
                    anchors.right: parent.right
                    anchors.rightMargin: 105
                    anchors.left: parent.left
                    anchors.leftMargin: 70
                    anchors.top: parent.top
                    anchors.topMargin: 0

                    DragHandler{
                        onActiveChanged: if(active){
                                             mainwindow.startSystemMove()
                                             internal.ifMaximizedWindowRestore()
                                         }
                    }

                    Image {
                        id: iconApp
                        width: 22
                        height: 22
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 4
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                        source: "../images/icon_app_top.svg"
                    }

                    Label {
                        id: label
                        color: "#ffffff"
                        text: qsTr("Portfolio Software")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.pointSize: 14
                        anchors.left: iconApp.right
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.top: parent.top
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: rowBtns
                    x: 890
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.top: parent.top
                    anchors.topMargin: 0

                    TopBarButton {
                        id: btnMinimize
                        width: 35
                        height: 35
                        onClicked:{
                            mainwindow.showMinimized()
                            internal.restoreMargins()
                        }
                    }

                    TopBarButton {
                        id: btnMaximizeRestore
                        width: 35
                        height: 35
                        btnIconSource: "../images/maximize_icon.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    TopBarButton {
                        id: btnClose
                        width: 35
                        height: 35
                        btnColorClicked: "#b0109b"
                        btnIconSource: "../images/close_icon.svg"
                        onClicked: mainwindow.close()
                    }

                    //                    Button {
                    //                        id: btnMinimize
                    //                        width: 35
                    //                        height: 35
                    //                        text: qsTr("Button")
                    //                    }
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
                    color: "#020728"
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
                        to: if(leftMenu.width == 70) return 250; else return 70
                        duration: 500
                        easing.type: easing.InOutQuint //try InOutBounce or OutBounce
                    }

                    Column {
                        id: columnMenus
                        width: 70
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 90
                        anchors.top: parent.top
                        anchors.topMargin: 0

                        LeftMenuBtn {
                            id: btnHome
                            y: 60
                            width: 250
                            height: 60
                            text: qsTr("Home")
                            isActiveMenu: true
                            onClicked: {
                                btnHome.isActiveMenu = true
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/homePage.qml"))
                                //pagesView.setSource(Qt.resolvedUrl("pages/homePage.qml"))
                            }
                        }

                        LeftMenuBtn {
                            id: btnOpen
                            y: 60
                            width: 250
                            height: 60
                            text: qsTr("Open")
                            btnIconSource: "../images/open_icon.svg"
                        }

                        LeftMenuBtn {
                            id: btnSave
                            y: 60
                            width: 250
                            height: 60
                            text: qsTr("Save")
                            btnIconSource: "../images/save_icon.svg"
                        }
                    }

                    LeftMenuBtn {
                        id: btnSettings
                        y: 60
                        width: 250
                        height: 60
                        text: qsTr("Settings")
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 25
                        isActiveMenu: true
                        onClicked: {
                            btnHome.isActiveMenu = false
                            btnSettings.isActiveMenu = true
                            stackView.push(Qt.resolvedUrl("pages/settingsPage.qml"))
                            //pagesView.setSource(Qt.resolvedUrl("pages/settingsPage.qml"))
                        }
                    }
                }


                Rectangle {
                    id: contentPages
                    color: "#04115a"
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
                        initialItem: Qt.resolvedUrl("pages/homePage.qml")
                    }

//                    Loader{
//                        id: pageHome
//                        anchors.fill: parent
//                        source: Qt.resolvedUrl("pages/homePage.qml")
//                        visible: true
//                    }

//                    Loader{
//                        id: pageSettings
//                        anchors.fill: parent
//                        source: Qt.resolvedUrl("pages/settingsPage.qml")
//                        visible: false
//                    }
                }

                Rectangle {
                    id: rectangle
                    color: "#030e47"
                    anchors.top: contentPages.bottom
                    anchors.topMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: leftMenu.right
                    anchors.leftMargin: 0
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0

                    Label {
                        id: labelTopInfo1
                        color: "#e5e8eb"
                        text: qsTr("Description")
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.topMargin: 0
                        anchors.rightMargin: 30
                        anchors.leftMargin: 10
                        verticalAlignment: Text.AlignVCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                    }

                    MouseArea {
                        id: reSizeWindow
                        x: 884
                        y: 0
                        width: 25
                        height: 25
                        opacity: 0.5
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        cursorShape: Qt.SizeFDiagCursor

                        DragHandler{
                            target: null
                            onActiveChanged: if(active){
                                                 mainwindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                             }
                        }

                        Image {
                            id: resizeimage
                            width: 16
                            height: 16
                            anchors.leftMargin: 5
                            anchors.bottomMargin: 0
                            anchors.topMargin: 5
                            anchors.fill: parent
                            sourceSize.height: 16
                            sourceSize.width: 16
                            fillMode: Image.PreserveAspectFit
                            source: "../images/resize_icon.svg"
                            antialiasing: false
                        }
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

    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 mainwindow.startSystemResize(Qt.LeftEdge)
                             }
        }
    }

    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 mainwindow.startSystemResize(Qt.RightEdge)
                             }
        }
    }

    MouseArea {
        id: resizeBottom
        height: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeVerCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 mainwindow.startSystemResize(Qt.BottomEdge)
                             }
        }



    }




}





/*##^##
Designer {
    D{i:0;formeditorZoom:0.8999999761581421}D{i:31;anchors_height:16;anchors_width:16;anchors_x:"-32";anchors_y:"-7"}
}
##^##*/
