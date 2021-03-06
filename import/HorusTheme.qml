pragma Singleton
import QtQuick 2.12

QtObject{
    property int baseRadius: 0
    property color backgroundColor: Qt.hsla(0,0,250/255,1)
    property color foregroundColor: "white"
    property color emptyColor: "#e6e6e6"
    //property color borderColor: "light grey" replace with palette.mid
    //property color highlightedBorderColor: "steelblue" //replace with palette.highlight
    property color accentColor:Qt.hsla(0,0,0.15,0.95)//Qt.hsla(0,0,75/255,1)
    property color disableAccentColor:Qt.lighter(Qt.hsla(0,0,75/255,1),0.1)
    property color accentColorDisabled: Qt.hsla(0,0,150/255,1)
    //property color textColor: Qt.hsla(0,0,75/255,1) use palette.text
    property color textLightColor:Qt.hsla(0,0,150/255,1)
    property color textLightColorDisable:"light grey"
    property color standardRed:"indianred"
    property color standardBlue: Qt.hsla(155/255,120/255,115/255,1)
    property color standardGreen: "seagreen"
    property color standardYellow: "goldenrod"
    //property color : value
    property int sectionSpacing: 25
    property int sectionMargin:40
    property int baseMargin: 30
    property real baseMarginFactor: 0.15
    property real sectionMarginFactor: 0.08
    property int baseSpacing: 20
}
