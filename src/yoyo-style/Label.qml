import QtQuick 2.1
import QtQuick.Window 2.2
import QtQuick.Templates 2.3 as T
import Youi 1.0 as Youi

T.Label {
    id: control

    verticalAlignment: lineCount > 1 ? Text.AlignTop : Text.AlignVCenter

    activeFocusOnTab: false
    // Text.NativeRendering is broken on non integer pixel ratios
    // renderType: Window.devicePixelRatio % 1 !== 0 ? Text.QtRendering : Text.NativeRendering

    renderType: Youi.Theme.renderType

    font.capitalization: Youi.Theme.defaultFont.capitalization
    font.family: Youi.Theme.fontFamily
    font.italic: Youi.Theme.defaultFont.italic
    font.letterSpacing: Youi.Theme.defaultFont.letterSpacing
    font.pointSize: Youi.Theme.fontSize
    font.strikeout: Youi.Theme.defaultFont.strikeout
    font.underline: Youi.Theme.defaultFont.underline
    font.weight: Youi.Theme.defaultFont.weight
    font.wordSpacing: Youi.Theme.defaultFont.wordSpacing
    color: Youi.Theme.textColor
    linkColor: Youi.Theme.linkColor

    opacity: enabled ? 1 : 0.6

    Accessible.role: Accessible.StaticText
    Accessible.name: text
}