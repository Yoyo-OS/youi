import QtQuick 2.12
import QtQuick.Window 2.3
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.15
import Youi 1.0 as Youi

Item {
    id: control

    implicitWidth: Math.max(background.implicitWidth, contentItem.implicitWidth + Youi.Units.largeSpacing)
    implicitHeight: background.implicitHeight

    property string text: ""
    property bool enabled: true
    

    signal clicked()

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

        onClicked: control.clicked()
    }
    Label{
        id: _label
        text: control.text
        color: !control.enabled ? Youi.Theme.disabledTextColor : Youi.Theme.textColor
        anchors.fill: parent
    }
}