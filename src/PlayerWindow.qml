import QtQuick 2.2
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Page {
    anchors.fill: parent
    title: qsTr("Artist - Songname")
    background: Rectangle{
        color: "#cc5fae"
    }

    ColumnLayout {
        id: layout
        anchors.fill: parent

        ColumnLayout {
            id: controlBox
            Layout.fillWidth: true
            Layout.fillHeight: false
            spacing: 0
            Layout.alignment: Qt.AlignBottom
            Layout.preferredHeight: parent.height * 0.4
            Layout.minimumHeight: window.minimumHeight / 2

            property int progressBarHeight: 10


            ProgressBar {
                value: 0.5
                Layout.alignment: Qt.AlignTop
                Layout.fillWidth: true
                Layout.fillHeight: false
                Layout.preferredHeight: parent.progressBarHeight
                background: Rectangle {
                    color: "#77ffffff"
                }

                contentItem: Item {
                    Rectangle {
                        width: parent.parent.visualPosition * parent.width
                        height: parent.height
                        color: "#ffffff"
                    }
                }
            }

            Rectangle {
                color: "#3a3b3d"
                Layout.alignment: Qt.AlignBottom
                Layout.fillWidth: true
                Layout.fillHeight: false
                Layout.preferredHeight: parent.height - parent.progressBarHeight

                property real sideButtonOffset: 0.35

                IconButton {
                    id: playButton
                    x: (parent.width - width) / 2
                    y: (parent.height - height) / 2

                    states: [
                        State {
                            name: "play_icon"
                            PropertyChanges { target: playButton; source: "assets/icons/player/play.svg" }
                        },
                        State {
                            name: "pause_icon"
                            PropertyChanges { target: playButton; source: "assets/icons/player/pause.svg" }
                        }
                    ]

                    state: "play_icon"

                    onClicked: {
                        state = state === "play_icon" ? "pause_icon" : "play_icon";
                    }

                }
                IconButton {
                    id: prevButton
                    x: playButton.x - 2 * playButton.width
                    y: (parent.height - height) / 2
                    source: "assets/icons/player/prev.svg"
                }
                IconButton {
                    id: nextButton
                    x: playButton.x + 2 * playButton.width
                    y: (parent.height - height) / 2
                    source: "assets/icons/player/next.svg"
                }
            }
        }
    }
}