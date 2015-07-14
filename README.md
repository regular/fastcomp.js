llvm.js
=======

LLVM compiled to JavaScript using Emscripten

forked from kripken/llvm.js

How to build
------------

1. Install emscripten using homebrew (see [here](https://kripken.github.io/emscripten-site/docs/getting_started/downloads.html) for alternatives)

    ``` shell
    brew update
    brew install emscripten
    ```
    > Follow hombrew's instruction on how to edit ~/.emscripten
    
2. Generte the Bitcode files

    ``` shell
    git clone https://github.com/regular/emscripten-fastcomp
    cd emscripten-fastcomp
    git checkout emscripten-build-fix
    ./make-bitcode-for-javascript.sh
    ```
    > This wil take *a very long time* to complete.

3. Copy relevant Bitcode files

    ``` shell
    cp ../emscripten-fastcomp/bitcode-for-javascript/{llvm-as, llvm-dis, opt} .
    ```

4. Generate Javascript

    ``` shell
    ./doit.sh
    ```
    

