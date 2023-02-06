import QtQuick 2.12
import QtQuick.Window 2.3
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Shapes 1.12
import QtGraphicalEffects 1.0
import Youi 1.0 as Youi

Youi.Window {
    id: control
    width: 640
    height: 480
    visible: true
    flags: Qt.FramelessWindowHint
    color: "transparent"
    background.opacity: Youi.Theme.darkMode ? 0.7 : 0.5
    contentTopMargin: 0

    property Item sideBarItem
    property Item contentItem
    property Item sideBarHeaderItem
    property Item contentHeaderItem
    property int sideBarWidth: 200

    headerItem: Item {
        id: _headerItem
        RowLayout{
            spacing: 0
            Item {
                id: _sideBarHeader
                Layout.fillHeight: true
                width: sideBarWidth
            }
            Item {
                id: _contentHeader
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }

    onContentHeaderItemChanged: {
        if (contentHeaderItem) {
            contentHeaderItem.parent = _contentHeader
            contentHeaderItem.anchors.fill = _contentHeader
        }
    }

    onSideBarHeaderItemChanged: {
        if (sideBarHeaderItem) {
            sideBarHeaderItem.parent = _sideBarHeader
            sideBarHeaderItem.anchors.fill = _sideBarHeader
        }
    }

    onSideBarItemChanged: {
        if (sideBarItem) {
            sideBarItem.parent = _sideBar
            sideBarItem.anchors.fill = _sideBar
        }
    }

    onContentItemChanged: {
        if (contentItem) {
            contentItem.parent = _content
            contentItem.anchors.fill = _content
        }
    }

    Youi.WindowBlur {
        view: control
        geometry: Qt.rect(control.x, control.y, control.width, control.height)
        windowRadius: control.windowRadius
        enabled: true
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0
        Item {
            id: _sideBar
            Layout.fillHeight: true
            width: sideBarWidth
            Rectangle {
                anchors.fill: parent
                color: Youi.Theme.darkMode ? Qt.lighter(Youi.Theme.backgroundColor, 1.5)
                                             : Qt.darker(Youi.Theme.backgroundColor, 1.05)
                opacity: control.compositing ? 0.7 : 1.0

                Behavior on color {
                    ColorAnimation {
                        duration: 250
                        easing.type: Easing.Linear
                    }
                }
            }
        }

        Item {
            id: _content
            Layout.fillHeight: true
            Layout.fillWidth: true
            Rectangle {
                anchors.fill: parent
                color: Youi.Theme.backgroundColor
                opacity: control.compositing ? 0.7 : 1.0

                Behavior on color {
                    ColorAnimation {
                        duration: 250
                        easing.type: Easing.Linear
                    }
                }
            }
        }
    }
}
