# TODO: adapt "org.kde.plasma" here & elsewhere if needed (see README)
add_definitions(-DTRANSLATION_DOMAIN=\"vistathemeplasma\")
remove_definitions(-DQT_NO_CAST_FROM_ASCII)

set(VistaStart_SRCS
    VistaStart.cpp
)

add_library(io.gitgud.catpswin56.vistastart MODULE ${VistaStart_SRCS})
qt_generate_wayland_protocol_client_sources(io.gitgud.catpswin56.vistastart
    FILES
        "${PLASMA_WAYLAND_PROTOCOLS_DIR}/plasma-shell.xml"
        "${Wayland_DATADIR}/wayland.xml"
    PRIVATE_CODE
)

target_link_libraries(io.gitgud.catpswin56.vistastart
    PRIVATE
        Wayland::Client
        Qt6::Gui
        Qt6::Quick
        KF6::I18n
        KF6::WindowSystem
        KF6::Svg
        KF6::ConfigCore
        KF6::ConfigGui
        KF6::CoreAddons
        KF6::Service
        Plasma
        PlasmaQuick
)

include_directories(/usr/include/Plasma /usr/include/KF6/KConfigCore/ /usr/include/KF6/KConfig/ /usr/include/KF6/KCoreAddons/ /usr/include/PlasmaQuick/)

install(TARGETS io.gitgud.catpswin56.vistastart DESTINATION ${KDE_INSTALL_PLUGINDIR}/plasma/applets)
