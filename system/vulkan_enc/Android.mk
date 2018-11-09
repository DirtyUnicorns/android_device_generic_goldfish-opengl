
# Autogenerated makefile
# android/android-emugl/host/libs/libOpenglRender/vulkan-registry/xml/genvk.py -registry android/android-emugl/host/libs/libOpenglRender/vulkan-registry/xml/vk.xml cereal -o android/android-emugl/host/libs/libOpenglRender/vulkan/cereal
# Please do not modify directly;
# re-run android/scripts/generate-vulkan-sources.sh,
# or directly from Python by defining:
# VULKAN_REGISTRY_XML_DIR : Directory containing genvk.py and vk.xml
# CEREAL_OUTPUT_DIR: Where to put the generated sources.
# python3 $VULKAN_REGISTRY_XML_DIR/genvk.py -registry $VULKAN_REGISTRY_XML_DIR/vk.xml cereal -o $CEREAL_OUTPUT_DIR

LOCAL_PATH := $(call my-dir)

$(call emugl-begin-shared-library,libvulkan_enc)
$(call emugl-export,C_INCLUDES,$(LOCAL_PATH))
$(call emugl-import,libOpenglCodecCommon$(GOLDFISH_OPENGL_LIB_SUFFIX) libandroidemu)

# Vulkan include dir
ifeq (true,$(GOLDFISH_OPENGL_BUILD_FOR_HOST))
LOCAL_C_INCLUDES += \
    $(LOCAL_PATH) \
    $(HOST_EMUGL_PATH)/host/include \
    $(HOST_EMUGL_PATH)/host/include/vulkan
endif

ifneq (true,$(GOLDFISH_OPENGL_BUILD_FOR_HOST))
LOCAL_C_INCLUDES += \
    $(LOCAL_PATH) \
    $(LOCAL_PATH)/../vulkan_enc \

LOCAL_HEADER_LIBRARIES += \
    vulkan_headers \

endif

LOCAL_CFLAGS += \
    -DLOG_TAG=\"goldfish_vulkan\" \
    -Wno-missing-field-initializers \
    -fstrict-aliasing \
    -DVK_USE_PLATFORM_ANDROID_KHR \
    -DVK_NO_PROTOTYPES \

LOCAL_SRC_FILES := Resources.cpp VulkanStream.cpp \
    ResourceTracker.cpp \
VkEncoder.cpp \
goldfish_vk_marshaling_guest.cpp \
goldfish_vk_deepcopy_guest.cpp \
goldfish_vk_handlemap_guest.cpp \


$(call emugl-end-module)

