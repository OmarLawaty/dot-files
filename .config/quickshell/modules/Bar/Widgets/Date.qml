import "."
import "../../../Theme"
import "../../common"
import QtQuick
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets

Widget {
    id: dateContainer

    RowLayout {
        id: rowLayout

        anchors.centerIn: parent
        spacing: 4

        SystemClock {
            id: clock

            precision: SystemClock.Seconds
        }

        StyledText {
            text: Qt.formatDateTime(clock.date, "hh:mm A")
        }

        StyledText {
            text: "•"
            font.bold: false
        }

        StyledText {
            text: Qt.formatDateTime(clock.date, "ddd, dd/MM")
        }

    }

}
