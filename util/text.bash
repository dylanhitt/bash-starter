#!/usr/bin/env bash

#===  FUNCTION  ================================================================
#          NAME:  log
#     PARAMETER:  $1=type, $2=text to log
#   DESCRIPTION:  Prints standard log output and level
#       EXAMPLE:  _util.log.log "Hello world"
#===============================================================================
_text.log() {
    local log_level=$(_set_log_level $1); shift
    local line=$@
    
    if [[ $log_level == "[]" ]]; then
        err_message="Must provide a valid log level!\n"
        options="Levels: INFO, WARN, DEBUG, ERROR\n"
        example='Example: _text.log <level> "My awesome log"'
        echo -e "$(_text.log ERROR "${err_message}${options}${example}")"
        exit 1
    fi
    
    echo -e  "$log_level $(date +'%b %d %H:%M:%S') $line"
}

_set_log_level() {
    local level=$1
    local return_level=""
    
    case $1 in
        INFO)
            return_level=$(_text.special_print white bold "INFO")
        ;;
        WARN)
            return_level=$(_text.special_print yellow bold "WARN")
        ;;
        DEBUG)
            return_level=$(_text.special_print cyan bold "DEBUG")
        ;;
        ERROR)
            return_level=$(_text.special_print red bold "ERROR")
        ;;
    esac
    
    echo -e "[$return_level]"
}

#===  FUNCTION  ================================================================
#          NAME:  color_print
#     PARAMETER:  $1=color, $2=emphasis, $3=text
#   DESCRIPTION:  Prints string with desired color and emphasis
#       EXAMPLE:  _util.array.color_print red "My awesome string"
#===============================================================================
_text.special_print() {
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
