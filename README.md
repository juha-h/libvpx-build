HOW TO BUILD libvpx FOR ANDROID

- Clone this repo and go to its `vpx` directory

- Clone libvpx source to `jni` directory:
```
git clone https://github.com/webmproject/libvpx.git -b v1.13.1 jni
```
- Give the following commands in vpx directory:
```
rm -rf obj
cd jni
./libvpx/configure --target=$(VPX_TARGET) --as=yasm \
	--enable-external-build --enable-static --enable-realtime-only \
	--enable-vp8 --enable-vp9 --enable-vp9-highbitdepth \
	--enable-runtime-cpu-detect --enable-better-hw-compatibility \
	--enable-small \
	--disable-examples --disable-debug --disable-gprof --disable-gcov \
	--disable-unit-tests --disable-tools --disable-docs --disable-webm-io \
	--disable-internal-stats --disable-debug-libs
$(NDK_PATH)/ndk-build \
	APP_PLATFORM=$(PLATFORM) APP_ABI=$(ANDROID_TARGET_ARCH)
```
where
- `VPX_TARGET` is `armv7-android-gcc`, `arm64-android-gcc`, or `x86_64-android-gcc`
- `NDK_PATH` is path to your Android NDK (tested with version 26.2.11394342)
- `APP_PLATFORM` is `android-API_LEVEL`
- `APP_ABI` is `armeabi-v7`, `arm64-v8a`, or `x86_64`.

If everyhing worked OK, path to the lib is `obj/local/arm64-v8a/libvpx.a` and include files are in `vpx/jni/libvpx` directory.

Inspired by https://github.com/denghe/libvpx_prebuilt.

 
