# docker-privoxy

Privoxy is a "privacy enhancing proxy", filtering Web pages and removing advertisements. This docker container runs privoxy over Alpine Linux in 6 Mb uncompressed image.

The image can be pulled from https://hub.docker.com/r/caligari/privoxy/

## Run privoxy

(please, __read the security note below__)

    docker run -d --name=privoxy -p 8118:8118 caligari/privoxy:latest

Or, translate a sock5s service at `1.2.3.4:1234` to HTTP:

    docker run -d --name=privoxy -p 8118:8118 caligari/privoxy:latest privoxy-start.sh 1.2.3.4:1234
    
## Test privoxy

      curl --proxy http://localhost:8118/ http://ifconfig.es
      
## Security note

This container should be executed in a local host or in a VPN.

Please, don't execute this docker in a host accesible from the internet with -p parameter because it __bypass the Linux firewall__ and you could be opening an __anonymous internet door__.

