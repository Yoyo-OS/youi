import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.6
import QtQuick.Templates 2.6 as T
import Youi 1.0 as Youi

T.TextArea {
    id: control

    implicitWidth: Math.max(contentWidth + leftPadding + rightPadding,
                            background ? background.implicitWidth : 0,
                            placeholder.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(contentHeight + topPadding + bottomPadding,
                             background ? background.implicitHeight : 0,
                             placeholder.implicitHeight + topPadding + bottomPadding)

    padding: 6

    color: Youi.Theme.textColor
    selectionColor: Youi.Theme.highlightColor
    selectedTextColor: Youi.Theme.highlightedTextColor
    opacity: control.enabled ? 1 : 0.6
    wrapMode: Text.WordWrap
    verticalAlignment: TextEdit.AlignTop
    hoverEnabled: false

    renderType: Youi.Theme.renderType

    selectByMouse: true

    Label {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)

        text: control.placeholderText
        font: control.font
        color: Youi.Theme.disabledTextColor
        horizontalAlignment: control.horizontalAlignment
        verticalAlignment: control.verticalAlignment
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
        elide: Text.ElideRight
    }

    background: Rectangle {
        y: parent.height - height - control.bottomPadding / 2
        implicitWidth: 120
        height: control.activeFocus ? 2 : 1
        color: control.Youi.Theme.backgroundColor
    }
}