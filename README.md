# GitHub Action "mpi_cpp_format"

Check if the formatting of C++ code is compliant with `mpi_cpp_format` of
`mpi_cmake_modules`.

This is done by running `mpi_cpp_format` on the repository and then checking if
this resulted in any change (in which case the check fails).


## Example usage

Example workflow checking for "FIXME" in pull requests.

    on: pull_request

    jobs:
      format:
        name: Check C++ formatting
        runs-on: ubuntu-latest
        steps:
        - name: checkout
          uses: actions/checkout@v2
        - name: mpi_cpp_format
          uses: luator/github_action_mpi_cpp_format@master
