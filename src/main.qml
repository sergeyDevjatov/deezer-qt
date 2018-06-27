import QtQuick 2.11
import QtQuick.Controls 2.4

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    minimumWidth: 300
    minimumHeight: 300
    title: (stackView.currentItem && stackView.currentItem.title) || qsTr("Deezer desktop")

    StackView {
        id: stackView
        initialItem: "PlayerWindow.qml"
        anchors.fill: parent
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("&Pages")
            Action { text: qsTr("&Player"); onTriggered: {stackView.clear(); stackView.push("PlayerWindow.qml")} }
            Action { text: qsTr("&Another"); onTriggered: {stackView.clear(); stackView.push("AnotherWindow.qml")} }
            Action { text: qsTr("&Unnamed"); onTriggered: {stackView.clear(); stackView.push("UnnamedWindow.qml")} }
        }
    }
}
