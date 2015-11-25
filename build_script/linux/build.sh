#!/bin/bash
PWD=`pwd`
docker run --rm -v ${PWD}:/src kagerouttepaso/tplx rebuild
