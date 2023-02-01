import QtQuick 2.6
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.3 as Controls
import QtQuick.Templates 2.3 as T
import Youi 1.0 as Youi

T.ToolTip {
    id: controlRoot

    x: parent ? (parent.width - implicitWidth) / 2 : 0
    y: -implicitHeight - Youi.Units.smallSpacing * 1.5

    implicitWidth: contentItem.implicitWidth + leftPadding + rightPadding
    implicitHeight: contentItem.implicitHeight + topPadding + bottomPadding

    margins: 6
    padding: 6

    closePolicy: T.Popup.CloseOnEscape | T.Popup.CloseOnPressOutsideParent | T.Popup.CloseOnReleaseOutsideParent

    contentItem: Controls.Label {
        text: controlRoot.text
        font: controlRoot.font
        color: Youi.Theme.textColor
    }

    background: Rectangle {
        opacity: 0.95
        color: Youi.Theme.secondBackgroundColor
        radius: Youi.Theme.smallRadius

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            radius: 8
            samples: 12
            horizontalOffset: 0
            verticalOffset: 0
            color: Qt.rgba(0, 0, 0, 0.15)
        }
    }
}