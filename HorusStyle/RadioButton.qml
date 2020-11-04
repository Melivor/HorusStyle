import "../import"
import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12


T.RadioButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    padding: 6
    spacing: 6


    indicator: Rectangle{
        implicitWidth: 20
        implicitHeight: implicitWidth
        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
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

    contentItem: Text {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: control.font
        color: control.palette.text
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }
}

//T.RadioButton {
//    id:control
//    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
//                            implicitContentWidth + leftPadding + rightPadding)
//    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
//                             implicitContentHeight + topPadding + bottomPadding,
//                             implicitIndicatorHeight + topPadding + bottomPadding)
//    indicator: Rectangle{
//        implicitWidth: 20
//        implicitHeight: implicitWidth
//        x: control.leftPadding
//        y: parent.height / 2 - height / 2
//        radius: implicitWidth/2
//        opacity: control.down?0.3:1
//        border.color: HorusTheme.accentColor
//        Rectangle{
//            width: 10
//            height: width
//            anchors.centerIn: parent
//            radius: width/2
//            opacity: control.down?0.3:1
//            color: HorusTheme.accentColor
//            visible: control.checked
//        }
//    }
//}
