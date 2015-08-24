mkdir build
cd build
emconfigure ../configure --host=asmjs-unknown-emscripten --disable-assembly --disable-threads --enable-cpuinfo=false CFLAGS="-O2" 2>&1 | tee build.log
emmake make 2>&1 | tee -a build.log

cd ..
cp -a ../test .
cd test
emcc -O2 --js-opts 0 -g4 testdraw2.c -I../../include ../build/libSDL2main.a ../build/libSDL2_test.a -o a.html
