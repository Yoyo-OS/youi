import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import Youi 1.0 as Youi
import QtQuick.Controls.impl 2.12

T.Button {
    id: control
    implicitWidth: Math.max(background.implicitWidth, contentItem.implicitWidth + Youi.Units.largeSpacing)
    implicitHeight: background.implicitHeight
    hoverEnabled: true

    icon.width: Youi.Units.iconSizes.small
    icon.height: Youi.Units.iconSizes.small

    icon.color: control.enabled ? (control.highlighted ? control.Youi.Theme.highlightColor : control.Youi.Theme.textColor) : control.Youi.Theme.disabledTextColor
    spacing: Youi.Units.smallSpacing

    property color hoveredColor: Youi.Theme.darkMode ? Qt.lighter(Youi.Theme.alternateBackgroundColor, 1.2)
                                                       : Qt.darker(Youi.Theme.alternateBackgroundColor, 1.1)

    property color pressedColor: Youi.Theme.darkMode ? Qt.lighter(Youi.Theme.alternateBackgroundColor, 1.1)
                                                       : Qt.darker(Youi.Theme.alternateBackgroundColor, 1.2)

    property color borderColor: Qt.rgba(Youi.Theme.highlightColor.r,
                                        Youi.Theme.highlightColor.g,
                                        Youi.Theme.highlightColor.b, 0.5)

    property color flatHoveredColor: Qt.rgba(Youi.Theme.highlightColor.r,
                                             Youi.Theme.highlightColor.g,
                                             Youi.Theme.highlightColor.b, 0.2)
    property color flatPressedColor: Qt.rgba(Youi.Theme.highlightColor.r,
                                             Youi.Theme.highlightColor.g,
                                             Youi.Theme.highlightColor.b, 0.25)

    contentItem: IconLabel {
        text: control.text
        font: control.font
        icon: control.icon
        color: !control.enabled ? control.Youi.Theme.disabledTextColor : control.flat ? Youi.Theme.highlightColor : Youi.Theme.textColor
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignCenter
    }

    background: Item {
        implicitWidth: Youi.Units.iconSizes.smallMedium * 4
        implicitHeight: Youi.Units.iconSizes.smallMedium + 6

        Rectangle {
            id: _flatBackground
            anchors.fill: parent
            radius: Youi.Theme.smallRadius
            border.width: 1
            visible: control.flat
            border.color: "transparent"
            color: {
                if (!control.enabled)
                    return Youi.Theme.alternateBackgroundColor

                if (control.pressed)
                    return control.flatPressedColor

                if (control.hovered)
                    return control.flatHoveredColor

                return Qt.rgba(Youi.Theme.highlightColor.r,
                               Youi.Theme.highlightColor.g,
                               Youi.Theme.highlightColor.b, 0.1)
            }
            
            Behavior on color {
                ColorAnimation {
                    duration: 200
                    easing.type: Easing.Linear
                }
            }
        }

        Rectangle {
            id: _background
            anchors.fill: parent
            radius: Youi.Theme.smallRadius
            border.width: 1
            visible: !control.flat
            border.color: control.enabled ? Youi.Theme.borderColor
                                          : "transparent"

            color: {
                if (!control.enabled)
                    return Youi.Theme.alternateBackgroundColor

                if (control.pressed)
                    return control.pressedColor

                if (control.hovered)
                    return control.hoveredColor

                return Youi.Theme.alternateBackgroundColor
            }
            Behavior on color {
                ColorAnimation {
                    duration: 200
                    easing.type: Easing.Linear
                }
            }
            Behavior on border.color {
                ColorAnimation {
                    duration: 200
                    easing.type: Easing.Linear
                }
            }
        }
    }
}