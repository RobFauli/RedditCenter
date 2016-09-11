import QtQuick 2.7
import QtQuick.Window 2.1
import QtQuick.Layouts 1.3
import myReddit 0.1

Window {
    id: window
    title: "Eye on Reddit: Settings"
    visible: true
    height: 400
    width: 600
    
    Rectangle {
        id: menuArea
        anchors.left: parent.left
        width: parent.width*0.2
        height: parent.height

        ListModel {
            id: menuModel
            ListElement {
                title: "General"; collapseable: true
            }
            ListElement {
                title: "Appearance"; collapseable: true;
            }
            ListElement {
                title: "Subreddits"; collapseable: true;
            }
        }

        ListView {
            id: menu
            anchors.fill: parent

            model: menuModel
            delegate: menuDelegate
            highlight: menuHighlighter
        }

        Component {
            id: menuDelegate

            Rectangle {
                //property bool subsOpen: true
                property int itemHeight: text.contentHeight + 4
                width: ListView.view.width
                height: sublistView.visible ? itemHeight + 3*textBox.height : itemHeight
                color: "transparent"
                Rectangle {
                    id: textBox
                    height: text.contentHeight + 4
                    width: parent.width
                    color: "transparent"
                    Text {
                        id: text
                        text: title
                        anchors.verticalCenter: parent.verticalCenter
                        padding: 4
                    }
                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            menu.currentIndex = index
                        }
                    }
                }
                SublistView {
                    id: sublistView
                    width: parent.width
                    anchors.top: textBox.bottom
                    anchors.bottom: parent.bottom

                    visible: (menu.currentIndex === 2 && title === "Subreddits")
                }

            }
        }

        Component {
            id: menuHighlighter
            Rectangle {
                color: "lightgray"
            }
        }
    }
    Rectangle {
        id: pane
        anchors.left: menuArea.right
        width: window.width - menuArea.width
        height: window.height
        Text {
            anchors.centerIn: parent
            text: "hey"
        }
    }

    // For testing:
    // @disable-check M16
    onClosing: Qt.quit()
}