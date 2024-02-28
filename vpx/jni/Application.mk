#APP_ABI := arm64-v8a
#APP_PLATFORM := android-24

ifeq ($(findstring x86,$(APP_ABI)),)
	APP_STL := c++_static
endif

APP_OPTIM := release
