import QtQuick 2.12
import QtQuick.Templates 2.13 as T
import QtQuick.Shapes 1.12
import QtGraphicalEffects 1.0
import "../import"
T.TabButton{
    id:tabButton
    property int radius:HorusTheme.baseRadius
//    contentItem:Rectangle{
//        color:"transparent"
//        implicitHeight: 30
//    }
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                                implicitContentWidth + leftPadding + rightPadding)
        implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                                 implicitContentHeight + topPadding + bottomPadding)
    contentItem:Item{ Text{
        anchors.centerIn: parent
        text:tabButton.text
        color:tabButton.checked?HorusTheme.textColor:HorusTheme.textLightColor
    }
    }

    background: Shape{
        visible: tabButton.checked?true:false
        //rendererType: Shape.GeometryRenderer
        anchors.fill:parent
        implicitHeight: 40
        // visible: tabButton.current?true:false

        ShapePath{
            //startX:tabButton.x
            startY: tabButton.height
            fillColor: HorusTheme.foregroundColor
            startX: -tabButton.radius
            //strokeWidth: 1
            //strokeColor: "green"
            //strokeColor: "black"
            PathArc{
                radiusX: tabButton.radius
                radiusY: tabButton.radius
                relativeX: tabButton.radius
                relativeY: -tabButton.radius
                direction: PathArc.Counterclockwise
            }
            PathLine{
                relativeX: 0
                relativeY: -(tabButton.height-2*tabButton.radius)
            }
            PathArc{

                //direction: PathArc.Counterclockwise
                radiusX: tabButton.radius
                radiusY: tabButton.radius
                relativeX: tabButton.radius
                relativeY: -tabButton.radius
            }
            PathLine{
                relativeX: tabButton.width-3*tabButton.radius
                relativeY: 0
            }
            PathArc{
                //direction: PathArc.Counterclockwise
                radiusX: tabButton.radius
                radiusY: tabButton.radius
                relativeX: tabButton.radius
                relativeY: tabButton.radius
            }
            PathLine{
                relativeX: 0
                relativeY: tabButton.height-2*tabButton.radius
            }
            PathArc{
                direction: PathArc.Counterclockwise
                radiusX: tabButton.radius
                radiusY: tabButton.radius
                relativeX: tabButton.radius
                relativeY: tabButton.radius
            }
            PathLine{
                relativeX: -tabButton.width
                relativeY: 0
            }
            PathLine{
                relativeX: 0
                relativeY: tabButton.height-tabButton.radius
            }

        }
    }
}
