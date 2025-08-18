import "./Colors.js" as Colors
import "./Font.js" as Fonts
import QtQuick
pragma Singleton

QtObject {
    property var colors: Colors.colors
    property var font: Fonts.font
}
