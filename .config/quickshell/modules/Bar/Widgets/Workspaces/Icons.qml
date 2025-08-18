import QtQuick

QtObject {
    readonly property var icons: ({
        "discord": "",
        "games": "",
        "editor": "\uf111",
        "obs": ""
    })
    readonly property var workspaces: ({
        "11": icons.discord,
        "12": icons.games,
        "13": icons.editor,
        "14": icons.obs
    })

    function getIsIcon(id) {
        return workspaces.hasOwnProperty(id);
    }

    function getWorkspaceIcon(id) {
        if (workspaces.hasOwnProperty(id))
            return workspaces[id];

        return id;
    }

}
