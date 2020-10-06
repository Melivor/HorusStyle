import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import "../import"
T.Slider {
    id:control
    implicitWidth: orientation===Qt.Horizontal?150:15
    implicitHeight: orientation===Qt.Vertical?150:15
    handle: Rectangle{
        border.color: HorusTheme.accentColor
        x: control.leftPadding + (control.horizontal ? control.visualPosition * (control.availableWidth - width) : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : control.visualPosition * (control.availableHeight - height))
        implicitHeight: control.horizontal?control.height:control.width
        implicitWidth:implicitHeight
        radius: implicitHeight/2
    }

    background: Item {
        implicitWidth: control.availableWidth
        implicitHeight: control.availableHeight

        x: control.leftPadding + (control.horizontal ? 0 : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : 0)
        width: control.horizontal ? control.availableWidth : implicitWidth
        height: control.horizontal ? implicitHeight : control.availableHeight

        scale: control.horizontal && control.mirrored ? -1 : 1
        property int radius: control.horizontal?control.height/2:control.width/2
        Rectangle {
            x: control.horizontal ? 0 : (parent.width - width) / 2
            y: control.horizontal ? (parent.height - height) / 2 : 0
            width: control.horizontal ? parent.width : parent.width // SliderTrackThemeHeight
            height: !control.horizontal ? parent.height : parent.height
            radius: parent.radius
            color: control.hovered && !control.pressed ?HorusTheme.emptyColor :
                   control.enabled ? HorusTheme.emptyColor : HorusTheme.emptyColor
        }

        Rectangle {
            x: control.horizontal ? 0 : (parent.width - width) / 2
            y: control.horizontal ? (parent.height - height) / 2 : control.visualPosition * (parent.height-2*parent.radius)
            width: control.horizontal ? 2*parent.radius+control.position * (parent.width-2*parent.radius) : parent.width // SliderTrackThemeHeight
            height: !control.horizontal ? 2*parent.radius+control.position * (parent.height-2*parent.radius) : parent.height
            radius: parent.radius
            color: control.enabled ? HorusTheme.accentColor : HorusTheme.disableAccentColor
        }
    }
}
