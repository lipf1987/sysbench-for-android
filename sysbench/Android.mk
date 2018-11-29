LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  tests/cpu/sb_cpu.c
LOCAL_MODULE := libsbcpu
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  tests/fileio/sb_fileio.c tests/fileio/crc32.c 
LOCAL_MODULE := libsbfileio
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  tests/memory/sb_memory.c
LOCAL_MODULE := libsbmemory
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  tests/mutex/sb_mutex.c
LOCAL_MODULE := libsbmutex
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  tests/threads/sb_threads.c
LOCAL_MODULE := libsbthreads
include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_SRC_FILES := scripting/sb_script.c scripting/script_lua.c
LOCAL_MODULE := libsbscript
LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/scripting/lua/src/

include $(BUILD_STATIC_LIBRARY)

#include $(CLEAR_VARS)
#LOCAL_SRC_FILES :=  tests/fileio/sb_fileio.c tests/fileio/crc32.c 
#LOCAL_MODULE := libsbfileio
#include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := db_driver.c sb_logger.c sb_options.c sb_percentile.c sb_timer.c sysbench.c 
LOCAL_STATIC_LIBRARIES := libsbcpu
LOCAL_STATIC_LIBRARIES += libsbfileio
LOCAL_STATIC_LIBRARIES += libsbmemory
LOCAL_STATIC_LIBRARIES += libsbmutex
LOCAL_STATIC_LIBRARIES += libsbthreads
LOCAL_STATIC_LIBRARIES += libsbscript
#LOCAL_STATIC_LIBRARIES += libpthread
LOCAL_MODULE :=sysbench 
LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../includes
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../
LOCAL_C_INCLUDES += $(LOCAL_PATH)/tests/
#LOCAL_MODULE_PATH :=  output path of module!
include $(BUILD_EXECUTABLE)

