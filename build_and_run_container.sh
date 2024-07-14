#!/bin/bash

BUILD=false
SCRIPT_DIR="$(pwd)"
OUTPUT_DIR="$(pwd)/output"

show_help() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -b, --build             Build the Docker image"
    echo "  -s, --script-dir DIR    Path to the script directory"
    echo "  -o, --output-dir DIR    Path to the output directory"
    echo "  -h, --help              Display this help message"
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -b|--build) BUILD=true ;;
        -s|--script-dir) SCRIPT_DIR="$2"; shift ;;
        -o|--output-dir) OUTPUT_DIR="$2"; shift ;;
        -h|--help) show_help; exit 0 ;;
        *) echo "Unknown option: $1"; show_help; exit 1 ;;
    esac
    shift
done

if [ "$BUILD" = true ]; then
    docker build -t dionysus_env .
fi

if [ -z "$SCRIPT_DIR" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "Error: Both script directory and output directory must be specified."
    show_help
    exit 1
fi

docker run \
    -v "$SCRIPT_DIR:/usr/src/app" \
    -v "$OUTPUT_DIR:/usr/src/app/output" \
    dionysus_env
