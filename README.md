pgBackRest Builder
===

A Docker container to build arbitrary versions of [pgBackRest][PG].

## Build with provided script

### Latest version
`./build.sh`

### Specific version
`VERSION=2.37 ./build.sh`

Replace "2.37" with the desired version number.

## Build manually

### Building the container
`docker build -t pgbackrestbuilder .`

You can use any valid tag you prefer

### Build the latest version

`docker run pgbackrestbuilder`

Upon completion, the container will display a command to copy the resulting binary to the host.

### Build a specific version

`docker run -e VERSION=2.37 pgbackrestbuilder`

Replace "2.37" with the desired version number.

Upon completion, the container will display a command to copy the resulting binary to the host.

## Caveats

* The build script will leave the container present, it is up to the user to remove it.

* The build script uses a container-id file (`.cid`). If a build fails, the container-id file must be manually removed.

* The compile script assumes the pgBackRest project uses the "release/$VERSION" release tagging scheme. This only affects building a specific version.

* The compile script will use all allocated CPU to compile. (`make -j`)

<!-- Footnotes/Links -->
[PG]: https://pgbackrest.org/ "pgBackRest homepage"
