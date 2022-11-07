cmake_minimum_required(VERSION 3.16)

project(ColorPicker VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_INSTALL_LIBDIR "lib")

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appColorPicker
    main.cpp qmlclipboardadapter.h qmlclipboardadapter.cpp Privacy_Policy.txt LICENSE.txt
    MANUAL_FINALIZATION
)

qt_add_qml_module(appColorPicker
    URI ColorPicker
    VERSION 1.0
    QML_FILES main.qml 
)

set_target_properties(appColorPicker PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

set_property(TARGET appColorPicker APPEND PROPERTY
    QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
)

target_link_libraries(appColorPicker
    PRIVATE Qt6::Quick)

install(TARGETS appColorPicker
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

qt_finalize_executable(appColorPicker)
