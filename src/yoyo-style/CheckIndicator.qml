import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12

import Youi 1.0 as Youi

Rectangle {
    id: indicatorItem
    implicitWidth: Youi.Units.iconSizes.smallMedium -2
    implicitHeight: Youi.Units.iconSizes.smallMedium -2

    color: !control.enabled ? control.Youi.Theme.alternateBackgroundColor
                            : checked ? Youi.Theme.highlightColor : control.Youi.Theme.backgroundColor
    border.color: !control.enabled ? control.Youi.Theme.disabledTextColor
        : checked ? control.Youi.Theme.highlightColor: control.Youi.Theme.secondBorderColor
    border.width: 1
    radius: control.autoExclusive ? Math.min(height, width) : 4

    property Item control
    property bool checked : control.checked

    Behavior on border.width {
        NumberAnimation {
            duration: 100
            easing.type: Easing.InOutCubic
        }
    }

    Behavior on border.color {
        ColorAnimation {
            duration: 100
            easing.type: Easing.InOutCubic
        }
    }   
    Label{
        id: checkImage
        width: parent.height * 0.7
        height: parent.height * 0.7
        anchors.centerIn: parent
        font.family: control.Youi.Theme.iconsFontFamily
        color: "#FFFFFF"
        font.pixelSize: width
        antialiasing: false
        smooth: false
        text: "\uf294"
        scale: checked ? 1 : 0
        Behavior on scale {
            NumberAnimation {
                duration: 100
                easing.type: Easing.InOutCubic
            }
        }
    }

    transitions: Transition {
        SequentialAnimation {
            NumberAnimation {
                target: indicatorItem
                property: "scale"
                // Go down 2 pixels in size.
                to: 1 - 2 / indicatorItem.width
                duration: 120
            }
            NumberAnimation {
                target: indicatorItem
                property: "scale"
                to: 1
                duration: 120
            }
        }
    }
}
