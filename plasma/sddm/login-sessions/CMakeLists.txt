configure_file(startvtp-wayland.cmake ${CMAKE_CURRENT_BINARY_DIR}/startvtp-wayland)
install(
        FILES
                ${CMAKE_CURRENT_BINARY_DIR}/startvtp-wayland
        PERMISSIONS
                OWNER_EXECUTE GROUP_EXECUTE WORLD_EXECUTE OWNER_WRITE OWNER_READ GROUP_READ WORLD_READ
        DESTINATION
                ${CMAKE_INSTALL_FULL_BINDIR}
)

configure_file(vistathemeplasma.desktop.cmake ${CMAKE_CURRENT_BINARY_DIR}/vistathemeplasma.desktop)
install(
        FILES
                ${CMAKE_CURRENT_BINARY_DIR}/vistathemeplasma.desktop
        DESTINATION
                ${KDE_INSTALL_DATADIR}/wayland-sessions
)

