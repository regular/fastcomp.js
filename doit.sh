# as
emcc --memory-init-file 0 -O2 -v --llvm-lto 3 --pre-js shell-as-pre.js --post-js shell-as-post.js llvm-as.bc -o llvm-as.js
# dis
emcc --memory-init-file 0 -O2 -v --llvm-lto 3 --pre-js shell-dis-pre.js --post-js shell-dis-post.js llvm-dis.bc -o llvm-dis.js
emcc --memory-init-file 0 -O2 -v --llvm-lto 3 --pre-js shell-opt-pre.js --post-js shell-opt-post.js opt.bc -o opt.js
