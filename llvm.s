
// EMSCRIPTEN_START_FUNCTIONS
function _main() {
 var $retval = 0, label = 0, sp = 0;
 sp = STACKTOP;
 STACKTOP = STACKTOP + 16|0;
 $retval = sp;
 HEAP32[$retval>>2] = 0;
 (_printf((8|0))|0);
 STACKTOP = sp;return 1;
}
function runPostSets() {

}
// EMSCRIPTEN_END_FUNCTIONS

/* memory initializer */ allocate([104,101,108,108,111,44,32,119,111,114,108,100,33,10,0], "i8", ALLOC_NONE, Runtime.GLOBAL_BASE);


// EMSCRIPTEN_METADATA
{
"declares": ["printf"],"redirects": {},"externs": [],"implementedFunctions": ["_main"],"tables": {},"initializers": [],"exports": [],"aliases": {},"cantValidate": "","simd": 0,"maxGlobalAlign": 1,"namedGlobals": {},"asmConsts": {},"asmConstArities": []
}
