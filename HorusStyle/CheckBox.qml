import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Shapes 1.12
import QtQuick.Layouts 1.12
import "../import"
T.CheckBox {
    id: control
    implicitWidth: contentItem.width +padding*2
    implicitHeight:25
    spacing: 5
    contentItem:
        Text {
        id:text
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0
        text: control.text
        font: control.font
        color: palette.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        // width: contentWidth!==0?control.indicator.implicitWidth+contentWidth+10:control.indicator.implicitWidth
    }

    indicator:
        Item{
        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding //+ (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        implicitWidth: rect.implicitWidth + 4.4
        implicitHeight: rect.implicitHeight
        Rectangle {
            Layout.alignment: Qt.AlignVCenter
            id:rect
            implicitWidth: 22
            implicitHeight: 22

            radius: 3
            border.color: control.hovered ?palette.highlight: palette.mid

            Shape {
                visible: control.checked
                ShapePath{
                    startX:rect.width*0.2
                    startY:rect.height*0.5
                    strokeWidth: 1.5
                    strokeColor: palette.mid
                    joinStyle: ShapePath.RoundJoin
                    capStyle: ShapePath.RoundCap
                    fillColor: "transparent"
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

}
