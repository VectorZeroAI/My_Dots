import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Bluetooth

PanelWindow {
    id: root

    anchors {
        top: true
        right: true
    }
    implicitWidth: 300
    implicitHeight: adapter_collumn.implicitHeight + 20

    Column {
        id: adapterColumn
        spacing: 10
        padding: 10

        Row {
            spacing: 10

            Text {
                text: "Bluetooth Controller Text"
                font.pixelSize: 18
                font.bold: true
            }

            Button {
                text: Bluetooth.defaultAdapter.enabled ? " ON " : " OFF "

            }
        }
    }
}
