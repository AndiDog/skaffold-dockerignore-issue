FROM busybox:1.31.0

RUN mkdir /src
WORKDIR /src
COPY . .

# Check that at unignored files and directories got synced
RUN find .
RUN ls -la .gitmodules
RUN ls -la CMakeLists.txt
RUN ls -ld etc
RUN ls -ld CPlusPlusCode
RUN ls -ld submodules
RUN ls -la etc/.gitkeep
RUN ls -la CPlusPlusCode/.gitkeep
RUN ls -la submodules/.gitkeep
