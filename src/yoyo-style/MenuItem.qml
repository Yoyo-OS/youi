import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12

import Youi 1.0 as Youi

T.MenuItem
{
    id: control

    property color hoveredColor: Youi.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.2)
                                                       : Qt.rgba(0, 0, 0, 0.1)
    property color pressedColor: Youi.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.1)
                                                       : Qt.rgba(0, 0, 0, 0.2)

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    verticalPadding: Youi.Units.smallSpacing
    hoverEnabled: true
    topPadding: Youi.Units.smallSpacing
    bottomPadding: Youi.Units.smallSpacing

    icon.width: Youi.Units.iconSizes.medium
    icon.height: Youi.Units.iconSizes.medium

    icon.color: control.enabled ? (control.highlighted ? control.Youi.Theme.highlightColor : control.Youi.Theme.textColor) :
                             control.Youi.Theme.disabledTextColor

    contentItem: IconLabel {
        readonly property real arrowPadding: control.subMenu && control.arrow ? control.arrow.width + control.spacing : 0
        readonly property real indicatorPadding: control.checkable && control.indicator ? control.indicator.width + control.spacing : 0
        leftPadding: !control.mirrored ? indicatorPadding + Youi.Units.smallSpacing * 2 : arrowPadding
        rightPadding: control.mirrored ? indicatorPadding : arrowPadding + Youi.Units.smallSpacing * 2

        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignLeft

        icon: control.icon
        text: control.text
        font: control.font
        color: control.enabled ? control.pressed || control.hovered ? control.Youi.Theme.textColor : 
               Youi.Theme.textColor : control.Youi.Theme.disabledTextColor
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: control.visible ? Youi.Units.gridUnit + Youi.Units.largeSpacing : 0
        radius: Youi.Theme.mediumRadius
        opacity: 1

        anchors {
            fill: parent
            leftMargin: Youi.Units.smallSpacing
            rightMargin: Youi.Units.smallSpacing
        }

        color: control.pressed || highlighted ? control.pressedColor : control.hovered ? control.hoveredColor : "transparent"
    }
}