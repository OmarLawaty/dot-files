import "./Corners"
import QtQuick
import Quickshell

PanelWindow {
    id: panelWindow

    property bool shouldGoAbove: false
    property int barHeight: 40
    property int gap: 10

    exclusionMode: PanelWindow.ExclusionMode.Normal
    aboveWindows: panelWindow.shouldGoAbove
    implicitHeight: panelWindow.barHeight
    exclusiveZone: panelWindow.barHeight

    anchors {
        top: true
        left: true
        right: true
    }

    Corners {
    }

}
