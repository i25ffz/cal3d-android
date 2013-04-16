#By default, the headers and libraries for the minimal C++ runtime system
#library (/system/lib/libstdc++.so) are used when building C++ sources.
#
#You can however select a different implementation by setting the variable
#APP_STL to something else in your Application.mk, for example:
#
#system              -> Use the default minimal C++ runtime library.
#stlport_static      -> Use STLport built as a static library.
#stlport_shared      -> Use STLport built as a shared library.
#gnustl_static       -> Use GNU libstdc++ as a static library.

APP_STL = gnustl_static

APP_ABI := armeabi-v7a

