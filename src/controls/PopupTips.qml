import QtQuick 2.4
import QtQuick.Window 2.3
import QtQuick.Controls 2.4
import Youi 1.0 as Youi

Window {
    id: control
    visible: false
    color: "transparent"

    property string popupText
    property point position: Qt.point(0, 0)
    property alias backgroundOpacity: _background.opacity
    property alias backgroundColor: _background.color
    property alias blurEnabled: windowBlur.enabled
    property var borderColor: windowHelper.compositing ? Youi.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.3)
                                                                  : Qt.rgba(0, 0, 0, 0.2) : Youi.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.1)
                                                                                                                  : Qt.rgba(0, 0, 0, 0.05)
    flags: Qt.WindowStaysOnTopHint | Qt.WindowDoesNotAcceptFocus | Qt.ToolTip
    width: label.implicitWidth + Youi.Units.largeSpacing * 1.5
    height: label.implicitHeight + Youi.Units.largeSpacing * 1.5

    Youi.WindowHelper {
        id: windowHelper
    }

    Youi.WindowShadow {
        view: control
        geometry: Qt.rect(control.x, control.y, control.width, control.height)
        radius: _background.radius
    }

    Youi.WindowBlur {
        id: windowBlur
        view: control
        enabled: true
        windowRadius: _background.radius
        geometry: Qt.rect(_background.x, _background.y, _background.width, _background.height)
    }

    Rectangle {
        id: _background
        anchors.fill: parent
        color: Youi.Theme.secondBackgroundColor
        radius: windowHelper.compositing ? Youi.Theme.mediumRadius : 0
        border.color: control.borderColor
        border.width: 1 / Screen.devicePixelRatio
        border.pixelAligned: Screen.devicePixelRatio > 1 ? false : true

        Behavior on color {
            ColorAnimation {
                duration: control.animationEnabled ? 200 : 0
                easing.type: Easing.Linear
            }
        }
    }

    Label {
        id: label
        anchors.centerIn: parent
        text: control.popupText
        color: Youi.Theme.textColor
    }

    onPositionChanged: adjustCorrectLocation()

    function adjustCorrectLocation() {
        var posX = control.position.x
        var posY = control.position.y

        // left
        if (posX <= Screen.virtualX)
            posX = Screen.virtualX + Youi.Units.smallSpacing

        // top
        if (posY <= Screen.virtualY)
            posY = Screen.virtualY + Youi.Units.smallSpacing

        // right
        if (posX + control.width > Screen.virtualX + Screen.width)
            posX = Screen.virtualX + Screen.width - control.width - 1

        // bottom
        if (posY > control.height > Screen.virtualY + Screen.width)
            posY = Screen.virtualY + Screen.width - control.width - 1

        control.x = posX
        control.y = posY
    }

    function show() {
        if (control.popupText)
            control.visible = true
    }

    function hide() {
        control.visible = false
    }
}