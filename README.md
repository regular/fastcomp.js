This is my fork of llvm.js - I am basically messing around with it, testing out some ideas.

1. [Building fastcomp](http://llvm.org/docs/tutorial/LangImpl4.html)

    mkdir llvmjs-fastcomp
    cd llvmjs-fastcomp
    git clone https://github.com/kripken/emscripten-fastcomp
    cd emscripten-fastcomp
    git clone https://github.com/kripken/emscripten-fastcomp-clang tools/clang
    mkdir build
    cd build
    ../configure --enable-optimized --disable-assertions --enable-targets=host,js
    make -j4
    cs Release/bin
    LLVM_ROOT=$(pwd)
    cd ../../../../..
    git clone https://github.com/kripken/emscripten.git
    cp ~/.emscripten ~/.emscripten.old
    cd emscripten
    ./emcc # creates ~/.emscripten
    echo "LLVM_ROOT=\"$LLVM_ROOT\"" >> ~/.emscripten
    ./emcc tests/hello_world.cpp

###    
    cd ../llvmjs-fastcomp/emscripten-fastcomp
    mkdir llvmjs-build
    cd llvmjs-build
    CPPFLAGS="-Wno-warn-absolute-paths" ../../../emscripten/emconfigure ../configure --enable-optimized --enable-targets=host,js --enable-libcpp --disable-jit --disable-threads --disable-pthread --disable-assertions
    mkdir -p Release/bin
    cp ../build/Release/bin/llvm-tblgen Release/bin
    chmod +x Release/bin/llvm-tblgen
    
remove TableGen from utils/Makefile
    
    ../../../emscripten/emmake make
    
commented-out fopen64 and freinds from emscripten/system/include/libc/stdio.h
    
    curl https://raw.githubusercontent.com/kripken/Relooper/master/ministring.h > ../lib/Target/JSBackend/ministring.h
    
removed llvm-config from tools/Makefile
removed tools/llvm-coonfig from ./Makefile

    cp ../build/Release/bin/llvm-config Release/bin
 
--- gave up on trying to compile fastcomp with emscripten.
###

Now trying vanilla llvm-3.6.1 instead.

    curl http://llvm.org/releases/3.6.1/llvm-3.6.1.src.tar.xz
    tar -xyf llvm-3.6.1.src.tar.xz
    cd llvm-3.6.1.src
    mkdir llvmjs-build
    cd llvmjs-build
    CPPFLAGS="-Wno-warn-absolute-paths" ../../emscripten/emconfigure ../configure --enable-optimized --enable-targets=x86 --enable-libcpp --disable-jit --disable-threads --disable-pthreads --disable-assertions  

commented-out fopen64 and freinds from emscripten/system/include/libc/stdio.h
commented-out fstat64 and freinds from emscripten/system/include/libc/sys/stat.h
remove TableGen from utils/Makefile
    
    mkdir -p Release/bin
    cp ../../llvmjs-fastcomp/emscripten-fastcomp/build/Release/bin/llvm-tblgen Relese/bin
    ../../emscripten/emmake make -j4
    *** No rule to make target `/Users/regular/dev/llvm-3.6.1.src/llvmjs-build/Release/lib/libLLVMX86Disassembler.a', needed by `/Users/regular/dev/llvm-3.6.1.src/llvmjs-build/Release/bin/llvm-nm'.  Stop.
    Giving u compiling llvm-3.6.1 with manually built emscripten/fastcomp

###

Trying homebrew emscripten and llvm-3.6.1

    mkdir build
    cd build
    emconfigure ../configure --enable-optimized --enable-targets=x86 --enable-libcpp --disable-jit --disable-threads --disable-pthreads

did native build with same options
put #undefs before enum feturing fopen64 and friends
(that's a change in an llvm header to work around #define vandalism in emscripten)
same for fstat stuff
buld produces output Release+Assert/bin. The files don't have a suffix, but they actually are bc files.

 
---
Original readme follows

llvm.js
=======

LLVM compiled to JavaScript using Emscripten


Generating the Bitcode
----------------------

In a build directory under llvm root, run

    emconfigure ../configure --enable-optimized --enable-targets=x86 --enable-libcpp --disable-jit --disable-threads --disable-pthreads
    emmake make

You will hit errors on attempting to use tblgen and others, the build system is self-executing, but we generate bitcode that is unrunnable. When the errors happen, copy in the file from a parallel native build, and edit the Makefile of the parent dir (for llvm-tblgen, utils/, for llvm-config, tools/ and ./) that generates that file to not call it (otherwise, running make again will go back and overwrite the one you just copied in). Re-run make.

You may also hit errors on all-targets including Hexagon stuff, not sure why. To avoid that, edit the Makefiles and replace all-targets with x86 (specifically, in tools/opt, tools/llc. Note that these seem to be created/updated on the fly, as the later ones only show up after you fix earlier bugs, requiring multiple invocations of make.)

Then copy from the bin/ directory the relevant bitcode files to here, with suffix .bc

TODO: automate all preceding steps

Run doit.sh

