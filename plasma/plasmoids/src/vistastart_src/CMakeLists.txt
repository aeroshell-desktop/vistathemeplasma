cmake_minimum_required(VERSION 3.16)

project(io.gitgud.catpswin56.vistastart)
 
find_package(ECM 1.4.0 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})
set(CMAKE_AUTOMOC ON)
set(QT_MAJOR_VERSION 6)

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(FeatureSummary)

find_package(Qt6 CONFIG REQUIRED COMPONENTS
    Quick Core WaylandClient
)

find_package(KF6 REQUIRED COMPONENTS
    WindowSystem Svg Config
    Service I18n CoreAddons
)

find_package(Plasma REQUIRED)
find_package(PlasmaQuick REQUIRED)
find_package(PlasmaWaylandProtocols REQUIRED)
find_package(Wayland REQUIRED COMPONENTS Client)

add_subdirectory(src)

feature_summary(WHAT ALL FATAL_ON_MISSING_REQUIRED_PACKAGES)
