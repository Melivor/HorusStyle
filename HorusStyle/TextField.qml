import QtQuick 2.12
import QtQuick.Templates 2.13 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12

import "../import"
T.TextField {
    id:control
    color: acceptableInput?palette.text:HorusTheme.standardRed
    //horizontalAlignment: Qt.AlignHCenter
    implicitWidth: implicitBackgroundWidth + leftInset + rightInset
                   || Math.max(contentWidth, placeholder.implicitWidth) + leftPadding + rightPadding
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding,
                             placeholder.implicitHeight + topPadding + bottomPadding)
    padding: 12
    topPadding: padding - 7
    rightPadding: padding - 4
    bottomPadding: padding - 5
    verticalAlignment: TextInput.AlignVCenter
    PlaceholderText {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)

        text: control.placeholderText
        font: control.font
        color: control.placeholderTextColor
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
        verticalAlignment: control.verticalAlignment
        elide: Text.ElideRight
        renderType: control.renderType
    }
    background: Rectangle {
        //visible: editable?true:false
        implicitWidth: 150 // TextControlThemeMinWidth - 4 (border)
        implicitHeight: 40
        border.width: control.activeFocus ? 2 : 1
        color: control.palette.base
        border.color: control.activeFocus ? control.palette.highlight :control.palette.mid
        radius: HorusTheme.baseRadius
    }
}
