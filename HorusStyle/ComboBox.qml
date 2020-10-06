import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Templates 2.15 as T
import QtQuick.Controls 2.15
import QtQuick.Controls.impl 2.15
import "../import"

T.ComboBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    leftPadding: padding + (!control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)
    rightPadding: padding + (control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)

    delegate: MenuItem {
        id:menuItem
        width: parent.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
        background:Rectangle{
            color:"transparent"
            implicitHeight: 40
            radius:HorusTheme.baseRadius
        }
        contentItem:Text{
            text:menuItem.text
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }


    }

    //    indicator: ColorImage {
    //        x: control.mirrored ? control.padding : control.width - width - control.padding
    //        y: control.topPadding + (control.availableHeight - height) / 2
    //        color: control.editable ? control.palette.text : control.palette.buttonText
    //        source: "qrc:/qt-project.org/imports/QtQuick/Controls.2/Fusion/images/arrow.png"
    //        width: 20
    //        fillMode: Image.Pad
    //    }

    contentItem: T.TextField {
        topPadding: 4
        leftPadding: 4 - control.padding
        rightPadding: 4 - control.padding
        bottomPadding: 4

        text: control.editable ? control.editText : control.displayText

        enabled: control.editable
        autoScroll: control.editable
        readOnly: control.down
        inputMethodHints: control.inputMethodHints
        validator: control.validator
        selectByMouse: control.selectTextByMouse

        font: control.font
        color: control.editable ? control.palette.text : control.palette.buttonText
        selectionColor: control.palette.highlight
        selectedTextColor: control.palette.highlightedText
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        background: PaddedRectangle {
            clip: true
            radius: 2
            padding: 1
            leftPadding: control.mirrored ? -2 : padding
            rightPadding: !control.mirrored ? -2 : padding
            color: control.palette.base
            visible: control.editable && !control.flat

            Rectangle {
                x: parent.width - width
                y: 1
                width: 1
                height: parent.height - 2
                color: HorusTheme.backgroundColor
            }
        }

        Rectangle {
            x: 1 - control.leftPadding
            y: 1
            width: control.width - 2
            height: control.height - 2
            color: "transparent"
            border.color: Color.transparent(HorusTheme.borderColor, 40 / 255)
            visible: control.activeFocus
            radius: 1.7
        }
    }

    background: Rectangle{
        color: HorusTheme.foregroundColor
        implicitWidth: 150
        implicitHeight: 40
        radius: HorusTheme.baseRadius
        border.width: 0.5
        border.color: hovered?HorusTheme.highlightedBorderColor:HorusTheme.borderColor
    }

    popup: T.Popup {
        width: control.width
        height: Math.min(contentItem.implicitHeight + 2, control.Window.height - topMargin - bottomMargin)
        topMargin: 6
        bottomMargin: 6
        palette: control.palette
        padding: 1

        Component {
            id: highlight
            Rectangle {
                width: 180; height: 40
                border.color: HorusTheme.highlightedBorderColor
                radius: HorusTheme.baseRadius
                //y: list.currentItem.y
            }
        }
        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightRangeMode: ListView.ApplyRange
            highlightMoveDuration: 0

            T.ScrollBar.vertical: ScrollBar { }
            highlight:highlight
        }

        background: Rectangle {
            color: HorusTheme.backgroundColor//control.popup.palette.window
            border.color: HorusTheme.borderColor
            radius: HorusTheme.baseRadius

        }
    }
}

//T.ComboBox{
//    id:comboBox
//   // font.bold: hovered?true:false
//    property alias horizontalAlignement: text.horizontalAlignment
//    implicitWidth:160
//    implicitHeight:40
//    leftPadding: 10
//    //indicator.visible: enabled

//    background: Rectangle{
//        color: HorusTheme.foregroundColor
//        //implicitHeight: 50
//        radius: HorusTheme.baseRadius
//        border.width: 0.5
//        border.color: hovered?HorusTheme.highlightedBorderColor:HorusTheme.borderColor
//    }

//    contentItem:Item{

//        Text{
//            id:text
//            width: parent.width
//            height: parent.height
//            verticalAlignment: Text.AlignVCenter
//            horizontalAlignment: Text.AlignHCenter
//            //anchors.centerIn: parent
//            text:comboBox.displayText
//            color: palette.text
//        }
//    }
//    popup: Popup {
//            y: comboBox.height +5
//            width: comboBox.width
//            implicitHeight: contentItem.implicitHeight
//            padding: 1

//            contentItem: ListView {
//                clip: true
//                implicitHeight: contentHeight
//                model: comboBox.popup.visible ? comboBox.delegateModel : null
//                currentIndex: comboBox.highlightedIndex

//                ScrollIndicator.vertical: ScrollIndicator { }
//            }

//            background: Rectangle {
//                border.color: HorusTheme.borderColor
//                color:HorusTheme.foregroundColor
//                radius: HorusTheme.baseRadius
//            }
//        }
//}
