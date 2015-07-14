
  var outputFile = FS.root.contents['llvm-optimized.bc'];
  if (outputFile) {
    return new Uint8Array(outputFile.contents);
  } else {
    throw errorMessage || 'unknown error';
  }
};

