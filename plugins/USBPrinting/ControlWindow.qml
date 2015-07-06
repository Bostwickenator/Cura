// Copyright (c) 2015 Ultimaker B.V.
// Cura is released under the terms of the AGPLv3 or higher.

import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.1

import UM 1.0 as UM

UM.Dialog {
    width: 500 * Screen.devicePixelRatio;
    height: 100 * Screen.devicePixelRatio;

    title: "Print with USB"

    Column
    {
        anchors.fill: parent;
        Row
        {
            spacing: UM.Theme.sizes.default_margin.width;
            Text
            {
                //: USB Printing dialog label, %1 is head temperature
                text: qsTr("Extruder Temperature %1").arg(manager.extruderTemperature)
            }
            Text
            {
                //: USB Printing dialog label, %1 is bed temperature
                text: qsTr("Bed Temperature %1").arg(manager.bedTemperature)
            }
            Text
            {
                text: "" + manager.error
            }

        }

        ProgressBar
        {
            id: prog;
            anchors.left: parent.left;
            anchors.right: parent.right;

            minimumValue: 0;
            maximumValue: 100;
            value: manager.progress
        }
    }

    rightButtons: [
        Button {
            //: USB Printing dialog start print button
            text: qsTr("Print");
            onClicked: { manager.startPrint() }
            enabled: manager.progress == 0 ? true : false
        },
        Button
        {
            //: USB Printing dialog cancel print button
            text: qsTr("Cancel");
            onClicked: { manager.cancelPrint() }
            enabled: manager.progress == 0 ? false:  true
        }
    ]
}
