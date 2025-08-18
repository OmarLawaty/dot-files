import "."
import "../../../Theme"
import "../../common"
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Widget {
    // property bool isSpecialOpened: Number(Hyprland.activeToplevel.workspace.id) ? false : true
    // return Hyprland.activeToplevel;
    // if (!Hyprland.activeToplevel)
    //     return false;
    // if (!Number(Hyprland.activeToplevel.workspace.id))
    //     return true;
    // return currentWindow.workspaceWindows > 0;
    // console.log("Current Window:", Hyprland.activeToplevel.title);
    // console.log("Window Workspace:", Hyprland.focusedWorkspace.id);
    // console.log("Focused Workspace:", Hyprland.focusedWorkspace.id);
    // console.log("Workspace Windows:", workspaceWindows);

    id: currentWindow

    // property int workspaceWindows: Hyprland.activeToplevel.workspace.toplevels.values.length
    property bool isWindowActive: getIsWindowActive()

    function getIsWindowActive() {
        const isSpecialWorkspace = Hyprland.activeToplevel && (Hyprland.activeToplevel.workspace.name.startsWith("special:"));
        const isEmptyWorkspace = Hyprland.focusedWorkspace && Hyprland.focusedWorkspace.toplevels.values.length === 0;
        return isSpecialWorkspace || !isEmptyWorkspace;
    }

    color: "transparent"
    margin: 0
    leftMargin: 0
    rightMargin: 0

    RowLayout {
        // padding: currentWindow.baseMargin
        // leftPadding: currentWindow.baseMargin * 2
        // rightPadding: currentWindow.baseMargin * 2
        // width: currentWindowTitle.width

        id: currentWindowWrapper

        Rectangle {
            // color: "red"

            width: currentWindow.isWindowActive ? currentWindowWrapper.width : 0
            height: parent.height

            Behavior on width {
                NumberAnimation {
                    duration: 300
                    easing.type: Easing.InOutQuad
                }

            }

        }

        StyledText {
            id: currentWindowTitle

            text: Hyprland.activeToplevel ? Hyprland.activeToplevel.title : ""
            opacity: currentWindow.isWindowActive ? 1 : 0
            font.pixelSize: Theme.font.size.large
            font.family: Theme.font.family.main

            Behavior on opacity {
                NumberAnimation {
                    duration: 300
                    easing.type: Easing.InOutQuad
                }

            }

        }

    }

}
