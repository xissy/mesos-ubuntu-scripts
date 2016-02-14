sudo docker run -d --restart always -p 80:80 --name marathon-lb mesosphere/marathon-lb:v1.0.1 sse --marathon http://marathon.taeho.tech:8080 --health-check --group external
