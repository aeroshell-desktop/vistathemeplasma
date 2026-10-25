set(positionmanagerplugin_SRCS
    positionmanager.cpp
)

add_library(positionmanager SHARED ${positionmanagerplugin_SRCS})

target_link_libraries(positionmanager
    PRIVATE
        Qt6::Core
        Qt6::Widgets
        Qt6::Quick
)

ecm_add_qml_module(positionmanager
    URI "vistathemeplasma.positionmanager"
    VERSION 0.1
    GENERATE_PLUGIN_SOURCE
    DEPENDENCIES QtCore
)
ecm_finalize_qml_module(positionmanager)

