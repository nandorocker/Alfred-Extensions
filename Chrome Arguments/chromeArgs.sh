#!/bin/sh

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
url=""
incognito=""

while getopts "h?iu:" opt; do
    case "$opt" in
    h|\?)
        #show_help
        exit 0
        ;;
    i)  incognito="-incognito"
        ;;
    u)  url=$OPTARG
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

#echo "incognito=$incognito, url='$url', Leftovers: $@"
open -a /Applications/Google\ Chrome.app --args $incognito $url

# End of file