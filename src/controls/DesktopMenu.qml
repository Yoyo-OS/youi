import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import Youi 1.0 as Youi

Youi.MenuPopupWindow {
    id: control

    default property alias content : _mainLayout.data

    Rectangle {
        id: _background
        anchors.fill: parent
        color: Youi.Theme.secondBackgroundColor
        radius: windowHelper.compositing ? Youi.Theme.hugeRadius : 0
        opacity: windowHelper.compositing ? 0.6 : 1
        border.color: _background.borderColor
        border.width: 1 / Youi.Units.devicePixelRatio
        border.pixelAligned: Youi.Units.devicePixelRatio > 1 ? false : true

        property var borderColor: windowHelper.compositing ? Youi.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.3)
                                                                      : Qt.rgba(0, 0, 0, 0.2) : Youi.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.1)
                                                                                                                      : Qt.rgba(0, 0, 0, 0.05)

        Youi.WindowHelper {
            id: windowHelper
        }

        Youi.WindowShadow {
            view: control
            geometry: Qt.rect(control.x, control.y, control.width, control.height)
            radius: _background.radius
        }

        Youi.WindowBlur {
            view: control
            geometry: Qt.rect(control.x, control.y, control.width, control.height)
            windowRadius: _background.radius
            enabled: true
        }
    }

    ColumnLayout {
        id: _mainLayout
        anchors.fill: parent
        anchors.topMargin: 4
        anchors.bottomMargin: 4
    }

    function open() {
        control.show()
    }

    function popup() {
        control.show()
    }
}