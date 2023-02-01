import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import Youi 1.0 as Youi

T.TabButton {
    id: control

    property int standardHeight: Youi.Units.iconSizes.medium + Youi.Units.smallSpacing
    property color pressedColor: Qt.rgba(Youi.Theme.textColor.r, Youi.Theme.textColor.g, Youi.Theme.textColor.b, 0.5)
    property color textColor: !control.enabled ? Youi.Theme.disabledTextColor : control.pressed ? pressedColor : control.checked ? Youi.Theme.textColor : Youi.Theme.textColor
    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             standardHeight)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    padding: 0
    spacing: 0

    contentItem: Text {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight

        text: control.text
        font: control.font
        color: control.textColor
    }
}