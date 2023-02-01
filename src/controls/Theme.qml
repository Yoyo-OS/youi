pragma Singleton

import QtQuick 2.4
import Youi.Core 1.0 as YouiCore

QtObject {
    id: theme

    property real devicePixelRatio: YouiCore.ThemeManager.devicePixelRatio

    property bool darkMode: YouiCore.ThemeManager.darkMode

    property color color0: YouiCore.ThemeManager.color0
    property color color1: YouiCore.ThemeManager.color1
    property color color2: YouiCore.ThemeManager.color2
    property color color3: YouiCore.ThemeManager.color3
    property color color4: YouiCore.ThemeManager.color4
    property color color5: YouiCore.ThemeManager.color5
    property color color6: YouiCore.ThemeManager.color6

    property color backgroundColor: darkMode ? "#202020" : "#F3F3F3"
    property color secondBackgroundColor: darkMode ? "#272727" : "#F9F9F9"
    property color thirdBackgroundColor: darkMode ? "#3D3D3D" : "#FEFEFE"
    property color alternateBackgroundColor: darkMode ? "#343434" : "#FDFDFD"

    property color textColor: darkMode ? "#FFFFFF" : "#323238"
    property color disabledTextColor: darkMode ? "#888888" : "#64646E"

    property color borderColor: darkMode ? "#323232" : "#EEEEEE"
    property color secondBorderColor: darkMode ? "#9B9B9B" : "#878787"

    property color highlightColor: YouiCore.ThemeManager.accentColor
    property color highlightedTextColor: darkMode ? "#FFFFFF" : "#FFFFFF"

    property color activeTextColor: "#0176D3"
    property color activeBackgroundColor: "#0176D3"

    property color linkColor: "#2196F3"
    property color linkBackgroundColor: "#2196F3"
    property color visitedLinkColor: "#2196F3"
    property color visitedLinkBackgroundColor: "#2196F3"

    property real fontSize: YouiCore.ThemeManager.fontSize
    property string fontFamily: YouiCore.ThemeManager.fontFamily

    property string iconsFontFamily: "FluentSystemIcons-Regular"

    property real smallRadius: 4.0
    property real mediumRadius: 8.0
    property real windowRadius: 8.0

    property var renderType: Text.QtRendering

    property font defaultFont: fontMetrics.font
    property font smallFont: {
        let font = fontMetrics.font
        if (!!font.pixelSize) {
            font.pixelSize =- 2
        } else {
            font.pointSize =- 2
        }
        return font
    }

    property list<QtObject> children: [
        TextMetrics {
            id: fontMetrics
        }
    ]
}