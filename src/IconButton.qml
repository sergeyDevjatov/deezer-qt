import QtQuick 2.2
import QtQuick.Controls 2.4

Button {
    property string source

    background: null
    padding: 0
    opacity: 0.5
    onHoveredChanged: {
        opacity = hovered ? 1 : .5
    }
    icon.color: "transparent"
    icon.source: source
}