#!/bin/bash

DEFAULT_VERSION='latest'
DEFAULT_PATH='/dr01/qadapps/yab'
YAB_DOWNLOAD_URL='http://packages.qad.com/packages/yab-client'

printHelp() {
    printf '%s\n' 'YAB client updater'
    printf '%s%s%s\n' 'Usage: ' $0 ' [OPTION]'
    printf '\n'
    printf '%s\t%s\n' '  -h, --help' 'Print this help and exit'
    printf '%s\t%s%s\n' '  -v, --version' 'Version to download, default: ' $DEFAULT_VERSION
    printf '%s\t%s%s\n' '  -p, --path' 'Install directory, default: ' $DEFAULT_PATH
    printf '\n'
    printf '\n'
    printf '%s\n' 'Examples:'
    printf '\n'
    printf '\t%s\n' $0
    printf '%s\n' '  Download latest client to default folder'
    printf '\n'
    printf '\t%s%s\n' $0 ' -v:1.0.0.0 -p:/temp'
    printf '%s\n' '  Download 1.0.0.0 client to /temp'
    printf '\n'
}

version=$DEFAULT_VERSION
yab_path=$DEFAULT_PATH

# Parse arguments
for arg in "$@"
do
    index=$(echo $arg | cut -f1 -d:)
    val=$(echo $arg | cut -f2 -d:)
    case $index in
        -h|--help)
            printHelp
            exit
            ;;

        -v|--version)
            version=$val
            ;;

        -p|--path)
            yab_path=$val
            ;;
    esac
done

# Create (if necessary) and clear yab client folder
printf '%s%s\n' 'Using path: ' $yab_path
mkdir -p $yab_path
cd $yab_path
rm -rf *

# Download and unzip
printf '%s%s\n' 'Downloading version: ' $version
wget -O yab-client-${version}.zip ${YAB_DOWNLOAD_URL}/${version}/resources
unzip yab-client-${version}.zip
chmod 777 yab
rm yab-client-${version}.zip
