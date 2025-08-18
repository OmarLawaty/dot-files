// TODO: Implement number view when holding down super key
// TODO: Implement workspace pill switching animation using NumberAnimation on ws.id

import "../"
import "../../../../Theme"
import "./Icons.qml"
import QtQml.Models
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Widgets

Widget {
    id: workspaceContainer

    property var icons
    property var workspaceSize: barContainer.barHeight - margin * 4
    property int gap: 5
    property var workspaces: filterSpecialWorkspace()
    property bool isHovered: false

    function filterSpecialWorkspace() {
        return Hyprland.workspaces.values.reduce((acc, workspace) => {
            const isSpecial = workspace.name.startsWith("special:");
            const isFixed = icons.getIsIcon(workspace.id);
            if (isFixed)
                acc.fixed.push(workspace);
            else if (isSpecial)
                acc.special.push(workspace);
            else
                acc.normal.push(workspace);
            return acc;
        }, {
            "special": [],
            "fixed": [],
            "normal": []
        });
    }

    color: "transparent"
    width: workspaces.length * workspaceSize + workspaceContainer.rightMargin + workspaceContainer.leftMargin + gap * (workspaces.length - 1)

    RowLayout {
        Workspace {
            ws: workspaces.special[0]
            workspaceSize: workspaceContainer.workspaceSize
            isActive: Hyprland.activeToplevel && (Hyprland.activeToplevel.workspace.name.startsWith("special:"))
        }

        Widget {
            Row {
                id: pillRow

                spacing: workspaceContainer.gap

                Repeater {
                    model: workspaceContainer.workspaces.normal

                    delegate: Workspace {
                        ws: modelData
                        workspaceSize: workspaceContainer.workspaceSize
                        isHovered: workspaceContainer.isHovered
                    }

                }

            }

        }

        Workspace {
            ws: workspaces.fixed.find((ws) => {
                return ws.id === Hyprland.focusedWorkspace.id;
            }) || workspaces.fixed[0]
            workspaceSize: workspaceContainer.workspaceSize
            isActive: workspaces.fixed.some((ws) => {
                return ws.id === Hyprland.focusedWorkspace.id;
            })
        }

    }

    HoverHandler {
        id: hover

        onHoveredChanged: workspaceContainer.isHovered = hover.hovered
    }

    icons: Icons {
    }

    Behavior on width {
        NumberAnimation {
            duration: 200
            easing.type: Easing.OutBack
        }

    }

}
