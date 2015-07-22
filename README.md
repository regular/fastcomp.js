fastcomp.js
=======

LLVM llc and emscripten-fastcomp compiled to JavaScript using Emscripten

Inspired by [kripken/llvm.js](http://github.com/kripken/llvm.js)

## [DEMO](http://regular.github.io/fastcomp.js/demo.html)

How to build
------------

1. Install emscripten using homebrew (see [here](https://kripken.github.io/emscripten-site/docs/getting_started/downloads.html) for alternatives)

    ``` shell
    brew update
    brew install emscripten
    ```
    > Follow hombrew's instruction on how to edit ~/.emscripten
    
2. get emscripten-fastcomp (a fork of llvm) 

    ``` shell
    git clone https://github.com/kripken/emscripten-fastcomp
    cd emscripten-fastcomp
    git checkout incoming
    cd -
    ```

2. Generte the Bitcode files
    
    > clone and follow instructions in [regular/make-llvm-bitcode-for-javascript](http://github.com/regular/make-llvm-bitcode-for-javascript)

3. Copy relevant Bitcode files

    ``` shell
    cp ../make-llvm-bitcode-for-javascript/bitcode-for-javascript/{llvm-as, llvm-dis, opt, llc} .
    ```

4. Generate Javascript

    ``` shell
    ./doit.sh
    ```

