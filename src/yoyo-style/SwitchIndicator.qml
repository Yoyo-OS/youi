import QtQuick 2.4
import Youi 1.0 as Youi

Item {
    id: indicator
    implicitWidth: Youi.Units.iconSizes.medium +6
    implicitHeight: Youi.Units.iconSizes.smallMedium -2

    property Item control
    property alias handle: handle
    property color bgColor : control.checked ? Youi.Theme.highlightColor : Qt.rgba(Youi.Theme.textColor.r, 
                                                                                     Youi.Theme.textColor.g,
                                                                                     Youi.Theme.textColor.b, 0.2)
    Rectangle {
        anchors.fill: parent
        width: parent.width
        height: parent.height
        radius: height / 2
        y: parent.height / 2 - height / 2
        color: control.enabled ? bgColor : "transparent"
        Behavior on color {
            ColorAnimation {
                duration: 125
                easing.type: Easing.InOutCubic
            }
        }
    }

    Rectangle {
        id: handle
        x: Math.max(2, Math.min(parent.width - width, control.visualPosition * parent.width - (width / 2)) - 4)
        y: (parent.height - height) / 2
        width: parent.height * 0.6
        height: width
        radius: width / 2
        color: control.enabled ? "white" : "transparent"
        scale: control.pressed ? 0.8 : 1

        Behavior on scale {
            NumberAnimation {
                duration: 100
            }
        }

        Behavior on x {
            enabled: !control.pressed

            NumberAnimation {
                duration: 250
                easing.type: Easing.OutSine
            }
        }
    }
}