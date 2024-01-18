#!/usr/bin/sh

cmake -G Ninja ../llvm \
-DLLVM_TARGETS_TO_BUILD="X86" \
-DLLVM_ENABLE_PROJECTS=\
'clang;lldb;lld;clang-tools-extra;compiler-rt;mlir' \
-DLLVM_USE_LINKER=gold \
-DLLVM_PARALLEL_COMPILE_JOBS=$(nproc) \
-DLLVM_PARALLEL_LINK_JOBS=$[$(nproc) / 2] \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_EXPORT_COMPILE_COMMANDS=ON
