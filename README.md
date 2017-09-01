# Video to minio/music
-----------------------------

This is a simple [OpenFAAS](https://github.com/alexellis/faas)openfaas function, that takes a [youtube-dl](https://rg3.github.io/youtube-dl/) supported link, extracts music and uploads it to a minio service.

# Installation
There are images on docker hub, but because OpenFAAS at the moment does not have any clean ways of supplying environment variables to the function post build, you 
will have to build it yourself with the correct ENV variables. see `./build.sh` for an example with all required build arguments

## Build arguments
`KEY` & `SECRET` - Minio access key and secret key 

`MINIO_PATH` = The bucket, do not add any `/` or the server host name

`SERVER_URL` = The URL to the server. ex: `http://127.0.0.1:9000`. Including the protocol part is imperative

## Uses
None really. I use it for load testing my FAAS cluster etc. At time of writing, the job will not report back anything useful, and often throws a 500 error message, if the job takes more than a few seconds.