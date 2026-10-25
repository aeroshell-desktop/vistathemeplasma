set(positionmanagerplugin_SRCS
    positionmanagerplugin.cpp positionmanager.cpp
)

add_library(positionmanagerplugin SHARED ${positionmanagerplugin_SRCS})

target_link_libraries(positionmanagerplugin
    PRIVATE
        Qt6::Core Qt6::DBus Qt6::Qml
        Qt6::Quick

        KF6::ConfigCore
)

install(TARGETS positionmanagerplugin DESTINATION ${KDE_INSTALL_QMLDIR}/vistathemeplasma/positionmanager)
install(FILES qmldir DESTINATION ${KDE_INSTALL_QMLDIR}/vistathemeplasma/positionmanager)

