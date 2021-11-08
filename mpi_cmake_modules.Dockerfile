# Basic image that contains mpi_cmake_modules (installed in /ws/install)
FROM alpine

MAINTAINER Felix Widmaier <felix.widmaier@tuebingen.mpg.de>

RUN apk --no-cache add build-base cmake git python3 python3-dev py3-pip py3-wheel
RUN pip3 install --no-cache-dir -U colcon-common-extensions

RUN mkdir /ws
RUN cd /ws; git clone https://github.com/machines-in-motion/mpi_cmake_modules.git
RUN pip3 install --no-cache-dir -r /ws/mpi_cmake_modules/requirements.txt
RUN cd /ws; colcon build

# clean up a bit to reduce image size
RUN rm -rf /ws/build /ws/logs /ws/mpi_cmake_modules
RUN apk del build-base cmake python3-dev py3-wheel
