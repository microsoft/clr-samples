#!/bin/sh

[ -z "${CORECLR_PATH:-}" ] && CORECLR_PATH=~/coreclr
[ -z "${BuildOS:-}"      ] && BuildOS=Linux
[ -z "${BuildArch:-}"    ] && BuildArch=x64
[ -z "${BuildType:-}"    ] && BuildType=Debug
[ -z "${Output:-}"       ] && Output=CorProfiler.so

printf '  CORECLR_PATH : %s\n' "$CORECLR_PATH"
printf '  BuildOS      : %s\n' "$BuildOS"
printf '  BuildArch    : %s\n' "$BuildArch"
printf '  BuildType    : %s\n' "$BuildType"

printf '  Building %s ... ' "$Output"

CXX_FLAGS="$CXX_FLAGS --no-undefined -Wno-invalid-noreturn -fPIC -fms-extensions -DHOST_AMD64 -DHOST_64BIT -DBIT64 -DPAL_STDCPP_COMPAT -DPLATFORM_UNIX -std=c++11"
INCLUDES="-I $CORECLR_PATH/src/coreclr/pal/inc/rt -I $CORECLR_PATH/src/coreclr/pal/prebuilt/inc -I $CORECLR_PATH/src/coreclr/pal/inc -I $CORECLR_PATH/src/coreclr/inc -I $CORECLR_PATH/artifacts/bin/coreclr/$BuildOS.$BuildArch.$BuildType/inc"

clang++ -shared -o $Output $CXX_FLAGS $INCLUDES ClassFactory.cpp CorProfiler.cpp dllmain.cpp ILRewriter.cpp $CORECLR_PATH/src/coreclr/pal/prebuilt/idl/corprof_i.cpp

printf 'Done.\n'
