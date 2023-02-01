import QtQuick 2.6
import QtQuick.Templates 2.3 as T
import Youi 1.0 as Youi

T.DialogButtonBox {
    id: control

    implicitWidth: contentItem.implicitWidth + leftPadding + rightPadding
    implicitHeight: contentItem.implicitHeight + topPadding + bottomPadding

    spacing: Youi.Units.smallSpacing
    padding: Youi.Units.smallSpacing
    alignment: Qt.AlignRight

    delegate: Button {
        width: Math.min(implicitWidth, control.width / control.count - control.padding - control.spacing * control.count)
    }

    contentItem: ListView {
        implicitWidth: contentWidth
        implicitHeight: 32

        model: control.contentModel
        spacing: control.spacing
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        snapMode: ListView.SnapToItem
    }

    background: Item {}
}