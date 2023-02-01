import QtQuick 2.15
import QtQml 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Youi 1.0 as Youi

Item {
    id: control

    property bool newTabVisibile: true
    property alias model: _listView.model
    property alias delegate: _listView.delegate
    property alias count: _listView.count
    property alias currentIndex: _listView.currentIndex

    signal newTabClicked()

    RowLayout {
        anchors.fill: parent
        spacing: Youi.Units.smallSpacing / 2

        ListView {
            id: _listView
            Layout.fillHeight: true
            Layout.preferredWidth: _listView.childrenRect.width
            Layout.alignment: Qt.AlignLeft
            orientation: ListView.Horizontal
            highlightMoveDuration: 0
            highlightResizeDuration: 0
            clip: true
        }

        Loader {
            active: control.newTabVisibile
            visible: active
            asynchronous: true

            // Layout.fillHeight: true
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            Layout.preferredHeight: 31
            Layout.preferredWidth: visible ? height : 0

            sourceComponent: Youi.RoundImageButton {
                source: "qrc:/images/" + (Youi.Theme.darkMode ? "dark/" : "light/") + "add.svg"
                onClicked: control.newTabClicked()
                iconMargins: 2
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}