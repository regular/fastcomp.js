
var llvmOpt = function(bitcode) {
  var Module = {
    arguments: ['-O3', '-o', 'llvm-optimized.bc', 'llvm-orig.bc'],
    preRun: function() {
      FS.createDataFile('/', 'llvm-orig.bc', bitcode, true, false);
    }
  };

