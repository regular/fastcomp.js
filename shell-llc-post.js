
  var outputFile = FS.root.contents['llvm.s'];
  if (outputFile) {
    return intArrayToString(FS.root.contents['llvm.s'].contents);
  } else {
    throw errorMessage || 'unknown error';
  }
};

