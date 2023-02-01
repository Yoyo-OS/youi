import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T
import Youi 1.0 as Youi

T.MenuSeparator {
    id: control

    implicitHeight: Youi.Units.largeSpacing + separator.height
    width: parent.width

    background: Rectangle {
        id: separator
        anchors.centerIn: control
        width: control.width - Youi.Units.largeSpacing * 2
        height: 1
        color: Youi.Theme.textColor
        opacity: 0.3
    }
}