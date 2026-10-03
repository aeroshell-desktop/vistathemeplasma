import QtQuick

import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore

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

PlasmaCore.Dialog {
    id: iconUser

    objectName: "orb"

    // flags: Qt.WindowTransparentForInput
    location: "Floating"
    type: PlasmaCore.Dialog.Notification
    title: "aeroshell-floatingorb"
    backgroundHints: PlasmaCore.Types.NoBackground // Prevents a dialog SVG background from being drawn.

    visible: stickOutOrb
    onVisibleChanged: {
        tim.start();
    }

    // The actual orb button, this dialog window is just a container for it.
    mainItem: FloatingOrb {
        id: floatingOrbIcon

        Timer {
            id: tim
            property int c: 0
            interval: 1
            repeat: true
            onTriggered: {
                console.log("orb positioning start");
                var pos = kicker.mapToGlobal(kicker.x, kicker.height);
                console.log(pos);
                iconUser.x = pos.x;
                iconUser.y = Screen.height - iconUser.height;
                console.log("orb positioning end");
                Plasmoid.setOrb(orbW);

                if (c++ == 5) {
                    stop();
                }
            }
        }
    }
}
