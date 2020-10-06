import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import "../import"
T.RadioButton {
    id:control
    indicator: Rectangle{
        implicitWidth: 20
        implicitHeight: implicitWidth
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: implicitWidth/2
        opacity: control.down?0.3:1
        border.color: HorusTheme.accentColor
        Rectangle{
            width: 10
            height: width
            anchors.centerIn: parent
            radius: width/2
            opacity: control.down?0.3:1
            color: HorusTheme.accentColor
            visible: control.checked
        }
    }
}
