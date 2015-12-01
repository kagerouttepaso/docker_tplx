#!/bin/bash
PWD=`pwd`
docker run --rm -v ${PWD}:/src tpip/tplx rebuild
