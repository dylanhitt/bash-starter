#!/usr/bin/env bash

#===  FUNCTION  ================================================================
#          NAME:  log
#     PARAMETER:  $1=text
#   DESCRIPTION:  Prints standard log output
#       EXAMPLE:  _util.log.log "Hello world"
#===============================================================================
_log() {
    line=$1
    printf "%s %s\n" "$(date +'%b %d %H:%M:%S')" "$line"
}

#===  FUNCTION  ================================================================
#          NAME:  color_print
#     PARAMETER:  $1=color, $2=emphasis, $3=text
#   DESCRIPTION:  Prints string with desired color and emphasis
#       EXAMPLE:  _util.array.color_print red "My awesome string"
#===============================================================================
_util.text.special_print() {
    local default_style='\e[0m'
    local color=$(_set_color ${1}); shift
    local emphasis=$(_set_emphasis $2); shift
    local text=$@
    local style="\e[${emphasis};${color}m"
    
    echo -e "${style}${text}${default_style}"
}

_set_color() {
    local color="37"
    case $1 in
        black) color="30";;
        red) color="31";;
        green) color="32";;
        yellow) color="33";;
        blue) color="34";;
        purple) color="35";;
        cyan) color="36";;
        white) color="37";;
    esac
    
    echo $color
}

_set_emphasis() {
    local emphasis="0"
    case $1 in
        bold) emphasis="1";;
        underline) emphasis="4";;
    esac
    
    echo $emphasis
}
