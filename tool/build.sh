#!/bin/bash
PWD=`pwd`
docker run --rm -i -t -v ${PWD}:/src kagerouttepaso/tplx bash -c "cd /src && make clean && make"
