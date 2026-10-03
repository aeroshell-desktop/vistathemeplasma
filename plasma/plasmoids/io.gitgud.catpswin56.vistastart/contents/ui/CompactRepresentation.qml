/***************************************************************************
 *   Copyright (C) 2013-2014 by Eike Hein <hein@kde.org>                   *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .        *
 ***************************************************************************/

import QtQuick 2.0
import QtQuick.Layouts 1.1

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.kwindowsystem 1.0

import org.kde.kirigami as Kirigami

Item {
    id: root

    Layout.minimumHeight: floatingOrbPanel.scaledHeight / 3;
    Layout.maximumHeight: floatingOrbPanel.scaledHeight / 3;
    Layout.minimumWidth: floatingOrbPanel.scaledWidth;
    Layout.maximumWidth: floatingOrbPanel.scaledWidth;
    width: Layout.maximumWidth
    height: Layout.maximumHeight

    Binding {
        target: kicker
        property: "Layout.minimumHeight"
        value: root.Layout.minimumHeight
    }

    Binding {
        target: kicker
        property: "Layout.maximumHeight"
        value: root.Layout.maximumHeight
    }

    Binding {
        target: kicker
        property: "Layout.minimumWidth"
        value: root.Layout.minimumWidth
    }

    Binding {
        target: kicker
        property: "Layout.maximumWidth"
        value: root.Layout.maximumWidth
    }

    property QtObject contextMenu: null
    readonly property bool editMode: Plasmoid.containment.corona.editMode
    readonly property bool inPanel: (Plasmoid.location == PlasmaCore.Types.TopEdge || Plasmoid.location == PlasmaCore.Types.RightEdge || Plasmoid.location == PlasmaCore.Types.BottomEdge || Plasmoid.location == PlasmaCore.Types.LeftEdge)
    property bool menuShown: dashWindow.visible
    property QtObject orbW: null
    property alias orbTimer: orbTimer
    readonly property var screenGeometry: Plasmoid.screenGeometry

    // Should the orb be rendered in its own dialog window so that it can stick out of the panel?
    readonly property bool stickOutOrb: (Plasmoid.location == PlasmaCore.Types.TopEdge || Plasmoid.location == PlasmaCore.Types.BottomEdge) && Plasmoid.configuration.stickOutOrb && kicker.height <= 30 && !editMode
    readonly property bool useCustomButtonImage: (Plasmoid.configuration.useCustomButtonImage)
    readonly property bool vertical: (Plasmoid.formFactor == PlasmaCore.Types.Vertical)

	property vector2d orbPos: Qt.vector2d(0, 0)

    // If the url is empty (default value), then use the fallback url. Otherwise, return the url path relative to
    // the location of the source code.
    function getResolvedUrl(url, fallback) {
        if (url.toString() === "" || !Plasmoid.fileExists(url)) {
            return Qt.resolvedUrl(fallback);
        }
        return url;
    }

    function positionOrb() {
        console.log("positioning orb");
    }

    function showMenu() {
        dashWindow.visible = !dashWindow.visible;
        dashWindow.showingAllPrograms = dashWindow.mainItemCount == 0;
        dashWindow.m_searchField.focus = true;
    }

    Component.onCompleted: {
        dashWindow = Qt.createQmlObject("MenuRepresentation {}", kicker);
        orbW = Qt.createQmlObject("StartOrb {}", kicker);
        orbW.width = floatingOrbPanel.scaledWidth;
        orbW.height = floatingOrbPanel.scaledHeight / 3;

        positionOrb();

        orbTimer.start();
        Plasmoid.activated.connect(function () {
            showMenu();
        });
    }

    Connections {
        target: Plasmoid.configuration
        function onCustomButtonImageChanged() {
            positionOrb();
        }
        function onOrbWidthChanged() {
            positionOrb();
        }
    }

    Connections {
        function onScreenChanged() {
            orbTimer.start();
        }
        function onScreenGeometryChanged() {
            orbTimer.start();
        }

        target: kicker
    }

    /*
     * Three IconItems are used in order to achieve the same look and feel as Windows 7's
     * orbs. When the menu is closed, hovering over the orb results in the hovered icon
     * gradually appearing into view, and clicking on the orb causes an instant change in
     * visibility, where the normal and hovered icons are invisible, and the pressed icon
     * is visible.
     *
     * When they're bounded by the panel, these icons will by default try to fill up as
     * much space as they can in the compact representation while preserving their aspect
     * ratio.
     */
    FloatingOrb {
        id: floatingOrbPanel

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        objectName: "innerorb"

        opacity: !stickOutOrb
    }

    // Handles all mouse events for the popup orb
    MouseArea {
        id: mouseAreaCompositingOff

        acceptedButtons: Qt.LeftButton | Qt.RightButton
        anchors.fill: parent
        hoverEnabled: true
        propagateComposedEvents: true

        onPressed: mouse => {
            if(mouse.button === Qt.LeftButton)
                showMenu();
            else
                mouse.accepted = false;
        }
        z: 99
    }


    // Even worse, this just makes things even more unsophisticated. If someone has a better
    // way of solving this, I would love to know.
    Timer {
        id: orbTimer

        interval: 15

        onTriggered: {
            Plasmoid.setOrb(orbW);
        }
    }
}
