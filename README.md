**This action is no longer maintained!**

Instead of this action, you can use the following workflow (which is much
simpler as it does not need creation of a custom container):

    name: Formatting

    on: pull_request

    jobs:
      format:
        name: C++ Formatting
        runs-on: ubuntu-20.04
        steps:
          - uses: actions/checkout@v2
          - uses: actions/setup-python@v2
          - run: wget https://raw.githubusercontent.com/machines-in-motion/mpi_cmake_modules/master/scripts/run-clang-format
          - run: wget https://raw.githubusercontent.com/machines-in-motion/mpi_cmake_modules/master/resources/_clang-format
          - run: python ./run-clang-format -r .

-------------------------------------------------------

# GitHub Action "mpi_cpp_format"

Check if the formatting of C++ code is compliant with `mpi_cpp_format` of
`mpi_cmake_modules`.

This is done by running `mpi_cpp_format` on the repository and then checking if
this resulted in any change (in which case the check fails).


## Example usage

Example workflow checking for "FIXME" in pull requests.

    name: Formatting

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
