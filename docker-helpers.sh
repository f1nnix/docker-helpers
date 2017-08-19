function print_header() {
  TEXT=$1
  TEXT_LENGTH=${#TEXT} 
  TERMINAL_COLS=$(tput cols)
  SECTION_LENGTH=$(((TERMINAL_COLS-TEXT_LENGTH)/2))
  SECTION=$(printf "%-${SECTION_LENGTH}s" "=")
  # echo "$SECTION$TEXT$SECTION"
  echo "${SECTION// /=}$TEXT${SECTION// /=}"
}

function docker_machine_list() {
  docker-machine ls
}

function docker_machine_ssh() {
  MACHINE=""
  if [ -z "$1" ]
  then
    echo "Nothing to ssh. Exiting"
    return 0
  else
    MACHINE="$1"

  fi

  docker-machine ssh $MACHINE
}

function docker_machine_regenerate_certs() {
  MACHINE=""
  if [ -z "$1" ]
  then
    echo "Nothing to regenerate. Exiting"
    return 0
  else
    MACHINE="$1"

  fi

  docker-machine regenerate-certs $MACHINE
}

function docker_machine_env() {
  MACHINE=""
  if [ -z "$1" ]
  then
    echo "Nothing to start. Exiting"
    return 0
  else
    MACHINE="$1"

  fi

  docker-machine start $MACHINE
  docker-machine env $MACHINE
  eval $(docker-machine env $MACHINE)
  # stats
  print_header "VOLUMES"
  docker volume ls
  print_header "IMAGES"
  docker images
  print_header "CONTAINERS"
  docker ps -a
}

function docker_constainer_list() {
  docker ps -a
}

function docker_constainer_bash() {
  CONTAINER=""
  if [ -z "$1" ]
  then
    echo "no container specifies. Exiting"
    return 0
  else
    CONTAINER="$1"
  fi
  docker exec -it $CONTAINER bash
}

function docker_container_restart_attach() {
  CONTAINER=""
  if [ -z "$1" ]
  then
    echo "no container specifies. Exiting"
    return 0
  else
    CONTAINER="$1"
  fi
  docker restart $CONTAINER
  docker attach $CONTAINER
}

function docker_container_command() {
  CONTAINER=""
  if [ -z "$1" ]
  then
    echo "no container specifies. Exiting"
    return 0
  else
    CONTAINER="$1"
    COMMAND="$2"
  fi
  docker exec -it $CONTAINER $2
}

# docker-machine shortcuts
alias dml="docker_machine_list"
alias dms="docker_machine_ssh $1"
alias dme="docker_machine_env $1"
alias dmrc="docker_machine_regenerate_certs $1"
# docker shortcuts
alias dcl="docker_constainer_list"
alias dcb="docker_constainer_bash $1"
alias dcs="docker_constainer_bash $1"
alias dcra="docker_container_restart_attach $1"
alias dcc="docker_container_command $1 $2"