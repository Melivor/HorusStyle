import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Shapes 1.12
import QtQuick.Layouts 1.12
import "../import"
T.CheckBox {
    id: control
    implicitWidth: contentItem.width +padding*2
    implicitHeight:implicitWidth
    contentItem:
        Text {
        id:text
        text: control.text
        font: control.font
        color: HorusTheme.textColor
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        width: contentWidth!==0?control.indicator.implicitWidth+contentWidth+10:control.indicator.implicitWidth
    }

    indicator:

        Rectangle {
        Layout.alignment: Qt.AlignVCenter
        id:rect
        implicitWidth: 22
        implicitHeight: 22
        x:control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 3
        border.color: control.hovered ? HorusTheme.highlightedBorderColor: HorusTheme.accentColor

        Shape {
            visible: control.checked
            ShapePath{
                startX:rect.width*0.2
                startY:rect.height*0.5
                strokeWidth: 1.5
                strokeColor: HorusTheme.accentColor
                joinStyle: ShapePath.RoundJoin
                capStyle: ShapePath.RoundCap
                PathLine{
                    relativeX: rect.width*0.4
                    relativeY: rect.height*0.4
                }
                PathLine{
                    relativeX: rect.width*0.6
                    relativeY: -rect.height*0.8
                }
            }

        }
    }

}
