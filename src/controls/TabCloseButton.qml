import QtQuick 2.12
import QtQuick.Window 2.3
import QtQuick.Controls 2.4
import Youi 1.0 as Youi

Item {
    id: control

    property var size: 32
    property var iconMargins: 0
    height: size
    width: size

    property alias background: _background
    property color backgroundColor: "transparent"
    property color hoveredColor: "#FF273D"
    property color pressedColor: "#CF182B"
    property alias source: _image.source
    property alias image: _image
    signal clicked()

    Rectangle {
        id: _background
        anchors.fill: parent
        anchors.margins: size * 0.1
        radius: control.height / 2
        opacity: 0.9
        color: mouseArea.pressed ? pressedColor : mouseArea.containsMouse ? control.hoveredColor : control.backgroundColor
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

        onClicked: control.clicked()
    }

    Image {
        id: _image
        objectName: "image"
        anchors.fill: parent
        anchors.margins: control.iconMargins
        fillMode: Image.PreserveAspectFit
        sourceSize: Qt.size(width, height)
        cache: true
        asynchronous: false
    }
}