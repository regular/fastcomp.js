# as
emcc --memory-init-file 0 -Oz -v --llvm-lto 3 --pre-js shell-as-pre.js --post-js shell-as-post.js llvm-as.bc -o llvm-as.js
# dis
emcc --memory-init-file 0 -Oz -v --llvm-lto 3 --pre-js shell-dis-pre.js --post-js shell-dis-post.js llvm-dis.bc -o llvm-dis.js
emcc --memory-init-file 0 -Oz -v --llvm-lto 3 --pre-js shell-opt-pre.js --post-js shell-opt-post.js opt.bc -o opt.js
emcc --memory-init-file 0 -Oz -v --llvm-lto 3 --pre-js shell-llc-pre.js --post-js shell-llc-post.js llc.bc -o llc.js
