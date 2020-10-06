import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import "../import"

T.Popup {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    padding: 6

    background: Rectangle {
        color:"red"// control.palette.window
        border.color: control.palette.mid
        radius: HorusTheme.baseRadius
    }

    T.Overlay.modal: Rectangle {
        color: HorusTheme.accentColor
    }

    T.Overlay.modeless: Rectangle {
        color: HorusTheme.accentColor
    }
}
