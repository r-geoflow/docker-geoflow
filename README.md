# docker-geoflow

The `docker-geoflow` provides a way to run the [geoflow](https://github.com/r-geoflow/geoflow) as Docker container / command line. The image exposes the `geoflow::executeWorkflow` main R function used to execute geoflows from a configuration file (JSON or YAML).

## Pull the `geoflow` Docker image

```
docker pull ghcr.io/r-geoflow/geoflow:latest
```

## Try with a geoflow basic workflow

```
#Get an example of configuration file
wget -O config.json https://raw.githubusercontent.com/r-geoflow/geoflow/refs/heads/master/inst/extdata/workflows/config_metadata_gsheets.json

#Run geoflow as container
docker run --rm -v "$(pwd):/data" ghcr.io/r-geoflow/geoflow /data/config.json
```