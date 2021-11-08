#!/bin/sh
. /ws/install/setup.sh

mpi_cpp_format .

status_output=$(git status --porcelain)
if [[ ${status_output} ]]; then
    echo "mpi_cpp_format modified some files:"
    echo ${status_output}
    exit 1
else
    echo "No files modified by mpi_cpp_format."
    echo 0
fi
