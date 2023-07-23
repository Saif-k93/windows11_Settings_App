cmake_minimum_required(VERSION 3.16)

project(windows11_Settings VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)


find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Core Gui Widgets)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(windows11_Settings
    # C++
    main.cpp
    returncurrentindex.h
    returncurrentindex.cpp

    # ICON
    icon.rc
)

qt_add_qml_module(windows11_Settings
    URI windows11_Settings

    VERSION 1.0

    # QML
    QML_FILES
    Main.qml

    "qml/WindowHandler.qml"
    "qml/MainWindowFrame.qml"
    "qml/ListViewModels.qml"
    "qml/ListViewComponents.qml"
    "qml/LeftBarHandler.qml"
    "qml/RightBarHandler.qml"
    "qml/SystemTopBar.qml"
    "qml/SettingsTitle.qml"
    "qml/RListViewModels.qml"
    "qml/RListViewComponents.qml"
    "qml/DevicesTopBar.qml"
    "qml/DevicesModels.qml"
    "qml/DevicesComponents.qml"
    "qml/NetworkModels.qml"
    "qml/NetworkComponents.qml"
    "qml/NetworkTopBar.qml"
    "qml/ToDo.qml"

    # JavaScript
    "js/TitleBarHandler.js"
    "js/AccountDetails.js"
    "js/SearchBarHandler.js"
    "js/CustomSwitch.js"
    "js/CustomArrow.js"
    "js/ResizeImg.js"
    "js/ResizeLeftBarImg.js"
    "js/BlueRect.js"


    RESOURCES
    res.qrc
    QML_FILES


)

set_target_properties(windows11_Settings PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(windows11_Settings PRIVATE
    Qt6::Quick
    Qt6::Core
    Qt6::Gui
    Qt6::Widgets
)


install(TARGETS windows11_Settings
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
