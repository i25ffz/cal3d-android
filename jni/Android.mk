LOCAL_PATH := $(call my-dir)

###################################################
#                      cal3d                      #
###################################################
include $(CLEAR_VARS)

LOCAL_MODULE := cal3d

LOCAL_CFLAGS := -Os -fexceptions

LOCAL_SRC_FILES = \
	$(subst $(LOCAL_PATH)/,, \
	$(wildcard $(LOCAL_PATH)/cal3d/*.cpp))
# LOCAL_ARM_MODE := arm
include $(BUILD_STATIC_LIBRARY)

LOCAL_EXPORT_C_INCLUDES := cal3d

###################################################
#                    cal3d_jni                    #
###################################################
include $(CLEAR_VARS)

LOCAL_MODULE := cal3d_jni
#TARGET_PLATFORM := android-8
	
USE_OPENGL_ES_1_1 := true

ifeq ($(USE_OPENGL_ES_1_1), true)
    OPENGLES_LIB  := -lGLESv1_CM
	OPENGLES_DEF  := -DUSE_OPENGL_ES_1_1
else
    OPENGLES_LIB  := -lGLESv2
	OPENGLES_DEF  := -DUSE_OPENGL_ES_2_0
endif

LOCAL_CFLAGS := -Wno-write-strings $(OPENGLES_DEF) -fexceptions -Os 

LOCAL_STATIC_LIBRARIES := cal3d

LOCAL_LDLIBS := \
    -llog $(OPENGLES_LIB)
	
ifeq ($(TARGET_ARCH_ABI),x86)
LOCAL_CFLAGS += -fno-stack-protector 
endif
	
LOCAL_C_INCLUDES :=	inc	\
					inc/Base \
					inc/GameState \
					inc/Utils	\
					inc/GUI	\
					program
					
LOCAL_SRC_FILES :=  src/Base/ARGameProgram.cpp	\
					src/Base/GameStateManager.cpp \
					src/Base/AndroidWrapper.cpp	\
					src/GUI/Shape.cpp	\
					src/GUI/Sprite.cpp	\
					src/GameState/RenderState.cpp	\
					program/model.cpp	 \
					program/menu.cpp	\
					program/demo.cpp	\
					program/tga.cpp
				
# LOCAL_ARM_MODE := arm

include $(BUILD_SHARED_LIBRARY)
