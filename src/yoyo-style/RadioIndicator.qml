import QtQuick 2.9
import QtQuick.Controls 2.2
import Youi 1.0 as Youi

Rectangle {
    implicitWidth: Youi.Units.iconSizes.smallMedium -2
    implicitHeight: Youi.Units.iconSizes.smallMedium -2

    property Item control

    radius: width / 2
    color: !control.enabled ? control.Youi.Theme.alternateBackgroundColor
                            : checked ? Youi.Theme.highlightColor : control.Youi.Theme.backgroundColor
    border.color: control.down
        ? control.checked ? "transparent" : control.Youi.Theme.highlightColor
        : control.checked ? control.Youi.Theme.highlightColor : control.Youi.Theme.secondBorderColor

    border.width: 1

    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        scale: control.checked ? 1.0 : 0.0

        color: control.Youi.Theme.highlightColor

        Behavior on scale {
            NumberAnimation {
                duration: 250
                easing.type: Easing.InOutCubic
            }
        }

        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 0.6
            height: width
            radius: width * 0.5
            visible: control.checked
            opacity: visible ? 1.0 : 0.0

            Behavior on opacity {
                NumberAnimation {
                    duration: 250
                    easing.type: Easing.InOutCubic
                }
            }
        }
    }
}