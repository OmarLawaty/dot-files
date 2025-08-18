import "."
import "../../../../Theme"
import "../../../common"
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Widgets

Rectangle {
    id: pill

    property var icons
    property var ws
    property int workspaceSize
    property bool isHovered: false
    property bool isSpecialWorkspace: ws.name.startsWith("special:")
    property bool isSpecialWorkspaceActive: Hyprland.activeToplevel && (Hyprland.activeToplevel.workspace.name.startsWith("special:")) && isSpecialWorkspace
    property bool isActive: !isSpecialWorkspaceActive && ws.focused

    width: workspaceSize
    height: workspaceSize
    radius: workspaceSize
    scale: isActive ? 1.1 : 0.9
    color: isActive ? Theme.colors.highlight : Theme.colors.secondary

    StyledText {
        text: icons.getWorkspaceIcon(ws.id)
        opacity: (isActive || isHovered) && !isSpecialWorkspaceActive ? 1 : 0
        color: Theme.colors.foreground

        font {
            pixelSize: Theme.font.size.medium
            family: Number(icons.getWorkspaceIcon(ws.id)) ? Theme.font.family.iconNerd : Theme.font.family.main
            weight: Font.DemiBold
        }

        anchors {
            centerIn: parent
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 1000
                easing.type: Easing.OutBack
            }

        }

    }

    Rectangle {
        anchors.centerIn: parent
        width: parent.width * 0.2
        height: parent.height * 0.2
        radius: parent.width * 0.4
        color: Theme.colors.accent
        opacity: (isActive || isHovered) && !isSpecialWorkspaceActive ? 0 : 0.8

        Behavior on opacity {
            NumberAnimation {
                duration: 1000
                easing.type: Easing.OutBack
            }

        }

    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            if ((ws.name.startsWith("special:")))
                return Hyprland.dispatch(`togglespecialworkspace ${ws.name.replace("special:", "")}`);

            if (Hyprland.focusedWorkspace.id !== ws.id)
                Hyprland.dispatch(`workspace ${ws.id}`);

        }
    }

    icons: Icons {
    }

    Behavior on width {
        NumberAnimation {
            duration: 500
            easing.type: Easing.OutBack
        }

    }

    Behavior on height {
        NumberAnimation {
            duration: 500
            easing.type: Easing.OutBack
        }

    }

    Behavior on color {
        ColorAnimation {
            duration: 1000
            easing.type: Easing.OutBack
        }

    }

    Behavior on scale {
        NumberAnimation {
            duration: 1500
            easing.type: Easing.OutBack
        }

    }

}
