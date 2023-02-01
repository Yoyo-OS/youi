import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

import Youi 1.0 as Youi

Item {
    id: control

    property real radius: Youi.Theme.smallRadius
    property var color: Youi.Theme.backgroundColor
    property bool borderEnabled: true

    property bool animationEnabled: true
    property alias backgroundOpacity: _background.opacity

    Rectangle {
        id: _background
        anchors.fill: parent
        color: control.color
        radius: control.radius
        antialiasing: true
        smooth: true

        Behavior on color {
            ColorAnimation {
                duration: control.animationEnabled ? 200 : 0
                easing.type: Easing.Linear
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        radius: _background.radius
        border.width: 1 / Youi.Theme.devicePixelRatio
        border.pixelAligned: Youi.Theme.devicePixelRatio > 1 ? false : true
        border.color: Youi.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.1) : Qt.rgba(0, 0, 0, 0.1)
        visible: control.borderEnabled
        antialiasing: true
    }
}