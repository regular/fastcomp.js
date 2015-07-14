
var llvmOpt = function(bitcode) {
  var Module = {
    arguments: ['llvm.bc', '-o', 'llvm-optimized.bc'],
    preRun: function() {
      FS.createDataFile('/', 'llvm.bc', bitcode, true, false);
    }
  };

