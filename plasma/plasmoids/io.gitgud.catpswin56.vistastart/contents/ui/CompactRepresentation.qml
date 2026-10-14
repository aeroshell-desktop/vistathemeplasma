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

import org.kde.kirigami as Kirigami

import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore

import aeroshell.components as AeroShellComponents

Item {
    id: root

    readonly property bool editMode: Plasmoid.containment.corona.editMode
    readonly property bool inPanel: (Plasmoid.location == PlasmaCore.Types.TopEdge || Plasmoid.location == PlasmaCore.Types.RightEdge || Plasmoid.location == PlasmaCore.Types.BottomEdge || Plasmoid.location == PlasmaCore.Types.LeftEdge)
    readonly property bool stickOutOrb: (Plasmoid.location == PlasmaCore.Types.TopEdge || Plasmoid.location == PlasmaCore.Types.BottomEdge) && Plasmoid.configuration.stickOutOrb && kicker.height <= 30 && !editMode

    property QtObject dashWindow: null

    Layout.minimumWidth: startButton.implicitWidth
    Layout.maximumWidth: startButton.implicitWidth
    Layout.minimumHeight: startButton.implicitHeight
    Layout.maximumHeight: startButton.implicitHeight

    implicitWidth: Layout.maximumWidth
    implicitHeight: Layout.maximumHeight

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

    function showMenu() {
        dashWindow.visible = !dashWindow.visible;
        dashWindow.showingAllPrograms = false;
        dashWindow.m_searchField.focus = true;
    }

    // If the url is empty (default value), then use the fallback url. Otherwise, return the url path relative to
    // the location of the source code.
    function getResolvedUrl(url, fallback) {
        if (url.toString() === "" || !Plasmoid.fileExists(url)) {
            return Qt.resolvedUrl(fallback);
        } else {
            return Qt.resolvedUrl(url);
        }
    }

    Connections {
        target: kicker

        function onScreenChanged() {
            startButton.repositionWindow();
        }
        function onScreenGeometryChanged() {
            startButton.repositionWindow();
        }
    }

    AeroShellComponents.StartButton {
        id: startButton

        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        floating: root.stickOutOrb
        buttonWidthOverride: Plasmoid.configuration.orbWidth
        toggled: dashWindow?.visible ?? false
        floatingOffset: 0
        animate: Plasmoid.configuration.fadeOrb
        textureSource: {
            var location = "";
            switch (Plasmoid.location) {
                case PlasmaCore.Types.LeftEdge:
                case PlasmaCore.Types.RightEdge:
                    location = "middle";
                    break;
                case PlasmaCore.Types.TopEdge:
                    location = "top";
                    break;
                case PlasmaCore.Types.BottomEdge:
                    location = "bottom";
                    break;
            }

            if (root.height > 30) {
                location = "middle";
            }

            return getResolvedUrl(Plasmoid.configuration.customButtonImage, "orbs/orb_" + location + ".png");
        }

        onClicked: root.showMenu();
    }

    Component.onCompleted: {
        dashWindow = Qt.createQmlObject("MenuRepresentation {}", kicker);
        Plasmoid.activated.connect(function () {
            showMenu();
        });
    }
}
