# docker-observium
A set of containers to run Observium in Docker. Uses Træfik reverse proxy and Ofelia for easy cron job scheduling. RRD files will be persisted and preserved in a named Docker volume.

## Requirements
- Docker in a x86_64 environment
- docker-compose
- Træfik reverse proxy

## Træfik setup
Since docker-observium is using a pre-defined network it shares with Træfik, it has to be created first using 
```docker network create web```

docker-observium relies on Træfik for reverse proxying and automatic Let's Encrypt SSL certificate generation. It has to be installed first (see Træfik documentation).
The traefik.toml could look like this: 
```debug = false
checkNewVersion = true
logLevel = "ERROR"
defaultEntryPoints = ["https","http"]

[entryPoints]
  [entryPoints.http]
  address = ":80"
    [entryPoints.http.redirect]
    entryPoint = "https"
  [entryPoints.https]
  address = ":443"
  [entryPoints.https.tls]
[retry]

[docker]
endpoint = "unix:///var/run/docker.sock"
domain = "observium.example.com"
watch = true
exposedbydefault = false

[acme]
email = "me@example.com"
storage = "acme.json"
entryPoint = "https"
OnHostRule = true
```

## Generate default config
Use the provided ```generate-config.sh``` shell script to generate a default configuration file for docker-observium and edit the admin password and domain name in the generated ```docker-observium.conf``` before you start the containers. 
## Running the containers
A simple ```docker-compose up -d``` will download all referenced images, build the Observium container and run it in the background. Check the container logs for errors and don't forget to check Træfik's log as well. If everything is up & running, you should be able to log in to Observium using the admin user and the password in docker-observium.conf.
