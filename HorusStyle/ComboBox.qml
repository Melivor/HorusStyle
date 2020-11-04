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
            font:control.font
            color:control.palette.text
            topPadding: 4
            leftPadding: 4 - control.padding
            rightPadding: 4 - control.padding +imageIndicator.width
            bottomPadding: 4
        }
    }

    indicator: ColorImage {
        id:imageIndicator
        x: control.mirrored ? control.padding +10: control.width - width - control.padding -10
        y: control.topPadding + (control.availableHeight - height) / 2
        color: control.editable ? control.palette.text : control.palette.buttonText
        source: "qrc:/HorusStyle/icones/arrow@4x.png"
        width: 15
        height: 15
        fillMode: Image.PreserveAspectFit
    }

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
        selectionColor:palette.highlight
        selectedTextColor:palette.highlightedText
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
                color: palette.base
            }
        }

//        Rectangle {
//            x: 1 - control.leftPadding
//            y: 1
//            width: control.width - 2
//            height: control.height - 2
//            color: "transparent"
//            border.color: Color.transparent(palette.mid, 40 / 255)
//            visible: control.activeFocus
//            radius: 1.7
//        }
    }

    background: Rectangle{
        color: palette.base
        implicitWidth: 150
        implicitHeight: 40
        radius: HorusTheme.baseRadius
        border.width: 0.5
        border.color: hovered?control.palette.highlight:palette.mid
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
                border.color:palette.highlight
                radius: HorusTheme.baseRadius
                //y: list.currentItem.y
            }
        }

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            //delegate: control.delegate
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0
            highlightMoveVelocity: 0
            highlightResizeDuration: 0

            T.ScrollBar.vertical: ScrollBar { }
            highlight:highlight
        }

        background: Rectangle {
            color: palette.window//control.popup.palette.window
            border.color: palette.mid
            radius: HorusTheme.baseRadius

        }
    }
}
