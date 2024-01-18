FROM ubuntu:22.04

RUN apt update -y \
	&& apt install build-essential git ninja-build make cmake python3
	
WORKDIR "/root"
RUN git clone https://github.com/llvm/llvm-project.git

WORKDIR "./llvm-project"
RUN mkdir build

WORKDIR ./build
ADD llvm-compile-config.sh .

RUN chmod +x llvm-compile-config.sh && ./llvm-compile-config.sh \
	ninja -v && ninja install
