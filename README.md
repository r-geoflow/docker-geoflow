# docker-geoflow

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Build Status](https://github.com/r-geoflow/docker-geoflow/actions/workflows/docker-build-image.yml/badge.svg?branch=main)](https://github.com/r-geoflow/docker-geoflow/actions/workflows/docker-build-image.yml)

The `docker-geoflow` provides a way to run the [geoflow](https://github.com/r-geoflow/geoflow) as Docker container / command line. The image exposes the `geoflow::executeWorkflow` main R function used to execute geoflows from a configuration file (JSON or YAML).

## Pull the `geoflow` Docker image

```
docker pull ghcr.io/r-geoflow/geoflow:latest
```

## Try with a `geoflow` basic workflow

```
#Get an example of configuration file
wget -O config.json https://raw.githubusercontent.com/r-geoflow/geoflow/refs/heads/master/inst/extdata/workflows/config_metadata_gsheets.json

#Run geoflow as container
docker run --rm -v "$(pwd):/data" ghcr.io/r-geoflow/geoflow /data/config.json
```

## How to access a workflow job directory

The Docker geoflow service is run as container, which is removed once the execution is finished. In order to access the jobs directory, it is necessary to establish a link between the container directory, and the machine where Docker is executed. For this, we can mount a volume adding `-v "$(pwd)/geoflow-jobs:/srv/geoflow/jobs"` to the above Docker `run` instruction, as follows:

```
docker run --rm -v "$(pwd):/data" -v "$(pwd)/geoflow-jobs:/srv/geoflow/jobs" ghcr.io/r-geoflow/geoflow /data/config.json
```

With this command:

* a local directory `geoflow-jobs` will be created (if not existing) in the current working directory (`${pwd}`)
* the `geoflow` job sub-directory created within the Docker container will be copied to the `geoflow-jobs` directory.

In this way you can run `geoflow` as Docker command line service (as "black-box") while persisting the outputs in your machine.


