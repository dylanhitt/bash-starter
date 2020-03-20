#!/usr/bin/env bash


#===  FUNCTION  ================================================================
#          NAME:  color_print
#     PARAMETER:  $1=color, $2=emphasis, $3=text
#   DESCRIPTION:  Prints string with desired color
#       EXAMPLE:  _util.array.color_print red "My awesome string"
#===============================================================================

_util.text.special_print() {
    local color=$1; shift
    local emphasis=$2; shift
    local text=$@

    

}

_set_color() {
    local color=$1 

    case $color in 
        black) return "30";;
          red) return "31";;
        green) return "32";;
       yellow) return "33";;
         blue) return "34";;
       purple) return "35";;
         cyan) return "36";;
        white) return "37";;
    esac
    
    return "37"
}

_get_font() {
    local emphasis=$1

    case $emphasis in
        bold) return "1";;
        underline) return "4";;
    esac

    return "0"
}