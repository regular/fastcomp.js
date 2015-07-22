
var llc = function(bitcode) {
  var errorMessage = '';
  var Module = {
    arguments: ['-O3', '-march=js', 'llvm.bc'],
    preRun: function() {
      FS.createDataFile('/', 'llvm.bc', bitcode, true, false);
    },
    stderr: function(chr) {
      if (chr) errorMessage += String.fromCharCode(chr);
    }
  };

