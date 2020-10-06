import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import "../import"
T.ProgressBar {
    id:control
    property alias color: rect.color
    background: Rectangle {
            implicitWidth: 200
            implicitHeight: 6
            color: HorusTheme.emptyColor
            radius: 3
        }
    contentItem: Item {
            implicitWidth: 200
            implicitHeight: 4

            Rectangle {
                id:rect
                width: control.visualPosition * parent.width
                height: parent.height
                radius: 2
                color: HorusTheme.accentColor
            }
        }
}
