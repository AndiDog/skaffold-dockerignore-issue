Works with Docker:

```
$ docker build . --no-cache
Sending build context to Docker daemon  5.632kB
Step 1/13 : FROM busybox:1.31.0
 ---> db8ee88ad75f
Step 2/13 : RUN mkdir /src
 ---> Running in bced53478884
Removing intermediate container bced53478884
 ---> 2d14b93a2540
Step 3/13 : WORKDIR /src
 ---> Running in da81bc512fc4
Removing intermediate container da81bc512fc4
 ---> 00b15f2328aa
Step 4/13 : COPY . .
 ---> d447481391d9
Step 5/13 : RUN find .
 ---> Running in 2f7283549795
.
./submodules
./submodules/.gitkeep
./.gitmodules
./CMakeLists.txt
./etc
./etc/.gitkeep
./CPlusPlusCode
./CPlusPlusCode/.gitkeep
Removing intermediate container 2f7283549795
 ---> b98fb1cb0ce0
Step 6/13 : RUN ls -la .gitmodules
 ---> Running in 6d6a1fe329c3
-rw-r--r--    1 root     root             0 Jul 30 20:42 .gitmodules
Removing intermediate container 6d6a1fe329c3
 ---> acf250e691b0
Step 7/13 : RUN ls -la CMakeLists.txt
 ---> Running in 9a1325801426
-rw-r--r--    1 root     root             0 Jul 30 20:42 CMakeLists.txt
Removing intermediate container 9a1325801426
 ---> cb91f8ea02be
Step 8/13 : RUN ls -ld etc
 ---> Running in c1523a9fef59
drwxr-xr-x    2 root     root          4096 Jul 30 20:49 etc
Removing intermediate container c1523a9fef59
 ---> 968f04788aa3
Step 9/13 : RUN ls -ld CPlusPlusCode
 ---> Running in 3e17d360d67f
drwxr-xr-x    2 root     root          4096 Jul 30 20:49 CPlusPlusCode
Removing intermediate container 3e17d360d67f
 ---> 56254832ce6f
Step 10/13 : RUN ls -ld submodules
 ---> Running in 926ed1b83e3d
drwxr-xr-x    2 root     root          4096 Jul 30 20:49 submodules
Removing intermediate container 926ed1b83e3d
 ---> e39fa445ec4b
Step 11/13 : RUN ls -la etc/.gitkeep
 ---> Running in 453ba3a8f6d7
-rw-r--r--    1 root     root             0 Jul 30 20:43 etc/.gitkeep
Removing intermediate container 453ba3a8f6d7
 ---> dcdbbdcea035
Step 12/13 : RUN ls -la CPlusPlusCode/.gitkeep
 ---> Running in 1965fd443699
-rw-r--r--    1 root     root             0 Jul 30 20:43 CPlusPlusCode/.gitkeep
Removing intermediate container 1965fd443699
 ---> ee8a135d4992
Step 13/13 : RUN ls -la submodules/.gitkeep
 ---> Running in 4b192611d590
-rw-r--r--    1 root     root             0 Jul 30 20:43 submodules/.gitkeep
Removing intermediate container 4b192611d590
 ---> 5b5cdacef38c
Successfully built 5b5cdacef38c
```

Fails with Skaffold (different context transmitted to Docker):

```
$ skaffold version
v0.34.1
```

```
$ skaffold build
Generating tags...
 - skaffold-dockerignore-issue -> WARN[0000] Unable to find git commit: Running [git rev-list -1 HEAD --abbrev-commit]: stdout , stderr: fatal: ambiguous argument 'HEAD': unknown revision or path not in the working tree.
Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'
, err: exit status 128: exit status 128
skaffold-dockerignore-issue:dirty
Tags generated in 16.777227ms
Starting build...
Building [skaffold-dockerignore-issue]...
Sending build context to Docker daemon  3.072kB
Step 1/13 : FROM busybox:1.31.0
 ---> db8ee88ad75f
Step 2/13 : RUN mkdir /src
 ---> Using cache
 ---> db0c07a71ec5
Step 3/13 : WORKDIR /src
 ---> Using cache
 ---> ca957b8d0b82
Step 4/13 : COPY . .
 ---> 1a85b44a3fdf
Step 5/13 : RUN find .
 ---> Running in 0feac82347a7
.
./.gitmodules
./CMakeLists.txt
./Dockerfile
Removing intermediate container 0feac82347a7
 ---> 9c8063f1a255
Step 6/13 : RUN ls -la .gitmodules
 ---> Running in 00f6bce80a61
-rw-r--r--    1 root     root             0 Jul 30 20:42 .gitmodules
Removing intermediate container 00f6bce80a61
 ---> a545dd5deaf0
Step 7/13 : RUN ls -la CMakeLists.txt
 ---> Running in cebe1f0069d6
-rw-r--r--    1 root     root             0 Jul 30 20:42 CMakeLists.txt
Removing intermediate container cebe1f0069d6
 ---> 0e9981a51336
Step 8/13 : RUN ls -ld etc
 ---> Running in 39934e0e5547
ls: etc: No such file or directory
Removing intermediate container 39934e0e5547
FATA[0008] build failed: building [skaffold-dockerignore-issue]: build artifact: unable to stream build output: The command '/bin/sh -c ls -ld etc' returned a non-zero code: 1
```
