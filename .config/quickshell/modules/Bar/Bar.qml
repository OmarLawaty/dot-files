import "."
import "../../Theme"
import "./Widgets"
import "./Widgets/Workspaces"
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets

BarContainer {
    id: barContainer

    shouldGoAbove: true
    color: Theme.colors.background

    RowLayout {
        id: barWrapper

        property real sideSectionWidth: (barContainer.width - (barContainer.gap * 2) - middleSection.width) / 2

        anchors.centerIn: parent
        spacing: barContainer.gap

        RowLayout {
            spacing: parent.spacing
            layoutDirection: Qt.RightToLeft
            Layout.preferredWidth: parent.sideSectionWidth

            CurrentWindow {
                Layout.alignment: Qt.AlignRight
                Layout.leftMargin: barContainer.gap
            }

        }

        Row {
            id: middleSection

            Workspaces {
            }

        }

        Row {
            Layout.preferredWidth: parent.sideSectionWidth
            rightPadding: barContainer.gap
            spacing: parent.spacing
            leftPadding: 0

            Date {
                fontSize: 10
            }

        }

    }

}
