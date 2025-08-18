import "../../../Theme"
import Quickshell

PanelWindow {
    id: topCuts

    property real cornerMultiplier: 0.7
    property real cornerRadius: panelWindow.barHeight * cornerMultiplier

    exclusionMode: PanelWindow.ExclusionMode.Normal
    implicitHeight: panelWindow.barHeight
    aboveWindows: false
    color: "transparent"

    anchors {
        top: true
        left: true
        right: true
    }

    PanelWindow {
        implicitHeight: panelWindow.barHeight * (1 + topCuts.cornerMultiplier)
        implicitWidth: topCuts.cornerRadius
        exclusionMode: PanelWindow.ExclusionMode.Ignore
        aboveWindows: panelWindow.shouldGoAbove
        color: "transparent"

        anchors {
            top: true
            right: true
        }

        RoundCorner {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            implicitSize: cornerRadius
            color: panelWindow.color
            corner: 3
            rotation: -90
        }

        RoundCorner {
            anchors.right: parent.right
            anchors.top: parent.top
            implicitSize: cornerRadius
            color: Theme.colors.pitchBlack
            corner: 3
            rotation: -90
        }

    }

    PanelWindow {
        implicitHeight: panelWindow.barHeight * (1 + topCuts.cornerMultiplier)
        implicitWidth: cornerRadius
        exclusionMode: PanelWindow.ExclusionMode.Ignore
        aboveWindows: panelWindow.shouldGoAbove
        color: "transparent"

        anchors {
            top: true
            left: true
        }

        RoundCorner {
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            implicitSize: cornerRadius
            color: panelWindow.color
            corner: 2
            rotation: 90
        }

        RoundCorner {
            anchors.left: parent.left
            anchors.top: parent.top
            implicitSize: cornerRadius
            color: Theme.colors.pitchBlack
            corner: 2
            rotation: 90
        }

    }

    PanelWindow {
        aboveWindows: false
        exclusionMode: PanelWindow.ExclusionMode.Ignore
        implicitHeight: cornerRadius
        color: "transparent"

        anchors {
            left: true
            right: true
            bottom: true
        }

        RoundCorner {
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            implicitSize: cornerRadius
            color: Theme.colors.pitchBlack
            corner: 2
            rotation: 0
        }

        RoundCorner {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            implicitSize: cornerRadius
            color: Theme.colors.pitchBlack
            corner: 3
            rotation: 0
        }

    }

}
