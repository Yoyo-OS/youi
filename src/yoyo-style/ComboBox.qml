import QtQuick 2.4
import QtQuick.Window 2.4
import QtQuick.Controls 2.4
import QtQuick.Controls.impl 2.4
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import Youi 1.0 as Youi

T.ComboBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    topInset: Youi.Units.smallSpacing
    bottomInset: Youi.Units.smallSpacing

    spacing: Youi.Units.smallSpacing
    padding: Youi.Units.smallSpacing
    leftPadding: Youi.Units.largeSpacing
    rightPadding: Youi.Units.largeSpacing

    property bool darkMode: Youi.Theme.darkMode

    onDarkModeChanged: {
        updateTimer.restart()
    }

    delegate: MenuItem {
        width: control.popup.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
    }

    indicator: Image {
        id: indicatorImage
        x: control.mirrored ? control.leftPadding : control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2

        height: Youi.Units.iconSizes.small
        width: height

        cache: false

        source: "image://icontheme/go-down"
        sourceSize.width: width
        sourceSize.height: height
    }

    Timer {
        id: updateTimer
        triggeredOnStart: true
        interval: 10

        onTriggered: {
            indicatorImage.source = ""
            indicatorImage.source = "image://icontheme/go-down"
        }
    }

    contentItem: T.TextField {
        padding: Youi.Units.smallSpacing
        leftPadding: 0
        rightPadding: Youi.Units.smallSpacing

        text: control.editable ? control.editText : control.displayText

        enabled: control.editable
        autoScroll: control.editable
        readOnly: control.down
        inputMethodHints: control.inputMethodHints
        validator: control.validator

        font: control.font
        color: control.enabled ? control.Youi.Theme.textColor : control.Youi.Theme.highlightColor
        selectionColor:  control.Youi.Theme.highlightColor
        selectedTextColor: control.Youi.Theme.highlightedTextColor
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        implicitWidth:  (Youi.Units.iconSizes.medium * 3) + Youi.Units.largeSpacing
        implicitHeight: Youi.Units.iconSizes.medium + Youi.Units.smallSpacing

        radius: Youi.Theme.smallRadius
        color: Youi.Theme.alternateBackgroundColor

        border.color: Youi.Theme.borderColor
        border.width: 1
        Behavior on border.color {
            ColorAnimation {
                duration: 200
                easing.type: Easing.Linear
            }
        }
        Behavior on color {
            ColorAnimation {
                duration: 200
                easing.type: Easing.Linear
            }
        }
    }

    popup: T.Popup {
        width: Math.max(control.width, 150)
        implicitHeight: Math.min(contentItem.implicitHeight, control.Window.height - topMargin - bottomMargin) + Youi.Units.largeSpacing
        transformOrigin: Item.Top

        enter: Transition {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                easing.type: Easing.InOutCubic
                duration: 150
            }
        }

        exit: Transition {
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                easing.type: Easing.InOutCubic
                duration: 150
            }
        }

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0
            topMargin: Youi.Units.smallSpacing
            bottomMargin: Youi.Units.smallSpacing
            spacing: Youi.Units.smallSpacing

            T.ScrollBar.vertical: ScrollBar {}
        }

        background: Rectangle {
            radius: Youi.Theme.smallRadius
            color: parent.Youi.Theme.secondBackgroundColor
            border.width: 0

            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
                radius: 32
                samples: 32
                horizontalOffset: 0
                verticalOffset: 0
                color: Qt.rgba(0, 0, 0, 0.15)
            }
        }
    }
}