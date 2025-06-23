terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
    #  local_exec = {
    #    source = "local"
    #  }
  }
}

#provider "docker" {
#  host = "unix:///var/run/docker.sock"
#  #host = "tcp://1.2.3.4:4243"
#}

