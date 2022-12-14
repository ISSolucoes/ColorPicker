cmake_minimum_required(VERSION 3.16)

project(ColorPicker2 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appColorPicker2
    main.cpp utilitarios.h utilitarios.cpp
    MANUAL_FINALIZATION
)

qt_add_qml_module(appColorPicker2
    URI ColorPicker2
    VERSION 1.0
    QML_FILES main.qml
    RESOURCES utilitarios.h utilitarios.cpp
)

set_target_properties(appColorPicker2 PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

set_property(TARGET appColorPicker2 APPEND PROPERTY
    QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
)

target_link_libraries(appColorPicker2
    PRIVATE Qt6::Quick)

install(TARGETS appColorPicker2
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

qt_finalize_executable(appColorPicker2)
