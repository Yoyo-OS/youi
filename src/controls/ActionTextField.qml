import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import Youi 1.0 as Youi

TextField {
    id: control

    property list<QtObject> rightActions

    rightPadding: Youi.Units.smallSpacing + rightActionsRow.width

    Row {
        id: rightActionsRow
        padding: Youi.Units.smallSpacing
        layoutDirection: Qt.RightToLeft
        anchors.right: parent.right
        anchors.rightMargin: Youi.Units.smallSpacing
        anchors.verticalCenter: parent.verticalCenter
        height: control.implicitHeight - 2 * Youi.Units.smallSpacing
        Repeater {
            model: control.rightActions
            Icon {
                implicitWidth: Youi.Units.iconSizes.small
                implicitHeight: Youi.Units.iconSizes.small

                anchors.verticalCenter: parent.verticalCenter

                source: modelData.icon.name.length > 0 ? modelData.icon.name : modelData.icon.source
                enabled: modelData.enabled
                MouseArea {
                    id: actionArea
                    anchors.fill: parent
                    onClicked: modelData.trigger()
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }
    
}
