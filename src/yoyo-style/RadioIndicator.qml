/****************************************************************************
**
** Copyright (C) 2017, 2018 Stefano Verzegnassi <stefano@ubports.com>
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
****************************************************************************/

import QtQuick 2.9
import QtQuick.Controls 2.2
import Youi 1.0 as Youi

Rectangle {
    implicitWidth: Youi.Units.iconSizes.smallMedium -2
    implicitHeight: Youi.Units.iconSizes.smallMedium -2

    property Item control

    radius: width / 2
    color: control.Youi.Theme.backgroundColor
    border.color: control.down
        ? control.checked ? "transparent" : control.Youi.Theme.highlightColor
        : control.checked ? control.Youi.Theme.highlightColor : control.Youi.Theme.disabledTextColor

    border.width: 1

    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        scale: control.checked ? 1.0 : 0.0

        color: control.Youi.Theme.highlightColor

        Behavior on scale {
            NumberAnimation {
                duration: 250
                easing.type: Easing.InOutCubic
            }
        }

        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 0.6
            height: width
            radius: width * 0.5
            visible: control.checked
            opacity: visible ? 1.0 : 0.0

            Behavior on opacity {
                NumberAnimation {
                    duration: 250
                    easing.type: Easing.InOutCubic
                }
            }
        }
    }
}