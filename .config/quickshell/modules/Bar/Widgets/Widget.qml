import "../../../Theme"
import Quickshell.Widgets

WrapperRectangle {
    id: widgetContainer

    property int baseMargin: 5
    property int fontSize: 10

    color: Theme.colors.primary
    margin: baseMargin
    rightMargin: margin * 2
    leftMargin: margin * 2
    radius: 12
    resizeChild: true
}
