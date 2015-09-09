SET pwd=%~dp0
docker run --rm -i -t -v %pwd%:/src kagerouttepaso/tplx bash -c "cd /src && make clean && make"
