
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts 1.1
import QtQuick.Dialogs
import QtQuick.Window 2.1

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

import org.kde.plasma.private.kicker 0.1 as Kicker
import org.kde.coreaddons as KCoreAddons // kuser
import org.kde.plasma.private.shell 2.0

import org.kde.kwindowsystem 1.0

import org.kde.kirigami 2.13 as Kirigami

/*
 * This is the Dialog that displays the Start menu orb when it sticks out
 * of the panel. In principle, it works in almost the same way as the
 * Start menu user icon, in fact most of the code is directly copied from
 * there.
 *
 * Compared to the popup avatar, this dialog window should NOT have any
 * visualParent set, as it causes inexplicable behavior where the orb
 * moves away during certain interactions. I have no idea why it does that.
 *
 * This has been developed only for the bottom/south oriented panel, and
 * other orientations should receive support when I begin giving pretty
 * much *everything* else support for other orientations.
 *
 */

Window {
    id: iconUser
    flags: Qt.WindowTransparentForInput | Qt.FramelessWindowHint

    title: "__AEROSHELL_STARTORB"
    color: "transparent"

    visible: stickOutOrb

    FloatingOrb {
        id: floatingOrbIcon
        anchors.fill: parent
    }
}
