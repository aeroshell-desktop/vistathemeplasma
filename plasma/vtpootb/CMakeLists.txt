# SPDX-FileCopyrightText: 2025 WackyIdeas <wackyideas@disroot.org>
# SPDX-License-Identifier: BSD-3-Clause
configure_file(config.h.cmake config.h)

kauth_install_actions(io.gitgud.catpswin56.ootb kauth.actions)

ecm_setup_version(${PROJECT_VERSION}
    VARIABLE_PREFIX VTPOOTB
    VERSION_HEADER "${CMAKE_CURRENT_BINARY_DIR}/src/version-vtpootb.h"
)
configure_file(config.h.cmake src/config.h)

add_executable(vtpootbcursor_authhelper src/ootbauthhelper.cpp src/ootbauthhelper.h)
target_link_libraries(vtpootbcursor_authhelper KF6::AuthCore KF6::ConfigCore KF6::I18n Qt6::DBus Qt6::Core)

install(TARGETS vtpootbcursor_authhelper DESTINATION ${KAUTH_HELPER_INSTALL_DIR})
kauth_install_helper_files(vtpootbcursor_authhelper io.gitgud.catpswin56.ootb root)

add_subdirectory(src)
