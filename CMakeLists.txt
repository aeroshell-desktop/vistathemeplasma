cmake_minimum_required(VERSION 3.16)
project(vistathemeplasma-desktop)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(ECM 6.0.0 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})

set(PROJECT_VERSION "6.8.0")
set(PROJECT_VERSION_MAJOR 6)

set(CMAKE_AUTOMOC ON)

include(KDEInstallDirs)
include(KDECMakeSettings)

include(KDECompilerSettings NO_POLICY_SCOPE)
remove_definitions(-DQT_NO_CAST_FROM_ASCII)

include(ECMMarkNonGuiExecutable)
include(ECMOptionalAddSubdirectory)
include(ECMQtDeclareLoggingCategory)
include(ECMQueryQt)
include(ECMInstallIcons)
include(ECMConfiguredInstall)
include(ECMGenerateDBusServiceFile)
include(ECMFindQmlModule)
include(ECMGenerateExportHeader)
include(ECMSetupVersion)
include(ECMGenerateQmlTypes)
include(ECMDeprecationSettings)
include(ECMQmlModule)
include(CMakePackageConfigHelpers)
include(WriteBasicConfigVersionFile)
include(CheckIncludeFiles)
include(FeatureSummary)

find_package(Qt6 REQUIRED COMPONENTS
    Widgets Quick Core Gui QuickControls2
    Widgets QuickWidgets DBus Svg GuiPrivate
    Concurrent Core5Compat Sql WaylandClient
)

find_package(LayerShellQt REQUIRED)
find_package(LibNotificationManager REQUIRED)
find_package(Wayland REQUIRED COMPONENTS Client)
find_package(Qt6WaylandClient COMPONENTS Private)

find_package(KF6 REQUIRED COMPONENTS
    I18n Kirigami CoreAddons QQC2DesktopStyle
    IconThemes Auth Crash Config KCMUtils
    NewStuff KIO Notifications NotifyConfig Attica
    Runner GlobalAccel GuiAddons DBusAddons
    WidgetsAddons Codecs Sonnet Package IconThemes
    XmlGui Svg WindowSystem Service
)

ecm_find_qmlmodule(org.kde.kirigami REQUIRED)

find_package(KWin REQUIRED COMPONENTS
    kwin
)

find_package(Plasma ${PROJECT_VERSION} REQUIRED)
find_package(Plasma5Support ${PROJECT_VERSION} REQUIRED)
find_package(PlasmaQuick ${PROJECT_VERSION} REQUIRED)
find_package(PlasmaActivities ${PROJECT_VERSION} REQUIRED)
find_package(PlasmaActivitiesStats ${PROJECT_VERSION} REQUIRED)
find_package(PlasmaWaylandProtocols 1.23.0 REQUIRED)

add_subdirectory(plasma)
add_subdirectory(misc)
add_subdirectory(libpositionmanager)

feature_summary(WHAT ALL FATAL_ON_MISSING_REQUIRED_PACKAGES)
