import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import "../import"
//import HorusTheme 1.0
T.Button {
    id:button


    //font.bold: hovered?true:false
    // topInset:10
    // bottomInset: 10
    implicitHeight: 40
    implicitWidth: 100
    property color color: down?Qt.darker(HorusTheme.backgroundColor,1.2):HorusTheme.backgroundColor
    property color textColor: down?Qt.darker(HorusTheme.textColor,1.2):highlighted?HorusTheme.textLightColor:HorusTheme.textColor
    property color borderColor:  hovered?HorusTheme.highlightedBorderColor:HorusTheme.borderColor
    contentItem:Item{
//        anchors.fill: button
//        anchors.bottomMargin: button.bottomInset
//        anchors.topMargin: button.topInset
//        anchors.leftMargin: button.leftInset
//        anchors.rightMargin: button.rightInset
        Text{
            text:button.text
            // font.bold: true
            // color:HorusTheme.backgroundColor
            anchors.centerIn: parent
            font: button.font
            opacity: enabled ? 1.0 : 0.3
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            color: button.textColor

        }
        //
    }

    background:Rectangle{
//        anchors.fill: button
//        anchors.margins: padding
        color: button.color
        border.color: button.borderColor
        radius: HorusTheme.baseRadius

    }
}
