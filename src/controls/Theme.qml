/*
 * Copyright (C) 2021 CutefishOS Team.
 *
 * Author:     revenmartin <revenmartin@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

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

    property color backgroundColor: darkMode ? "#1C1C1D" : "#F3F4F9"
    property color secondBackgroundColor: darkMode ? "#2C2C2D" : "#FFFFFF"
    property color alternateBackgroundColor: darkMode ? "#3C3C3D" : "#F2F4F5"

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

    property real smallRadius: 8.0
    property real mediumRadius: 10.0
    property real bigRadius: 12.0
    property real hugeRadius: 14.0
    property real windowRadius: 11.0

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
