import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import "../import"
//import HorusTheme 1.0
T.Button {
    id:control


    //font.bold: hovered?true:false
    // topInset:10
    // bottomInset: 10
    implicitHeight: 40
    implicitWidth: 100
    property color color: down?Qt.darker(palette.window,1.2):palette.window
    property color textColor: down?Qt.darker(palette.text,1.2):highlighted?HorusTheme.textLightColor:palette.text
    property color borderColor:  hovered?palette.highlight:palette.mid
//    contentItem:Item{
////        anchors.fill: button
////        anchors.bottomMargin: button.bottomInset
////        anchors.topMargin: button.topInset
////        anchors.leftMargin: button.leftInset
////        anchors.rightMargin: button.rightInset
//        Text{
//            text:button.text
//            // font.bold: true
//            // color:palette.window
//            anchors.centerIn: parent
//            font: button.font
//            opacity: enabled ? 1.0 : 0.3
//            horizontalAlignment: Text.AlignHCenter
//            verticalAlignment: Text.AlignVCenter
//            elide: Text.ElideRight
//            color: button.textColor

//        }
//        //
//    }

//    background:Rectangle{
////        anchors.fill: button
////        anchors.margins: padding
//        color: button.color
//        border.color: button.borderColor
//        radius: HorusTheme.baseRadius

//    }

    contentItem: IconLabel {
            spacing: control.spacing
            mirrored: control.mirrored
            display: control.display

            icon: control.icon
            text: control.text
            font: control.font
            color: control.palette.buttonText
        }
    background: ButtonPanel {
            implicitWidth: 80
            implicitHeight: 24

            control: control
            visible: !control.flat || control.down || control.checked || control.highlighted || control.visualFocus || control.hovered
        }
}
