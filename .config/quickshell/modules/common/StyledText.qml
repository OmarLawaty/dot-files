import "../../Theme"
import QtQuick

Text {
    renderType: Text.NativeRendering
    verticalAlignment: Text.AlignVCenter
    color: Theme.colors.foreground ?? "black"
    linkColor: Theme.colors.highlight ?? "blue"

    font {
        family: Theme.font.family.main
        pixelSize: Theme.font.size.veryLarge
    }

}
