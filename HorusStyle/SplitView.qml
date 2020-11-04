import QtQuick 2.13
import QtQuick.Templates 2.13 as T
import QtQuick.Controls 2.13
import QtQuick.Controls.impl 2.13
import "../import"
T.SplitView {
    id:splitView
    property int handleTopMargin
    handle: Rectangle {
        implicitWidth: 4

        implicitHeight: 4
        Rectangle{
            y:handleTopMargin
            implicitWidth: splitView.orientation==Qt.Horizontal?parent.width/4:parent.width
            implicitHeight: splitView.orientation==Qt.Horizontal?parent.height-handleTopMargin:parent.height/4
            color: parent.SplitHandle.hovered ? parent.SplitHandle.pressed ?Qt.darker(palette.mid, 1.1):Qt.darker(palette.mid, 1.2)
            : palette.mid
        }

            //visible: SplitHandle.hovered ?true:false

        }
}
